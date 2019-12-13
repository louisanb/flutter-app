import 'package:flutter/material.dart';
import '../utils/sp_util.dart';
import '../utils/parameter.dart';

class InputBox extends StatelessWidget {
  final Params params;
  InputBox({Key key, @required this.params}):super(key:key);
  // Map<String, String> _authData = {
  //   'email': '',
  //   'password': '',
  // };

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: SpUtil.getSize(308.0),
      // height: SpUtil.getSize(50.0),
      // margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop)),
      // padding: EdgeInsets.only(left: SpUtil.getSize(11.0)),
      // width: params.width,
      width: 308.0,
      height: 50.0,
      margin: EdgeInsets.only(top: params.marginTop),
      padding: EdgeInsets.only(left: 11.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1.0)
      ),
      child: TextFormField(
        autofocus: params.autoFocus,
        controller: params.controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: "Roboto-Medium",
        ),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: params.hintText,
          hintStyle: TextStyle(
            color: Color.fromRGBO(180, 180, 180, 1.0),
            fontSize: 20.0,
            fontFamily: "Roboto-Medium",
            letterSpacing: 1.42
          ),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value.isEmpty || !value.contains('@')) {
            return 'Invalid email!';
          }
        },
        onSaved: (value) {
          // params.authData['email'] = value;
          // print("param.authData['email']: ${params.authData['email']}");
          // controller = value;
          params.controller = value;
          print("params.controller']: ${params.controller}");
        },
      ),
    );
  }
}

class PasswordInputBox extends StatelessWidget {
  final Params params;
  PasswordInputBox({Key key, @required this.params}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: SpUtil.getSize(308.0),
      // height: SpUtil.getSize(50.0),
      // margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop)),
      // padding: EdgeInsets.only(left: SpUtil.getSize(11.0)),
      // width: params.width,
      width: 308.0,
      height: 50.0,
      margin: EdgeInsets.only(top: params.marginTop),
      padding: EdgeInsets.only(left: 11.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1.0)
      ),
      child: TextFormField(
        // autofocus: params.autoFocus,
        controller: params.controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: "Roboto-Medium",
        ),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: params.hintText,
          hintStyle: TextStyle(
            color: Color.fromRGBO(180, 180, 180, 1.0),
            fontSize: 20.0,
            fontFamily: "Roboto-Medium",
            letterSpacing: 1.42
          ),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value.isEmpty || value.length < 5) {
            return 'Password is too short!';
          }
        },
        onSaved: (value) {
          params.controller = value;
          print("params.controller']: ${params.controller}");
        },
        obscureText: true
      ),
    );
  }
}
