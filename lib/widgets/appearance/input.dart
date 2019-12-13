import 'package:flutter/material.dart';
import '../../utils/sp_util.dart';
import '../../utils/parameter.dart';

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
      width: SpUtil.getSize(308.0),
      height: SpUtil.getSize(50.0),
      margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop), 
      left: SpUtil.getSize(params.marginLeft)
      ),
      padding: EdgeInsets.only(left: SpUtil.getSize(11.0)),
      // width: params.width,
      // width: 308.0,
      // height: 50.0,
      // margin: EdgeInsets.only(top: params.marginTop),
      // padding: EdgeInsets.only(left: 11.0),
      alignment: Alignment.centerLeft,
      //search input field 0xFFF0F0F0 and email inpust field 0xFFD8D8D8 bckgrd color is not the same now i made them same but need to be changed in the future but double check with designer first
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
          icon: params.icon,
          hintText: params.hintText,
          hintStyle: TextStyle(
            color: Color.fromRGBO(180, 180, 180, 1.0),
            fontSize: 20.0,
            fontFamily: "Roboto-Medium",
            letterSpacing: 1.42
          ),
          border: InputBorder.none,
        ),
        // validator: (value) {
        //   if (value.isEmpty || !value.contains('@')) {
        //     return 'Invalid email!';
        //   }
        // },
        // onSaved: (value) {
        //   //solution see parameter.dart
        //   // params.authData['email'] = value;
        //   // print("param.authData['email']: ${params.authData['email']}");
        //   // controller = value;
        //   params.controller = value;
        //   print("params.controller: ${params.controller}");
        // },
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
      width: SpUtil.getSize(308.0),
      height: SpUtil.getSize(50.0),
      margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop)),
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
        //tt there must be a way to merge psw input w and psw confirm w
        //if params.controller ==
        // validator: (value) {
        //   if (value.isEmpty || value.length < 5) {
        //     return 'Password is too short!';
        //   }
        // },
        // onSaved: (value) {
        //   params.controller = value;
        //   print("params.controller: ${params.controller}");
        // },
        obscureText: true
      ),
    );
  }
}

class PswConfInputBox extends StatelessWidget {
  final Params params;
  PswConfInputBox({Key key, @required this.params}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SpUtil.getSize(308.0),
      height: SpUtil.getSize(50.0),
      margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop)),
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
        //tt there must be a way to merge psw input w and psw confirm w
        //also here may have bug ref the following commented code for futher considerations
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
        validator: (value) {
          if (value != params.controller.text) {
            return 'Passwords do not match!';
          }
        },
          // validator: params.controller.text.isEmpty
          //     ? (value) {
          //         if (value.isEmpty || value.length < 5) {
          //           return 'Password is too short!';
          //         }
          //       }
          //     : (value) {
          //         if (value != params.controller) {
          //           return 'Passwords do not match!';
          //         }
          //       },
          // onSaved: (value) {
          //   params.controller = value;
          //   print("params.controller: ${params.controller}");
          // },
        obscureText: true
      ),
    );
  }
}
