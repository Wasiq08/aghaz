import 'package:aghaz/bloc/authentication_bloc/bloc.dart';
import 'package:aghaz/bloc/register/register_bloc.dart';
import 'package:aghaz/bloc/register/register_event.dart';
import 'package:aghaz/bloc/register/register_state.dart';
import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/screens/HomeLogin.dart';
import 'package:aghaz/screens/SignInPage.dart';
import 'package:aghaz/services/UserRepository.dart';
import 'package:aghaz/widgets/AgahzTextField.dart';
import 'package:aghaz/widgets/AghazButton.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(userRepository: _userRepository),
        ),
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(userRepository: _userRepository),
        ),
      ],
      child: SignUpPage(),
    )

//      BlocProvider<RegisterBloc>(
//        create: (context) => RegisterBloc(userRepository: _userRepository),
//        child: SignUpPage(),
//      ),
        );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isFailure) {
          showBottomSheet(
            context: context,
            builder: (context) => Container(
              width: ScreenSize.blockSizeHorizontal * 100,
              height: ScreenSize.blockSizeVertical * 20,
              child: Center(
                child: FlatButton(
                  child: Text(
                    'Try Again',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        } else if (state.isSubmitting) {
          showBottomSheet(
            context: context,
            builder: (context) => Container(
              width: ScreenSize.blockSizeHorizontal * 100,
              height: ScreenSize.blockSizeVertical * 20,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLogin(),
            ),
          );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              child: Container(
                width: ScreenSize.blockSizeHorizontal * 100,
                height: ScreenSize.blockSizeVertical * 100,
                child: Center(
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 10,
                    children: <Widget>[
                      Container(
                        width: ScreenSize.blockSizeHorizontal * 50,
                        height: ScreenSize.blockSizeVertical * 20,
                        color: Colors.red,
                      ),
                      Container(
                        width: ScreenSize.blockSizeHorizontal * 85,
                        height: ScreenSize.blockSizeVertical * 15,
                        child: TextFormField(
                          autovalidate: true,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (_) {
                            return !state.isEmailValid ? 'Invalid Email' : null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  width: 0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  width: 0),
                            ),
                            prefixIcon: Icon(EvaIcons.emailOutline),
                            labelText: 'Email',
                            labelStyle: Theme.of(context).textTheme.body1,
                            hintText: "Enter email address",
                            hintStyle: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ),
                      Container(
                        width: ScreenSize.blockSizeHorizontal * 85,
                        height: ScreenSize.blockSizeVertical * 15,
                        child: TextFormField(
                          obscureText: true,
                          autovalidate: true,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (_) {
                            return !state.isPasswordValid
                                ? 'Invalid password'
                                : null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  width: 0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  width: 0),
                            ),
                            prefixIcon: Icon(EvaIcons.lockOutline),
                            labelText: 'Password',
                            labelStyle: Theme.of(context).textTheme.body1,
                            hintText: "Enter password",
                            hintStyle: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RaisedButton(
                          onPressed: isRegisterButtonEnabled(state)
                              ? _onFormSubmitted
                              : null,
                          color: Theme.of(context).accentColor,
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .subhead
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
