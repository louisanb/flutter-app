import 'package:flutter/material.dart';
import '../utils/sp_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../utils/parameter.dart';

class AutoText extends StatelessWidget {
  final Params params;
  AutoText({Key key, @required this.params}):super(key:key);

  @override
  Widget build(BuildContext context) {
    print("text w: AutoText");
    return 
    // Flexible( child: 
    Container(
      // color: Colors.black,
      // width: SpUtil.getSize(params.textWidth),
      // height: SpUtil.getSize(params.textHeight),
      // margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop)),
      width: params.textWidth,
      height: params.textHeight,
      margin: EdgeInsets.only(top: params.marginTop),
      // margin: EdgeInsets.only(top: params.marginTop, left: params.marginLeft),
      alignment: Alignment.center,
      child: AutoSizeText(
        params.text,
        style: TextStyle(
          fontSize: 100.0,
          fontFamily: params.fontFamily,
          letterSpacing: params.letterSpacing,
          fontWeight: params.fontWeight,
          color: Color(params.textColor)
        ),
        minFontSize: 12.0,
      )
    );
    // );
  }
}

class TopTitle extends StatelessWidget {
  final String text;
  TopTitle({Key key, @required this.text}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SpUtil.getSize(95.0),
      height: SpUtil.getSize(29.0),
      margin: EdgeInsets.only(top: SpUtil.getSize(59.0)),
      alignment: Alignment.center,
      child: AutoSizeText(
        text,
        style: TextStyle(
          fontSize: 100.0,
          fontFamily: "Roboto-Medium",
          letterSpacing: 2.36,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(107, 113, 141, 1.0)
        ),
        minFontSize: 12.0,
      ),
    );
  }
}



class OrText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SpUtil.getSize(39.0),
      height: SpUtil.getSize(33.0),
      margin: EdgeInsets.only(top: SpUtil.getSize(37.0)),
        child: AutoSizeText(
          "OR",
          style: TextStyle(
            fontSize: 100.0,
            fontFamily: "Roboto-Medium",
            letterSpacing: 2.68,
            color: Color.fromRGBO(107, 113, 141, 1.0)
          ),
        minFontSize: 12.0,
      ),
    );
  }
}

class RegisterText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SpUtil.getSize(235.0),
      height: SpUtil.getSize(29.0),
      margin: EdgeInsets.only(top: SpUtil.getSize(23.0)),
      alignment: Alignment.center,
      child: AutoSizeText(
        "I don't have an account",
        style: TextStyle(
          fontSize: 100.0,
          fontFamily: "Roboto-Medium",
          letterSpacing: 0.25,
          color: Color.fromRGBO(136, 169, 229, 1.0)
        ),
        minFontSize: 12.0,
      ),
    );
  }
}