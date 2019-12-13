import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../utils/sp_util.dart';
import '../../utils/parameter.dart';
import '../../res/colors.dart';

// class TextButton extends StatelessWidget {
//   final Params params;

//   TextButton({Key key, @required this.params}):super(key:key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: params.width,
//       height: params.height,
//       margin: EdgeInsets.only(top: params.margin),
//       alignment: Alignment.center,
//       child: AutoSizeText(
//         params.text,
//         style: TextStyle(
//           fontSize: 100.0,
//           fontFamily: params.fontFamily,
//           letterSpacing: params.letterSpacing,
//           color: Color(params.textColor)
//         ),
//         minFontSize: 12.0,
//       ),
//     );
//   }
// }

class TextButton extends StatelessWidget{
  final Params params;
  final tap;
  TextButton({Key key, @required this.params, this.tap}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: SpUtil.getSize(params.textWidth),
        height: SpUtil.getSize(params.textHeight),
        margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop)),
        // width: params.textWidth,
        // height: params.textHeight,
        // margin: EdgeInsets.only(top: params.marginTop),
        alignment: Alignment.center,
        child: AutoSizeText(
          params.text,
          style: TextStyle(
            fontSize: 100.0,
            fontFamily: "Roboto-Medium",
            letterSpacing: params.letterSpacing,
            fontWeight: FontWeight.w500,
            color: Color(ColorRes.titleTextColor)
          ),
          minFontSize: 12.0,
        ),
      ),
    );
  }
}

class RegButton extends StatelessWidget {
  final Params params;
  final tap;
  RegButton({Key key, @required this.params, this.tap}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SpUtil.getSize(params.width),
      height: SpUtil.getSize(params.height),
      margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop), 
      // bottom: SpUtil.getSize(params.marginBot)
      ),
      // width: 242.0,
      // height: 47.0,
      // margin: EdgeInsets.only(top: params.marginTop),
      child:RaisedButton(
        color: Color(ColorRes.buttonBgColor),
        splashColor: Colors.grey,
        child: Container(
          height: SpUtil.getSize(params.textHeight),
          // height: params.textHeight,
          alignment: params.textAlig,
          child: AutoSizeText(
            params.text,
            style: TextStyle(
              color: Color(params.textColor),
              fontSize: 100.0,
              fontFamily: params.fontFamily,
              letterSpacing: params.letterSpacing
            ),
            minFontSize: 12.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(SpUtil.getSize(8.0)))
          // borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        onPressed: (){
          tap();
        },
      )
    );
  }
}

class GreyButton extends StatelessWidget {
  final Params params;
  final tap;
  GreyButton({Key key, @required this.params, this.tap}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SpUtil.getSize(317.0),
      height: SpUtil.getSize(104.0),
      margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop), 
      // bottom: SpUtil.getSize(params.marginBot)
      ),
      // width: 242.0,
      // height: 47.0,
      // margin: EdgeInsets.only(top: params.marginTop),
      child:RaisedButton(
        color: Color(ColorRes.greyBtnColor),
        splashColor: Colors.grey,
        child: Container(
          height: SpUtil.getSize(24.0),//text height
          // alignment: Alignment.center,
          child: AutoSizeText(
            params.text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(ColorRes.greyBtnTxtColor),
              fontSize: 18.0,
              fontFamily: "Roboto-Medium",
              letterSpacing: params.letterSpacing
            ),
            minFontSize: 12.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(SpUtil.getSize(8.0)))
          // borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        onPressed: (){
          tap();
        },
      )
    );
  }
}