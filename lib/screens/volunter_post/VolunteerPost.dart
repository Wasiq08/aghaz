import 'dart:io';

import 'package:aghaz/bloc/image_bloc/image_bloc.dart';
import 'package:aghaz/bloc/image_bloc/image_event.dart';
import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/services/firebase_storage/StorageFirebase.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

class VolunteerPost extends StatefulWidget {
  @override
  _VolunteerPostState createState() => _VolunteerPostState();
}

class _VolunteerPostState extends State<VolunteerPost> {
  File _image;
  StorageFirebase storageFirebase;
  ImageBloc imageBloc;
  TextEditingController controllerProblem;
  TextEditingController controllerDetail;
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
                  maxLength: 60,
                  keyboardType: TextInputType.text,
                  attribute: "Detail",
                  decoration: InputDecoration(labelText: "Detail"),
                  validators: [
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(70),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, top: 16),
                child: Center(
                  child: RaisedButton.icon(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      if (_image == null ||
                          controllerProblem.text.isEmpty ||
                          controllerDetail.text.isEmpty) {
                      } else {
                        globalKey.currentState.showSnackBar(SnackBar(
                          content: Text("Please wait"),
                        ));
                        imageBloc.add(
                          UploadImage(
                              image: _image,
                              context: context,
                              title: controllerProblem.text,
                              detail: controllerDetail.text),
                        );
                      }
                    },
                    icon: Icon(
                      EvaIcons.arrowForward,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Next',
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
