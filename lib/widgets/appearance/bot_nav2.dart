import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/request_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/sp_util.dart';
import '../../res/colors.dart';
import '../../screens/setting_page.dart';

// BottomNavigationBar 默认的实例
class BotNav extends StatefulWidget {
  const BotNav() : super();
  @override
  State<StatefulWidget> createState() => _BotNav();
}


// BottomNavigationBar 默认的实例,有状态
class _BotNav extends State {
  // List<Route> toPage = [
  // // final List<Class> toPage = [

  //     Navigator.of(context).pushNamed(SettingPage.routeName),
  //     Navigator.of(context).pushNamed(SettingPage.routeName),
  //     Navigator.of(context).pushNamed(SettingPage.routeName),
  //     Navigator.of(context).pushNamed(SettingPage.routeName),
  //     // Page1,Page2,Page3,Page4,
  // ];
  //in source file of BottomNavigationBar there s a loop where u can modify the starting pt where u can make it 
  //start with 1 reserving 0 for nothing selected

  int _currentIndex = 0;
  void _onItemTapped(int index) {
    // Navigator.of(context).pushNamed(SettingPage.routeName);
    if(mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    // Container(
    //     alignment: Alignment.bottomCenter,
    //     // height: SpUtil.getSize(57.0),
    //     // padding: ,
    //     margin: EdgeInsets.only(
    //         top: SpUtil.getSize(
    //             46.0)), //41 marginTop, 57 nav height
    //     child: 
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
                title: Text("Home"),
                icon: Icon(
                  Icons.home,
                  // {Color: Color(ColorRes.titleTextColor)}
                )),
            // GestureDetector( onTap: () {}   
            BottomNavigationBarItem(
              title: Text("Message"),
              icon: Icon(FontAwesomeIcons.comments),
              // child:
              // onTap
              // onPressed
              // title: Text("Message"),
              // icon: GestureDetector(
              //   Icon(FontAwesomeIcons.comments);
              //   onTap: () {})
            ),
            // ),
            BottomNavigationBarItem(
              title: Text("Profile"),
              icon: Icon(Icons.person),
              // backgroundColor: Color(ColorRes.buttonBgColor),
              // title: Text("Profile"), 
              // icon: IconButton(
              //   icon: Icon(Icons.person),
              //   onPressed:() => Navigator.of(context).pushNamed(SettingPage.routeName),
              // ),
            ),
            BottomNavigationBarItem(
              title: Text("Setting"),
              icon: Icon(Icons.list),
              // GestureDetector(
              //   onTap: () {
              //     setState(() { _lights = true; });
              //   },
              //   title: Text("Setting"), icon: Icon(Icons.list)
              // )
              // title: Text("Setting"), 
              // icon: IconButton(
              //   icon: Icon(Icons.list),
              //   onPressed:() => Navigator.of(context).pushNamed(SettingPage.routeName),
              //   // onPressed:() => Navigator.of(context).pushNamed(RequestPage.routeName),
              // ),
            ),  
          ],
        ) 
        ;  
      // );
  }
  }

// class Page1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SettingPage;
//     // return Navigator.of(context).pushNamed(SettingPage.routeName);
//   }
// }