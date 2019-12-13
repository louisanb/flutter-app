import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../models/http_exception.dart';

import '../widgets/appearance/text.dart';
import '../widgets/appearance/input.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../res/apis.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/utils.dart';

import '../widgets/appearance/title.dart';
import '../utils/sp_util.dart';

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
  // Map<String, String> _authDataSIN = {
  //   'email': '',
  //   'password': '',
  // };
  // Map<String, String> _authDataSUP = {
  Map<String, String> _authData = {
  'email': '',
  'password': '',
  'confirm_password' : '',
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
  final _pswConfController = TextEditingController();

  // var authTitle;
  // var forTerm;
  // var hanoAccount;

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
    _authData['email'] = _unameController.text;
    _authData['password'] = generateMd5(_passwordController.text);
    // _authData['password'] = _passwordController.text;
    //technically psw conf is done at pswConf field validation so u can cheat in auth.dart with confirm_psw=psw but u need to double check it with further considerations
    //u can add optional arg/input to avoid duplication
    // _authDataSUP['email'] = _unameController.text;
    // _authDataSUP['password'] = _passwordController.text;
    // _authDataSUP['confirm_password'] = _pswConfController.text;
    print("gmd: ${generateMd5(_pswConfController.text)}");
    _authData['confirm_password'] = generateMd5(_pswConfController.text);
    // _authData['confirm_password'] = _pswConfController.text;
    // Map<String, dynamic> data = {
    //   "user": {"email": "userName", "password": generateMd5("12344")}
    // };
    try {
      if (_authMode == AuthMode.Login) {
        // print("_authData['email']: $_authData");
        // _authDataSIN['email'] = _unameController.text;
        // _authDataSIN['password'] = _passwordController.text;
        // print("authData['email']: $authData");
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          //not def
          // params: Params()
          // authData['email'],
          // authData['password'],
          // _authDataSIN['email'] = _unameController.text,
          // _authDataSIN['password'],
          _authData['email'],
          _authData['password'],

        );
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['email'],
          _authData['password'],
          _authData['confirm_password'],
        );
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      print("error in HttpException in auth_screen: $error \n .tostring: ${error.toString}");
      //if api returns err identifier then u can use switch sttmt
      if (error.toString().contains('already registered with this e-mail')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('email and/or password')) {
        errorMessage = 'A user with this email and/or password was not found.';  
      } else if (error.toString().contains('Enter a valid email')) {
        errorMessage = 'Please enter a valid email';
      } else if (error.toString().contains('FormatException: Unexpected character (at character 1)')) {
        errorMessage = 'An confirmation email is sent to the email you entered, please response to that email to verify this register to continue!';
      //below not modified yet so dn work
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
      SingleChildScrollView( 
        // SingleChildScrollView(
        // height: deviceSize.height,
        // width: deviceSize.width,
        // margin: const EdgeInsets.only(left: 20.0),
        // color: Colors.pink,
        child: Container( 
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column( 
        // children: SingleChildScrollView(
        children: <Widget>[
          // SingleChildScrollView( child: Column( children: <Widget>[
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
                ..fontSize = 22.0
                ..fontFamily = 'Roboto-Regular'
                // ..fontWeight = FontWeight.w500
                ..alignment = Alignment.center
                ..marginTop = 41.0
                ..marginLeft = 0.0
          ) : 
//ttx this need to be simplified titleBar and autoText can merge like highly customize it so only one is needed. 
//u probly can use auto text instead           
          // TitleBar(
          //     params: Params()
          //       ..text = "REGISTER"
          //       ..textHeight = 29.0
          //       ..textWidth = 121.0
          //       ..marginLeft = 92.0
          //       ..textColor = ColorRes.titleTextColor
          //       ..letterSpacing = 2.36
          //       ..fontFamily = "Roboto-regular"
          //       ..marginTop = 41.0 
          //       ..height = 34.0
          AutoText(
              params: Params()
                ..text = 'REGISTER' 
                ..textHeight = 29.0
                ..textWidth = 122.0 
                ..textColor = ColorRes.titleTextColor
                ..letterSpacing = 2.36
                ..fontSize = 22.0
                ..fontFamily = 'Roboto-Regular'
                // ..fontWeight = FontWeight.w500
                // ..alignment = Alignment.center
                ..marginTop = 41.0
                ..marginLeft = 92.0
          ),
          Form(
          key: _formKey,
          // child: SingleChildScrollView(            
            child: Column(              
              children: <Widget>[
                InputBox(
                    params: Params()
                      ..hintText = "Email"
                      ..bgColor = ColorRes.inputBoxBgColor
                      // ..marginTop = _authMode == AuthMode.Login ? 28.0 : 28.0 //40 47
                      ..marginTop = 28.0
                      ..autoFocus = false //xx
                      ..marginLeft = 0.0
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
                  //tt this should be modified to use w
                  // PswConfInputBox(
                  //   params: Params()
                  //     ..hintText = "Confirm Password"
                  //     ..marginTop = 29.0
                  //     ..controller = _passwordController.text),
                  Container(
                    width: SpUtil.getSize(308.0),
                    height: SpUtil.getSize(50.0),
                    margin: EdgeInsets.only(top: SpUtil.getSize(29.0)),
                    padding: EdgeInsets.only(left: SpUtil.getSize(11.0)),
                    // width: params.width,
                    // width: 308.0,
                    // height: 50.0,
                    // margin: EdgeInsets.only(top: params.marginTop),
                    // padding: EdgeInsets.only(left: 11.0),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1.0)
                    ),
                    child: TextFormField(
                      // autofocus: params.autoFocus,
                      controller: _pswConfController,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: "Roboto-Medium",
                      ),
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Confirm password",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(180, 180, 180, 1.0),
                          fontSize: 20.0,
                          fontFamily: "Roboto-Medium",
                          letterSpacing: 1.42
                        ),
                        border: InputBorder.none,
                      ),
                      //tt there must be a way to merge psw input w and psw confirm w
                      //if params.controller ==
                      enabled: _authMode == AuthMode.Signup,
                      validator: _authMode == AuthMode.Signup
                          ? (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match!';
                              } else {
                                if (value == _passwordController.text) {
                                  _pswConfController.text = value;
                                }
                              }
                            }
                          : null,
                      obscureText: true
                    ),
                  ),
                  TextButton(
                    params: Params()
                      ..text = _authMode == AuthMode.Login ? 'Forgot Password' : 'Terms and Conditions'
                      ..bgColor = ColorRes.colorWhite
                      ..textHeight = 29.0
                      ..textWidth = _authMode == AuthMode.Login ? 203.0 : 264.0
                      ..letterSpacing = 2.36
                      ..fontFamily = "Roboto-Medium"
                      ..fontSize = 100.0
                      ..textColor = ColorRes.titleTextColor
                      ..marginLeft = 0.0 
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
                          ..fontSize = 20.0
                          ..letterSpacing = 2.14
                          ..textColor = ColorRes.colorWhite//xx
                          ..height = 47.0//xx2
                          ..width = 242.0//xx2
                          ..backgroundColor = ColorRes.buttonBgColor
                          // ..textAlig = Alignment.center
                          ..marginLeft = 0.0
                          ..marginTop = _authMode == AuthMode.Login ? 37.0 : 13.0,//2 21
                        tap: () {
                          print("_unameController: $_unameController");
                          print("_passwordController: $_passwordController");
                          // _signIn(_unameController, _passwordController);
                          _submit();
                        }
                      ),
                  AutoText(
                      params: Params()
                        ..text = "OR"
                        ..textHeight = 33.0
                        ..textWidth = 39.0
                        ..textColor = ColorRes.titleTextColor
                        ..letterSpacing = 2.68
                        ..fontSize = 25.0
                        // ..fontWeight = FontWeight.w500
                        ..alignment = Alignment.center
                        ..marginTop = _authMode == AuthMode.Login ? 37.0 : 37.0 //2 29
                        ..marginLeft = 0.0
                  ),
                  RegButton(
                      params: Params()
                        ..text = "Facebook"
                        ..textHeight = 26.0
                        ..fontFamily = "Roboto-Light"
                        ..fontSize = 20.0
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite
                        ..height = 47.0//xx2
                        ..width = 242.0//xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        // ..textAlig = Alignment.center
                        ..marginLeft = 0.0
                        ..marginTop = 29.0,
                      tap: () {
                        print("Facebook");
                      }),
                  RegButton(
                      params: Params()
                        ..text = "Google"
                        ..textHeight = 26.0
                        ..fontFamily = _authMode == AuthMode.Login ? "Roboto-Light" : "Roboto"
                        ..fontSize = 20.0
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite
                        ..height = 47.0//xx2
                        ..width = 242.0//xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        // ..textAlig = Alignment.center
                        ..marginLeft = 0.0
                        ..marginTop = 20.0,
                      tap: () {
                        print("Google");
                      }),
                  // FlatButton(
                  //   child: Text(
                  //       '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                  //   onPressed: _switchAuthMode,
                  //   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //   textColor: Theme.of(context).primaryColor,
                  // ),
                  TextButton(
                      params: Params()
                        ..text = _authMode == AuthMode.Login ? "I don\'t have an account" : "I have an account"
                        ..bgColor = ColorRes.colorWhite
                        ..textHeight = 29.0
                        ..textWidth = _authMode == AuthMode.Login ? 235.0 : 181.0
                        ..letterSpacing = 0.25
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 100.0
                        ..textColor = ColorRes.titleTextColor
                        ..marginLeft = 0.0 
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
            ),//col
          // ),//scroll
        ),//form
        ]//column <widget>
      ),
        ),//container
    ),//scroll
    );//scaffold
  }//build
}//authCard stt
////////////////////////////////1st code///////////////////////////
// void _signIn(
//       TextEditingController _unameController,
//       TextEditingController _pwdController) async {
//     String userName = _unameController.text;
//     String password = _pwdController.text;
//     print(userName);
//     print(password);
//     if (userName == null || userName.trim() == "") {
//       Fluttertoast.showToast(msg: "用户名不能为空");
//       return;
//     }
//     if (password == null || password.length < 8) {
//       Fluttertoast.showToast(msg: "密码长度至少为8");
//       return;
//     }
//     Map<String, dynamic> data = {
//       "user": {
//         "email": userName, 
//         // "password": generateMd5(password),
//         "password": password
//         }
//     };

//     var response = await http.post(
//       AppAction.SIGN_IN,
//       headers: AppAction.HEADERS,
//       body: json.encode(data),
    
//     );

//     if (response.statusCode == 200) {
//       _success();
//       print(response);
//     } else {
//       print(json.decode(response.body));
//       _error();
//     }
//   }

//   void _success() {
//     Fluttertoast.showToast(msg: "登录成功");
//   }

//   void _error() {
//     Fluttertoast.showToast(msg: "登录失败");
//   }

