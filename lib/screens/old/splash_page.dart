import 'package:flutter/material.dart';
import '../utils/sp_util.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.green,
            width: SpUtil.getSize(144.0),
            height: SpUtil.getSize(33.0),
            margin: EdgeInsets.only(top: SpUtil.getSize(57.0)),
            child: AutoSizeText(
              "LOADING...",
              style: TextStyle(
                fontSize: 36.0,
                fontFamily: "Roboto-Medium",
                color: Color.fromRGBO(90, 134, 191, 1.0)
              ),
              minFontSize: 12.0,
            ),
          ),

        ]
      ),
    );
  }
}