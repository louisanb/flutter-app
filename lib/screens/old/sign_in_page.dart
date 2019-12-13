import 'dart:convert';

import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../widgets/appearance/input.dart';
import '../../widgets/appearance/text.dart';
import '../../widgets/appearance/button.dart';
import '../../utils/parameter.dart';
import '../../res/colors.dart';
import '../../screens/sign_up_page.dart';
import './forgot_pass_page.dart';
import '../../utils/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../res/apis.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _unameController = new TextEditingController();
    TextEditingController _pwdController = new TextEditingController();
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                AutoText(
                    params: Params()
                      ..text = "SIGN IN"
                      ..textHeight = 29.0
                      ..textWidth = 95.0
                      ..textColor = ColorRes.titleTextColor
                      ..letterSpacing = 2.36
                      ..fontWeight = FontWeight.w500
                      ..marginTop = 56.0),
                InputBox(
                    params: Params()
                      ..hintText = "Email"
                      ..marginTop = 40.0
                      ..autoFocus = false
                      ..controller = _unameController),
                PasswordInputBox(
                    params: Params()
                      ..hintText = "Password"
                      ..marginTop = 29.0
                      ..controller = _pwdController),
                TextButton(
                    params: Params()
                      ..text = "Forget Password"
                      ..textHeight = 29.0
                      ..textWidth = 203.0
                      ..letterSpacing = 2.36
                      ..marginTop = 24.0,
                    tap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgotPassPage();
                      }));
                    }),
                RegButton(
                    params: Params()
                      ..text = "SIGN IN"
                      ..textHeight = 26.0
                      ..fontFamily = "Roboto-Light"
                      ..letterSpacing = 2.14
                      ..textColor = ColorRes.colorWhite
                      ..height = 47.0
                      ..width = 242.0
                      ..backgroundColor = ColorRes.buttonBgColor
                      ..marginTop = 29.0,
                    tap: () {
                      _signIn(_unameController, _pwdController);
                    }),
                AutoText(
                    params: Params()
                      ..text = "OR"
                      ..textHeight = 33.0
                      ..textWidth = 39.0
                      ..textColor = ColorRes.titleTextColor
                      ..letterSpacing = 2.68
                      ..fontWeight = FontWeight.w500
                      ..marginTop = 37.0),
                RegButton(
                    params: Params()
                      ..text = "Facebook"
                      ..textHeight = 26.0
                      ..fontFamily = "Roboto-Light"
                      ..letterSpacing = 2.14
                      ..textColor = ColorRes.colorWhite
                      ..height = 47.0
                      ..width = 242.0
                      ..backgroundColor = ColorRes.buttonBgColor
                      ..marginTop = 20.0,
                    tap: () {
                      print("Facebook");
                    }),
                RegButton(
                    params: Params()
                      ..text = "Google"
                      ..textHeight = 26.0
                      ..fontFamily = "Roboto-Light"
                      ..letterSpacing = 2.14
                      ..textColor = ColorRes.colorWhite
                      ..height = 47.0
                      ..width = 242.0
                      ..backgroundColor = ColorRes.buttonBgColor
                      ..marginTop = 29.0,
                    tap: () {
                      print("Google");
                    }),
                TextButton(
                    params: Params()
                      ..text = "I don't have an account"
                      ..textHeight = 29.0
                      ..textWidth = 235.0
                      ..letterSpacing = 0.25
                      ..marginTop = 23.0,
                    tap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    })
              ],
            ),
          ),
        ));
  }

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
      "user": {"email": userName, "password": generateMd5(password)}
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
      _error();
    }
  }

  void _success() {
    Fluttertoast.showToast(msg: "登录成功");
  }

  void _error() {
    Fluttertoast.showToast(msg: "登录失败");
  }
}
