import '../screens/sign_in_page.dart';
import 'package:flutter/material.dart';
import '../widgets/appearance/title.dart';
import '../widgets/appearance/text.dart';
import '../widgets/appearance/input.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/http.dart';
import '../res/apis.dart';
import 'package:dio/dio.dart';

class SignUpPage extends StatelessWidget {
  BuildContext context;
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              TitleBar(params: Params()..text = "REGISTER"
                ..textHeight = 29.0
                ..textWidth = 121.0
                ..marginLeft = 66.0
                ..textColor = ColorRes.titleTextColor
                ..letterSpacing = 2.36
                ..fontFamily = "Roboto-Light"
                ..marginTop = 56.0
                ..height = 34.0
                ..tap = (){
                  Navigator.pop(context);
                }
              ),
              InputBox(params: Params()..hintText = "Email"
                ..marginTop = 47.0
                ..controller = _unameController
              ),
              PasswordInputBox(params: Params()..hintText = "Password"
                ..marginTop = 29.0
                ..controller = _pwdController
              ),
              TextButton(params: Params()..text = "Terms and Conditions"
                ..textHeight = 29.0
                ..textWidth = 264.0
                ..letterSpacing = 2.36
                ..marginTop = 48.0,
                tap: (){},
              ),
              RegButton(params: Params()..text = "SIGN UP"
                ..textHeight = 26.0
                ..fontFamily = "Roboto"
                ..letterSpacing = 2.14
                ..textColor = ColorRes.colorWhite
                ..marginTop = 21.0,
                tap: (){
                  _signUp();
                }
              ),
              AutoText(params: Params()..text = "OR"
                ..textHeight = 33.0
                ..textWidth = 39.0
                ..textColor = ColorRes.titleTextColor
                ..letterSpacing = 2.68
                ..fontWeight = FontWeight.w500
                ..marginTop = 29.0
              ),
              RegButton(params: Params()..text = "Facebook"
                ..textHeight = 26.0
                ..fontFamily = "Roboto"
                ..letterSpacing = 2.14
                ..textColor = ColorRes.colorWhite
                ..marginTop = 29.0,
                tap: (){}),
              RegButton(params: Params()..text = "Google"
                ..textHeight = 26.0
                ..fontFamily = "Roboto"
                ..letterSpacing = 2.14
                ..textColor = ColorRes.colorWhite
                ..marginTop = 20.0,
                tap: (){}),
              TextButton(params: Params()..text = "Have an account?"
                ..textHeight = 29.0
                ..textWidth = 181.0
                ..letterSpacing = 0.25
                ..marginTop = 28.0,
                tap: (){
                  Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) {
                        return SignInPage();
                      }
                    )
                  );
                }
              )
            ],
          ),
        ),
      )
    );
  }

  void _signUp() async{
    String  userName = _unameController.text;
    String password = _pwdController.text;
    if(userName == null || userName == ""){
      Fluttertoast.showToast(msg: "用户名不能为空");
      return;
    }
    if(password == null || password.length < 8){
      Fluttertoast.showToast(msg: "密码长度至少为8");
      return;
    }

    HttpUtil.getInstance().post(
      AppAction.SIGN_UP,
      data: {"user": {"email": userName, "password": password, "confirm_password": password}},
      onSuccess: _success,
      onError: _error
    );
  }

  void _success(data) {
      Fluttertoast.showToast(msg: "注册成功");
      Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) {
            return SignInPage();
          }
        )  
      );
  }

  void _error(DioError e) {
    Fluttertoast.showToast(msg: "注册失败");
  }
}