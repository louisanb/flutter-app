import 'package:flutter/material.dart';
import '../../utils/sp_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../utils/parameter.dart';
import '../../res/colors.dart';

class AutoText extends StatelessWidget {
  final Params params;
  // final Widget alignment;
  final alignment;
  AutoText(
      {Key key,
      //somehow marginLeft is requred even if u commend out @required at line below
      @required this.params,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("text w: AutoText");
    return
        // Flexible( child:
        Container(
            // color: Colors.black,
            width: SpUtil.getSize(params.textWidth),
            height: SpUtil.getSize(params.textHeight),
            margin: EdgeInsets.only(
                top: SpUtil.getSize(params.marginTop),
                left: SpUtil.getSize(params.marginLeft)),
            // width: params.textWidth,
            // height: params.textHeight,
            // margin: EdgeInsets.only(top: params.marginTop),
            // margin: EdgeInsets.only(top: params.marginTop, left: params.marginLeft),
            // alignment: Alignment.center,
            alignment: params.textAlig,
            child: AutoSizeText(
              params.text,
              style: TextStyle(
                  fontSize: SpUtil.getSize(params.fontSize),
                  fontFamily: params.fontFamily,
                  letterSpacing: params.letterSpacing,
                  // fontWeight: params.fontWeight,
                  fontWeight: FontWeight.w500,//not in design
                  color: Color(params.textColor)),
              minFontSize: 12.0,
              softWrap: true,
            ));
    // );
  }
}

class TopTitle extends StatelessWidget {
  final String text;
  TopTitle({Key key, @required this.text}) : super(key: key);

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
            color: Color.fromRGBO(107, 113, 141, 1.0)),
        minFontSize: 12.0,
      ),
    );
  }
}
//u can modify the TextButton to achive the same thing as TextBox but there s some trade off on performance u need to calculate carefully 
//so this is for future work. by modify i mean u ll have to add conditions inside to omit some features like getgesture etc.
class TextBox extends StatelessWidget {
  final Params params;
  // final Widget alignment;
  final alignment;
  TextBox({Key key, @required this.params, this.alignment}) : super(key: key);
//there might be better ways to do this rounded box/container this is kind of stupid due to clip u need another container wrap it outside for margins
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only(
        // top: SpUtil.getSize(10.0),
        // left: SpUtil.getSize(20.0),
        top: SpUtil.getSize(params.marginTop),
        left: SpUtil.getSize(params.marginLeft),
      ),
      child: 
      ClipRRect(
        borderRadius: BorderRadius.circular(SpUtil.getSize(10)),
        child: Container(
          // color: Color(params.bgColor),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                params.lgS.withOpacity(0.9),//0.5
                params.lgE.withOpacity(0.5),//0.9
                // params.lgS,
                // params.lgE,
              ],
              begin: 
              // Alignment.centerLeft,
              Alignment
                  .topLeft, //designed is from left to right straight so
              end: Alignment.bottomRight,
              // stops: [0, 0.4, 0.8, 1],
              stops: [0.3, 1],
            ),
          ),
          // color: Colors.red,
          width: SpUtil.getSize(params.textWidth),
          height: SpUtil.getSize(params.textHeight),
          // margin: EdgeInsets.only(
          //     top: SpUtil.getSize(params.marginTop),
          //     left: SpUtil.getSize(params.marginLeft),
          // ),
          //padding in flutter feels like margin and margin in lfutter feels like padding test
          // padding: EdgeInsets.only(
          //     top: SpUtil.getSize(params.marginTop),
          //     left: SpUtil.getSize(params.marginLeft),
          // ),
          // alignment: Alignment.center,
          child: 
          Center( child:
          AutoSizeText(
            params.text,
            // textAlign: TextAlign.center,
            style: TextStyle(
                letterSpacing: params.letterSpacing,
                fontFamily: params.fontFamily,
                fontSize: params.fontSize,
                fontWeight: FontWeight.w500,
                // color: Color(ColorRes.titleTextColor)
                color: Color(params.textColor)),
            minFontSize: 12.0,
          ),),
        ), //container
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
            color: Color.fromRGBO(107, 113, 141, 1.0)),
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
            color: Color.fromRGBO(136, 169, 229, 1.0)),
        minFontSize: 12.0,
      ),
    );
  }
}
