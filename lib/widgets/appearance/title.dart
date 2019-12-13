import 'package:flutter/material.dart';
import '../../utils/parameter.dart';
import '../../utils/sp_util.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TitleBar extends StatelessWidget {
  final Params params;
  TitleBar({Key key, @required this.params}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: SpUtil.getSize(params.height),
        width: SpUtil.getSize(308.0),
        margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop)),
        // height: params.height,
        // width: 308.0,
        // margin: EdgeInsets.only(top: params.marginTop),
        child: Row(
          children: <Widget>[
            Container(
              height: SpUtil.getSize(params.height),
              // height: params.height,
              // child: GestureDetector(
              //   child: Image.asset("images/ic_back.png"),
              //   onTap: params.tap,
              // )
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: SpUtil.getSize(params.marginLeft)),
              height: SpUtil.getSize(params.textHeight),
              width: SpUtil.getSize(params.textWidth),
              // margin: EdgeInsets.only(left: params.marginLeft),
              // height: params.textHeight,
              // width: params.textWidth,
              child: AutoSizeText(
                params.text,
                style: TextStyle(
                  fontSize: 100.0,
                  fontFamily: params.fontFamily,
                  color: Color(params.textColor),
                  letterSpacing: params.letterSpacing,
                  fontWeight: FontWeight.bold
                ),
                minFontSize: 12.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
