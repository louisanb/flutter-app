import '../utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../res/colors.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';

// BottomNavigationBarItem 默认的实例,无状态
class BottomNavigationBarItemLessDefault extends StatelessWidget {
  final widget;
  final parent;

  const BottomNavigationBarItemLessDefault([this.widget, this.parent])
      : super();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold( 
      body:
      // child: 
      SingleChildScrollView( 
        // SingleChildScrollView(
        // height: deviceSize.height,
        // width: deviceSize.width,
        // margin: const EdgeInsets.only(left: 20.0),
        // color: Colors.pink,
        child: Container( 
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column( 
        // children: SingleChildScrollView(
        children: <Widget>[
            
          RegButton(
            params: Params()
              ..text = 'Check Request'
              ..textHeight = 26.0
              ..fontFamily = "Roboto-Medium"
              ..letterSpacing = 2.14
              ..textColor = ColorRes.colorWhite//xx
              ..height = 94.0//xx2
              ..width = 242.0//xx2
              ..backgroundColor = ColorRes.buttonBgColor
              ..marginTop = 33,//20
            tap: () {
            }
          ),
          RegButton(
            params: Params()
              ..text = 'Upcoming Order'
              ..textHeight = 26.0
              ..fontFamily = "Roboto-Medium"
              ..letterSpacing = 2.14
              ..textColor = ColorRes.colorWhite//xx
              ..height = 94.0//xx2
              ..width = 242.0//xx2
              ..backgroundColor = ColorRes.buttonBgColor
              ..marginTop = 20,//20
            tap: () {
            }
          ),
          RegButton(
            params: Params()
              ..text = 'Order List'
              ..textHeight = 26.0
              ..fontFamily = "Roboto-Medium"
              ..letterSpacing = 2.14
              ..textColor = ColorRes.colorWhite//xx
              ..height = 94.0//xx2
              ..width = 242.0//xx2
              ..backgroundColor = ColorRes.buttonBgColor
              ..marginTop = 20,//20
            tap: () {
            }
          ),
          RegButton(
            params: Params()
              ..text = 'Schedule'
              ..textHeight = 26.0
              ..fontFamily = "Roboto-Medium"
              ..letterSpacing = 2.14
              ..textColor = ColorRes.colorWhite//xx
              ..height = 94.0//xx2
              ..width = 242.0//xx2
              ..backgroundColor = ColorRes.buttonBgColor
              ..marginTop = 20,//20
            tap: () {
            }
          ),
          // bottomNavigationBar:  
          BottomNavigationBar(items: [
             BottomNavigationBarItem(
                icon:  Icon(Icons.home),
                title:  Text("Home"),
                // backgroundColor: Colors.white
                backgroundColor: Color(ColorRes.titleTextColor),
            ),
             BottomNavigationBarItem(
                icon:  Icon(FontAwesomeIcons.comments),  title:  Text("msg")),
             BottomNavigationBarItem(icon:  Icon(Icons.person), title:  Text("我的")),
             BottomNavigationBarItem(
                icon:  Icon(Icons.list), 
                title:  Text("setting"),
                // backgroundColor: Colors.grey
                ),
          ],
            //onTap: onTap,
            //currentIndex: page
          ),//navbar
        ]
  // )
  )
        // )//Scaffold
    )));
  }//build
}//stt