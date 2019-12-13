import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../models/http_exception.dart';

import '../widgets/text.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../res/apis.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/title.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  static const routeName = '/auth';
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  // Map<String, String> authData = {
  //   'email': '',
  //   'password': '',
  // };
  // Map<String, String> get authData {
  //   return _authData;
  // }
  var _isLoading = false;
  final _passwordController = TextEditingController();
  final _unameController = TextEditingController();
  var authTitle;
  var forTerm;
  var hanoAccount;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text('An Error Occurred!'),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // print("_authData['email']: $_authData");
        _authData['email'] = _unameController.text;
        // print("authData['email']: $authData");
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          //not def
          // params: Params()
          // authData['email'],
          // authData['password'],
          _authData['email'],
          _authData['password'],
        );
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['email'],
          _authData['password'],
        );
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold( 
      body:
      // child: 
      Container(
        // margin: const EdgeInsets.only(left: 20.0),
        color: Colors.pink,
        child: 
        Column( 
        children: <Widget>[
          // Text(_authMode == AuthMode.Login ? authTitle = 'SIGN' : authTitle = 'SIGN UP'),
          /////////////////////////this works but not finished yet/////////
          // AutoText(
          //     params: Params()
          //       ..text = _authMode == AuthMode.Login ? 'SGIN IN' : 'SIGN UP'
          //       ..textHeight = 29.0
          //       ..textWidth = _authMode == AuthMode.Login ? 95.0 : 121.0
          //       ..textColor = ColorRes.titleTextColor
          //       ..letterSpacing = 2.36
          //       ..fontWeight = FontWeight.w500
          //       ..marginTop = 56.0),
          ////////////////////////this dn work i m working on///////////
          _authMode == AuthMode.Login ? 
          AutoText(
              params: Params()
                ..text = 'SGIN IN' 
                ..textHeight = 29.0
                ..textWidth = 95.0 
                ..textColor = ColorRes.titleTextColor
                ..letterSpacing = 2.36
                ..fontWeight = FontWeight.w500
                ..marginTop = 41.0
                // ..marginLeft = 10.0
          ) : 
          TitleBar(
              params: Params()
                ..text = "REGISTER"
                ..textHeight = 29.0
                ..textWidth = 121.0
                ..marginLeft = 92.0
                ..textColor = ColorRes.titleTextColor
                ..letterSpacing = 2.36
                ..fontFamily = "Roboto-Light"
                ..marginTop = 41.0 
                ..height = 34.0),
          Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                InputBox(
                    params: Params()
                      ..hintText = "Email"
                      ..marginTop = _authMode == AuthMode.Login ? 28.0 : 28.0 //40 47
                      ..autoFocus = false //xx
                      ..controller = _unameController),
                PasswordInputBox(
                    params: Params()
                      ..hintText = "Password"
                      ..marginTop = 29.0
                      ..controller = _passwordController),
                // if (_authMode == AuthMode.Signup)
                //   TextFormField(
                //     enabled: _authMode == AuthMode.Signup,
                //     decoration: InputDecoration(labelText: 'Confirm Password'),
                //     obscureText: true,
                //     validator: _authMode == AuthMode.Signup
                //         ? (value) {
                //             if (value != _passwordController.text) {
                //               return 'Passwords do not match!';
                //             }
                //           }
                //         : null,
                //   ),
                  if (_authMode == AuthMode.Signup)
                  PasswordInputBox(
                    params: Params()
                      ..hintText = "Confirm Password"
                      ..marginTop = 29.0
                      ..controller = _passwordController),
                  TextButton(
                    params: Params()
                      ..text = _authMode == AuthMode.Login ? forTerm = 'Forgot Password' : forTerm = 'Terms and Conditions'
                      ..textHeight = 29.0
                      ..textWidth = _authMode == AuthMode.Login ? 203.0 : 264.0
                      ..letterSpacing = 2.36
                      ..marginTop = _authMode == AuthMode.Login ? 24.0 : 11.0,//24 48
                    tap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return _authMode == AuthMode.Login ? ForgotPassPage() : TermsOfUse()
                    }
                  ),
            
                ///sign in
                  // SizedBox(
                  //   height: 20,
                  // ),
                  if (_isLoading)
                    CircularProgressIndicator()
                  else
                    RegButton(
                      params: Params()
                        ..text = _authMode == AuthMode.Login ? 'SGIN IN' : 'SIGN UP'
                        ..textHeight = 26.0
                        ..fontFamily = _authMode == AuthMode.Login ? "Roboto-Light" : "Roboto"
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite//xx
                        ..height = 47.0//xx2
                        ..width = 242.0//xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        ..marginTop = _authMode == AuthMode.Login ? 37.0 : 24.0,//2 21
                      tap: () {
                        print("_unameController: $_unameController");
                        _signIn(_unameController, _passwordController);
                      }
                      ),
                  // FlatButton(
                  //   child: Text(
                  //       '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                  //   onPressed: _switchAuthMode,
                  //   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //   textColor: Theme.of(context).primaryColor,
                  // ),
                  AutoText(
                      params: Params()
                        ..text = "OR"
                        ..textHeight = 33.0
                        ..textWidth = 39.0
                        ..textColor = ColorRes.titleTextColor
                        ..letterSpacing = 2.68
                        ..fontWeight = FontWeight.w500
                        ..marginTop = _authMode == AuthMode.Login ? 37.0 : 37.0 //2 29
                  ),
                  RegButton(
                      params: Params()
                        ..text = "Facebook"
                        ..textHeight = 26.0
                        ..fontFamily = "Roboto-Light"
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite
                        ..height = 47.0//xx2
                        ..width = 242.0//xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        ..marginTop = _authMode == AuthMode.Login ? 29.0 : 29.0,//2 20 
                      tap: () {
                        print("Facebook");
                      }),
                  RegButton(
                      params: Params()
                        ..text = "Google"
                        ..textHeight = 26.0
                        ..fontFamily = _authMode == AuthMode.Login ? "Roboto-Light" : "Roboto"
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite
                        ..height = 47.0//xx2
                        ..width = 242.0//xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        ..marginTop = _authMode == AuthMode.Login ? 20.0 : 20.0,
                      tap: () {
                        print("Google");
                      }),
                  TextButton(
                      params: Params()
                        ..text = _authMode == AuthMode.Login ? "I don\'t have an account" : "I have an account"
                        ..textHeight = 29.0
                        ..textWidth = _authMode == AuthMode.Login ? 235.0 : 181.0
                        ..letterSpacing = 0.25
                        ..marginTop = _authMode == AuthMode.Login ? 23.0 : 28.0,//2 23 
                      tap: () {
                         _switchAuthMode();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return SignUpPage();
                        // }));
                      }
                  )  
                
              ],
            ),
          ),
        ),
        ]//column <widget>
      ),
    ),//card
    );//scaffold
  }//build
}//authCard stt
////////////////////////////////1st code///////////////////////////
void _signIn(
      TextEditingController _unameController,
      TextEditingController _pwdController) async {
    String userName = _unameController.text;
    String password = _pwdController.text;
    print(userName);
    print(password);
    if (userName == null || userName.trim() == "") {
      Fluttertoast.showToast(msg: "用户名不能为空");
      return;
    }
    if (password == null || password.length < 8) {
      Fluttertoast.showToast(msg: "密码长度至少为8");
      return;
    }
    Map<String, dynamic> data = {
      "user": {
        "email": userName, 
        // "password": generateMd5(password),
        "password": password
        }
    };

    var response = await http.post(
      AppAction.SIGN_IN,
      headers: AppAction.HEADERS,
      body: json.encode(data),
    
    );

    if (response.statusCode == 200) {
      _success();
      print(response);
    } else {
      print(json.decode(response.body));
      _error();
    }
  }

  void _success() {
    Fluttertoast.showToast(msg: "登录成功");
  }

  void _error() {
    Fluttertoast.showToast(msg: "登录失败");
  }

