import 'package:aghaz/bloc/authentication_bloc/bloc.dart';
import 'package:aghaz/bloc/login/bloc.dart';
import 'package:aghaz/custom_drawer/navigation_home_screen.dart';
import 'package:aghaz/helper/ScreenSize.dart';
import 'package:aghaz/screens/SignUpPage.dart';
import 'package:aghaz/services/UserRepository.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLogin extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(
          AppStarted(),
        ),
      child: LoginPage(
        userRepository: userRepository,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final UserRepository _userRepository;

  LoginPage({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Uninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Authenticated) {
          return NavigationHomeScreen();
        } else if (state is Unauthenticated) {
          return BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(userRepository: _userRepository),
            child: UserLogin(userRepository: _userRepository),
          );
        } else {
          return Center(
            child: Text("afasfas"),
          );
        }
      },
    );
  }
}

class UserLogin extends StatefulWidget {
  final UserRepository _userRepository;

  UserLogin({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isFailure) {
              //Navigator.pop(context);
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
              //Navigator.pop(context);
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
            }
            return Center(
              child: Text(""),
            );
          },
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
                              return !state.isEmailValid
                                  ? 'Invalid Email'
                                  : null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
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
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    width: 0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
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
                            onPressed: isLoginButtonEnabled(state)
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(
                                  userRepository: _userRepository,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Donot have an account",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
