import 'dart:io';

import 'package:aghaz/bloc/image_bloc/image_bloc.dart';
import 'package:aghaz/bloc/image_bloc/image_event.dart';
import 'package:aghaz/bloc/image_bloc/image_state.dart';
import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/services/firebase_storage/StorageFirebase.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class VolunteerPost extends StatefulWidget {
  final String problem;

  VolunteerPost({@required this.problem});

  @override
  _VolunteerPostState createState() => _VolunteerPostState();
}

class _VolunteerPostState extends State<VolunteerPost> {
  File _image;
  StorageFirebase storageFirebase;
  ImageBloc imageBloc;
  TextEditingController controllerProblem;
  TextEditingController controllerDetail;
  TextEditingController locationController;
  final globalKey = GlobalKey<ScaffoldState>();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    storageFirebase = StorageFirebase();
    controllerProblem = TextEditingController();
    controllerDetail = TextEditingController();
    locationController = TextEditingController();
    locationController.text = "Karachi, Sindh, Pakistan";
    imageBloc = ImageBloc(storageFirebase: storageFirebase);
    super.initState();
  }

  @override
  void dispose() {
    imageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return SafeArea(
      child: Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Text("Create Post"),
        ),
        body: Container(
          width: ScreenSize.blockSizeHorizontal * 100,
          height: ScreenSize.blockSizeVertical * 100,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(16),
            children: <Widget>[
              Center(
                child: Text(
                  "Create Post",
                  style: Theme.of(context).textTheme.display2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
              ),
              InkWell(
                onTap: () {
                  getImage();
                },
                child: Center(
                  child: _image == null
                      ? Container(
                          width: ScreenSize.blockSizeHorizontal * 50,
                          height: ScreenSize.blockSizeVertical * 25,
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(EvaIcons.image),
                          ),
                        )
                      : Container(
                          width: ScreenSize.blockSizeHorizontal * 80,
                          height: ScreenSize.blockSizeVertical * 40,
                          child: Image.file(_image),
                        ),
                  //Image.file(_image),
                ),
              ),
              FormBuilder(
                child: FormBuilderTextField(
                  controller: controllerProblem,
                  attribute: "Title",
                  maxLength: 30,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Title", hintText: 'Kachra Overload'),
                  validators: [
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(1),
                  ],
                ),
              ),
              FormBuilder(
                child: FormBuilderTextField(
                  controller: controllerDetail,
                  maxLength: 200,
                  keyboardType: TextInputType.text,
                  attribute: "Detail",
                  decoration: InputDecoration(labelText: "Detail"),
                  validators: [
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(70),
                  ],
                ),
              ),
              FutureBuilder<String>(
                  future: getLocation(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      locationController.text = snapshot.data;
                      return TextField(
                        onTap: () {},
                        controller: locationController,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          labelStyle: Theme.of(context).textTheme.subtitle,
                          suffixIcon: Icon(
                            EvaIcons.pin,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      );
                    }
                    return TextFormField(
                      onTap: () {},
                      controller: locationController,
                      decoration: InputDecoration(
                        labelText: 'Enter Location',
                        labelStyle: Theme.of(context).textTheme.subtitle,
                        suffixIcon: Icon(
                          EvaIcons.pin,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, top: 16),
                child: Center(
                  child: RaisedButton.icon(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      if (_image == null ||
                          controllerProblem.text.isEmpty ||
                          controllerDetail.text.isEmpty) {
                        globalKey.currentState.showSnackBar(SnackBar(
                          content: Text("Error enter required fields"),
                        ));
                      } else {
                        globalKey.currentState.showSnackBar(SnackBar(
                          content: Text("Please wait"),
                        ));
                        imageBloc.add(
                          UploadImage(
                              location: locationController.text,
                              problem: widget.problem,
                              image: _image,
                              context: context,
                              title: controllerProblem.text,
                              detail: controllerDetail.text),
                        );
                      }
                    },
                    icon: Icon(
                      EvaIcons.cloudUpload,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Upload',
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              BlocBuilder(
                bloc: imageBloc,
                builder: (context, state) {
                  if (state is ErrorImageState) {
                    return Container(
                      child: Icon(EvaIcons.email),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

//    List<Placemark> placemark = await Geolocator()
//        .placemarkFromCoordinates(position.latitude, position.longitude);
//    print(position.longitude);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    List<Address> address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var addresses = address.first;
    print(addresses.addressLine);

    return addresses.addressLine;
  }
}
