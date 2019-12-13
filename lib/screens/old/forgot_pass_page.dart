import 'package:flutter/material.dart';
import '../../widgets/appearance/title.dart';
import '../../utils/parameter.dart';
import '../../res/colors.dart';
import '../../widgets/appearance/input.dart';
import '../../widgets/appearance/button.dart';

class ForgotPassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _unameController = new TextEditingController();
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          children: <Widget>[
            TitleBar(params: Params()..text = "FORGOT PASSWORD"
              ..textHeight = 29.0
              ..textWidth = 246.0
              ..marginLeft = 18.0
              ..textColor = ColorRes.titleTextColor
              ..letterSpacing = 2.36
              ..fontFamily = "Roboto-Light"
              ..marginTop = 59.0
              ..height = 34.0
              ..tap = (){
                Navigator.pop(context);
              }
            ),
            InputBox(params: Params()..hintText = "Email"
              ..marginTop = 107.0
              ..controller = _unameController
            ),
            RegButton(params: Params()..text = "EMAIL ME"
              ..textHeight = 26.0
              ..fontFamily = "Roboto-Light"
              ..letterSpacing = 2.14
              ..textColor = ColorRes.titleTextColor
              ..marginTop = 49.0,
              tap: (){}
            )
          ],
        ),
      ),
    );
  }
}