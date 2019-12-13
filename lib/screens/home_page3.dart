import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../res/colors.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';

// BottomNavigationBar 默认的实例
class BottomNavigationBarFullDefault extends StatefulWidget {
  const BottomNavigationBarFullDefault() : super();
  @override
  State<StatefulWidget> createState() => _BottomNavigationBarFullDefault();
}

// BottomNavigationBar 默认的实例,有状态
class _BottomNavigationBarFullDefault extends State {
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
        // color: Colors.amber,
        height: double.maxFinite,
        // height: 200,
        child: new Stack(
          // alignment: Alignment(0, 300),
          alignment: FractionalOffset.bottomCenter,
  //          SizedBox(
  //       // height: 100,
  //       child:Column(
          
  // crossAxisAlignment: CrossAxisAlignment.center,
  // mainAxisAlignment: MainAxisAlignment.end,
    // Material(
    //     color: Color(ColorRes.buttonBgColor),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.end,
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
            BottomNavigationBar(
              type: BottomNavigationBarType
                  .fixed, // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
              iconSize: 24.0, // BottomNavigationBarItem 中 icon 的大小
              currentIndex: _currentIndex, // 当前所高亮的按钮index
              onTap: _onItemTapped, // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
              // backgroundColor: Color(ColorRes.buttonBgColor),
              fixedColor: Colors
                  .orange, // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    title: Text("Home"), icon: Icon(Icons.home, 
                    // {Color: Color(ColorRes.titleTextColor)}
                    )),
                BottomNavigationBarItem(
                  title: Text("Message"),
                  icon: Icon(FontAwesomeIcons.comments),
                ),
                BottomNavigationBarItem(
                  title: Text("Profile"),
                  icon: Icon(Icons.person),
                  backgroundColor: Color(ColorRes.buttonBgColor),
                ),
                BottomNavigationBarItem(
                    title: Text("Setting"), icon: Icon(Icons.list)),
                // BottomNavigationBarItem(
                //     title:  Text("menu"), icon:  Icon(Icons.menu)),
                // BottomNavigationBarItem(
                //     title:  Text("other"), icon:  Icon(Icons.devices_other)),
              ],
            )
          ],
        ));
  }
}
