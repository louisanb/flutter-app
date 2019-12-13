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
  TextButton({
    Key key, 
    @required 
    this.params, 
    this.tap
    }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: 
      //weird bug if put clip here but is fixed. the problem seems like there s an "extra container" so when round corners
      //only one corner that s identical with the "extra container" ll be rounded with the margin stuff but u can try stack
      //positioned.fill to make it fill or fit in the container perfectly that way u can cut/round corners and just move 
      //margin to outsite
      ClipRRect(
          borderRadius: BorderRadius.circular(SpUtil.getSize(10)),
          child: 
          // Align(
          //     alignment: Alignment.center, child:
          Container(
              color: Color(params.bgColor),
              // color: Colors.red,
              width: SpUtil.getSize(params.textWidth),
              height: SpUtil.getSize(params.textHeight),
              margin: EdgeInsets.only(
                  top: SpUtil.getSize(params.marginTop), 
                  left: SpUtil.getSize(params.marginLeft),
              ),//18 first 12 
              // width: params.textWidth,
              // height: params.textHeight,
              // margin: EdgeInsets.only(top: params.marginTop),
              alignment: Alignment.center,
              child: 
              // Align(
              //   alignment: Alignment.center, child: 
                AutoSizeText(
                  params.text,
                  style: TextStyle(
                    letterSpacing: params.letterSpacing,
                    fontFamily: params.fontFamily,
                    fontSize: params.fontSize,
                    fontWeight: FontWeight.w500,
                    // color: Color(ColorRes.titleTextColor)
                    color: Color(params.textColor) 
                  ),
                  minFontSize: 12.0,
                ),
              // ),
          ),
          // ),
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
      margin: EdgeInsets.only(top: SpUtil.getSize(params.marginTop), left: SpUtil.getSize(params.marginLeft), 
      // bottom: SpUtil.getSize(params.marginBot)
      ),
      // width: 242.0,
      // height: 47.0,
      // margin: EdgeInsets.only(top: params.marginTop),
      child:RaisedButton(
        color: Color(params.backgroundColor),
        splashColor: Colors.grey,
        child: Container(
          height: SpUtil.getSize(params.textHeight),
          // height: params.textHeight,
          // alignment: params.textAlig,
          alignment: Alignment.center,//text align
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

class IconButtonC extends StatelessWidget {
  final Params params;
  final tap;
  IconButtonC({Key key, @required this.params, this.tap}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SpUtil.getSize(params.width),
      height: SpUtil.getSize(params.height),
      margin: EdgeInsets.only(
        top: SpUtil.getSize(params.marginTop), 
        left: SpUtil.getSize(params.marginLeft), 
      // bottom: SpUtil.getSize(params.marginBot)
      ),
      // child:RaisedButton(
      //   color: Color(params.backgroundColor),
      //   splashColor: Colors.grey,
        // child: 
        // Container(
        //   height: SpUtil.getSize(params.textHeight),
        //   // alignment: params.textAlig,
        //   alignment: Alignment.center,//text align
          child: 
          IconButton(
            icon: params.icon,
            iconSize: params.size,
            color: Color(params.iconColor),
            onPressed: () {
                // print("777777777777add btn pressed");
                tap();
              },
          ),  
          // AutoSizeText(
          //   params.text,
          //   style: TextStyle(
          //     color: Color(params.textColor),
          //     fontSize: 100.0,
          //     fontFamily: params.fontFamily,
          //     letterSpacing: params.letterSpacing
          //   ),
          //   minFontSize: 12.0,
          // ),
        // ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(SpUtil.getSize(8.0)))
      //   ),
      //   onPressed: (){
      //     tap();
      //   },
      // )
    );
  }
}

class IconBtn extends StatelessWidget {
  final Params params;
  final tap;
  IconBtn({Key key, @required this.params, this.tap}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: 
        Container(
          width: SpUtil.getSize(params.width),
          height: SpUtil.getSize(params.height),
          margin: EdgeInsets.only(
            top: SpUtil.getSize(params.marginTop), 
            left: SpUtil.getSize(params.marginLeft), 
          // bottom: SpUtil.getSize(params.marginBot)
          ),
          child: 
          Icon( //..icon=Icon(Icons.add_box) icon: params.icon,
            params.icon3,
            // params.icon,
            // params.icon2,
            // Icon(params.icon2),
            // Icon(Icons.params.icon2),
            // Icon(Icons.params.icon),
            // Icon(params.icon),
            size: params.size,
            color: Color(ColorRes.greyBtnChatColor),
            
          ),  
        ),//container
        onTap: tap(),
    );
  }
}