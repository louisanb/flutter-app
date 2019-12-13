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

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    // TextEditingController _unameController = new TextEditingController();
    // TextEditingController _pwdController = new TextEditingController();
    final deviceSize = MediaQuery.of(context).size;
    /////////////////////////pre old////////////////////////
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: 
      // Center( child:
      // Stack(
      //   alignment: AlignmentDirectional.topStart,
      //   // fit: StackFit.loose,
      //   children: <Widget>[
          
          /////////////////back ground color ////////////
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
          //         Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
          //       ],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //       stops: [0, 1],
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            // child: Center(
              // heightFactor: deviceSize.height,
            // child: Container(
              // height: deviceSize.height,
              // width: deviceSize.width,
              // height: 1500.0,
              // width: deviceSize.width,
              
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    //////////////////////////my shop diag box
                    // child: Container(
                    //   margin: EdgeInsets.only(bottom: 20.0),
                    //   padding:
                    //       EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
                    //   transform: Matrix4.rotationZ(-8 * pi / 180)
                    //     ..translate(-10.0),
                    //   // ..translate(-10.0),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.deepOrange.shade900,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         blurRadius: 8,
                    //         color: Colors.black26,
                    //         offset: Offset(0, 2),
                    //       )
                    //     ],
                    //   ),
                    //   child: Text(
                    //     'MyShop',
                    //     style: TextStyle(
                    //       color: Theme.of(context).accentTextTheme.title.color,
                    //       fontSize: 50,
                    //       fontFamily: 'Anton',
                    //       fontWeight: FontWeight.normal,
                    //     ),
                    //   ),
                    // ),
                    ///////////////this workd///////////
                    child: Divider()
                    // AutoText(
                    // params: Params()
                    //   ..text = "SIGN IN"
                    //   ..textHeight = 29.0
                    //   ..textWidth = 95.0
                    //   ..textColor = ColorRes.titleTextColor
                    //   ..letterSpacing = 2.36
                    //   ..fontWeight = FontWeight.w500
                    //   ..marginTop = 56.0),
                    /////cant put it inside flex w/o child//////////
                    // InputBox(
                    //   params: Params()
                    //     ..hintText = "Email"
                    //     ..marginTop = 40.0
                    //     ..autoFocus = false
                    //     ..controller = _unameController),
                  ),//flexible
                  // AuthCard()
                  // InputBox(
                  //   params: Params()
                  //     ..hintText = "Email"
                  //     ..marginTop = 40.0
                  //     ..autoFocus = false
                  //     ..controller = _unameController),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
              // ),//container
            // ),//center
          ),
      //   ],
      // ),//stack
    // ),//center
    );
  }
}

class AuthCard extends StatefulWidget {
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
    return 
    
    // Card(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      // elevation: 8.0,
      /////////////////same err as below////////////
      // child: AutoText(
      //           // params: Params()
      //           //   ..text = "SIGN IN"
      //           //   ..textHeight = 29.0
      //           //   ..textWidth = 95.0
      //           //   ..textColor = ColorRes.titleTextColor
      //           //   ..letterSpacing = 2.36
      //           //   ..fontWeight = FontWeight.w500
      //           //   ..marginTop = 56.0),
      // child: 
      Container(
        ///////////////////////size/action area constrain////////////////////
        // height: _authMode == AuthMode.Signup ? 320 : 260,
        // constraints:
        //     BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
        // width: deviceSize.width * 0.75,
        // padding: EdgeInsets.all(16.0),
        ////////////no child parath af container abv err add child child below err////////
        // AutoText(
        //     params: Params()
        //       ..text = "SIGN IN"
        //       ..textHeight = 29.0
        //       ..textWidth = 95.0
        //       ..textColor = ColorRes.titleTextColor
        //       ..letterSpacing = 2.36
        //       ..fontWeight = FontWeight.w500
        //       ..marginTop = 56.0),
        child: 
        //////////////////////overflowed/////////
        // Column( 
        // children: <Widget>[
        //   AutoText(
        //       params: Params()
        //         ..text = "SIGN IN"
        //         ..textHeight = 29.0
        //         ..textWidth = 95.0
        //         ..textColor = ColorRes.titleTextColor
        //         ..letterSpacing = 2.36
        //         ..fontWeight = FontWeight.w500
        //         ..marginTop = 56.0),
          Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AutoText(
                    params: Params()
                      ..text = "SIGN IN"
                      ..textHeight = 29.0
                      ..textWidth = 95.0
                      ..textColor = ColorRes.titleTextColor
                      ..letterSpacing = 2.36
                      // ..fontWeight = FontWeight.w500
                      ..marginTop = 56.0),
                //////////err at parath right af textFormField
                // TextFormField(
                // InputBox(
                //   params: Params()
                //     ..hintText = "Email"
                //     ..marginTop = 40.0
                //     ..autoFocus = false
                //     ..controller = _unameController),
                //   // decoration: InputDecoration(labelText: 'E-Mail'),
                //   keyboardType: TextInputType.emailAddress,
                //   validator: (value) {
                //     if (value.isEmpty || !value.contains('@')) {
                //       return 'Invalid email!';
                //     }
                //   },
                //   onSaved: (value) {
                //     _authData['email'] = value;
                //   },
                // ),
                InputBox(
                    params: Params()
                      // ..authDataEmail = _authData['email']
                      // ..authData
                      // .._authData['email']
                      ..hintText = "Email"
                      ..marginTop = 40.0
                      ..autoFocus = false
                      ..controller = _unameController),
                InputBox(
                    params: Params()
                      ..hintText = "Email"
                      ..marginTop = 40.0
                      ..autoFocus = false
                      ..controller = _passwordController),
                // print(object);
                 // TextFormField(
                //   decoration: InputDecoration(labelText: 'E-Mail'),
                //   keyboardType: TextInputType.emailAddress,
                //   validator: (value) {
                //     if (value.isEmpty || !value.contains('@')) {
                //       return 'Invalid email!';
                //     }
                //   },
                //   onSaved: (value) {
                //     _authData['email'] = value;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Password'),
                //   obscureText: true,
                //   controller: _passwordController,
                //   validator: (value) {
                //     if (value.isEmpty || value.length < 5) {
                //       return 'Password is too short!';
                //     }
                //   },
                //   onSaved: (value) {
                //     _authData['password'] = value;
                //     // authData['password'] = value;
                //   },
                // ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                RaisedButton(
                    child:
                        Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryTextTheme.button.color,
                ),  
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RegButton(
                    params: Params()
                      ..text = _authMode == AuthMode.Login ? 'SGIN IN' : 'SIGN UP'
                      ..textHeight = 26.0
                      ..fontFamily = "Roboto-Light"
                      ..letterSpacing = 2.14
                      ..textColor = ColorRes.colorWhite
                      ..height = 47.0
                      ..width = 242.0
                      ..backgroundColor = ColorRes.buttonBgColor
                      ..marginTop = 29.0,
                    tap: () {
                      print("_unameController: $_unameController");
                      _signIn(_unameController, _passwordController);
                    }
                    ),
                FlatButton(
                  child: Text(
                      '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                  onPressed: _switchAuthMode,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
        // ]//column <widget>
      );
    // );//card
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

