import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/sp_util.dart';
import '../../res/colors.dart';
import '../../screens/setting_page.dart';
import '../../widgets/appearance/text.dart';
import '../../utils/parameter.dart';
import '../../screens/home_page.dart';
import '../../screens/chat_list_pg.dart';
import 'package:provider/provider.dart';
import '../../providers/products.dart';


class BotNav extends StatefulWidget{
// Future<void> _refreshProducts(BuildContext context) async { //cant be here
//     await Provider.of<Products>(context, listen: false)
//         // .fetchAndSetProducts(true);
//         .fetchAndSetProducts();
// }
@override
  _BotNavState createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  static var _active; 

  // Future<void> _refreshProducts(BuildContext context) async {
  //   await Provider.of<Products>(context, listen: false)
  //       // .fetchAndSetProducts(true);
  //       .fetchAndSetProducts();
  // }

  @override
  Widget build(BuildContext context) {
    //static final deviceSize = MediaQuery.of(context).size;//static cant be here
    final deviceSize = MediaQuery.of(context).size;
    final respvW = deviceSize.width/4; 
    return 
    Container(
      //without height super weird bug setting pg upfront without clicking and nothing else
      height: SpUtil.getSize(56.0),//56 80
      // alignment: Alignment.center,
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
              GestureDetector( 
                onTap: () {
                  //weird bug: 666666666666666666666 ModalRoute.of(context).settings.arguments in edit pg: null 
                  Navigator.of(context).pushNamed(HomePage.routeName);
                  setState(() {
                    _active = "1";
                  });
                },
                child: Column(children: <Widget>[
                    // IconButton(
                    Icon(
                      // color: (active) ? Colors.orange : null
                      // icon: 
                      Icons.home,
                      color: (_active == "1") ? Colors.orange : Color(ColorRes.greyBtnChatColor)
                    ),
                      // onPressed:() => Navigator.of(context).pushNamed(SettingPage.routeName),
                      // onPressed:() => Navigator.of(context).pushNamed(RequestPage.routeName),
                    // ),
                    // Text("Setting"),
                    AutoText(
                      params: Params()
                          ..text = "Home"
                          ..textHeight = 26.0
                          ..textWidth = respvW
                          ..textAlig = Alignment.center
                          ..textColor = (_active == "1") ? ColorRes.orange : ColorRes.greyBtnChatColor
                          ..letterSpacing = 1.17
                          ..fontSize = 16.0
                          ..marginTop = 0
                          ..marginLeft = 0
                    ), 
                ],),
              ),
             GestureDetector( 
                onTap: () {
                  Navigator.of(context).pushNamed(ChatListPage.routeName);
                  setState(() {
                    _active = "2";
                  });
                },
                child: Column(children: <Widget>[
                    Icon(
                      FontAwesomeIcons.comments,
                      color: (_active == "2") ? Colors.orange : Color(ColorRes.greyBtnChatColor)
                    ),
                    AutoText(
                      params: Params()
                          ..text = "Message"
                          ..textHeight = 26.0
                          ..textWidth = respvW
                          ..textAlig = Alignment.center
                          ..textColor = (_active == "2") ? ColorRes.orange : ColorRes.greyBtnChatColor
                          ..letterSpacing = 1.17
                          ..fontSize = 16.0
                          ..marginTop = 0
                          ..marginLeft = 0
                    ), 
                ],),
              ),
              GestureDetector( 
                onTap: () {
                  // Future.delayed(Duration.zero).then((_) async{      
                  //   await _refreshProducts(context);
                  //   Navigator.pop(context, false);
                  // });
                  Navigator.of(context).pushNamed(SettingPage.routeName);
                  setState(() {
                    _active = "3";
                  });
                },
                child: Column(children: <Widget>[
                    Icon(
                      Icons.person,
                      color: (_active == "3") ? Colors.orange : Color(ColorRes.greyBtnChatColor)
                    ),
                    AutoText(
                      params: Params()
                          ..text = "Profile"
                          ..textHeight = 26.0
                          ..textWidth = respvW
                          ..textAlig = Alignment.center
                          ..textColor = (_active == "3") ? ColorRes.orange : ColorRes.greyBtnChatColor
                          ..letterSpacing = 1.17
                          ..fontSize = 16.0
                          ..marginTop = 0
                          ..marginLeft = 0
                    ), 
                ],),
              ),
              GestureDetector( 
                onTap: () {
                  Navigator.of(context).pushNamed(SettingPage.routeName);
                  setState(() {
                    _active = "4";
                  });
                },
                child: Column(children: <Widget>[
                    Icon(
                      Icons.list,
                      color: (_active == "4") ? Colors.orange : Color(ColorRes.greyBtnChatColor)
                    ),
                    AutoText(
                      params: Params()
                          ..text = "Setting"
                          ..textHeight = 26.0
                          ..textWidth = respvW
                          ..textAlig = Alignment.center
                          ..textColor = (_active == "4") ? ColorRes.orange : ColorRes.greyBtnChatColor
                          ..letterSpacing = 1.17
                          ..fontSize = 16.0
                          ..marginTop = 0
                          ..marginLeft = 0
                    ), 
                ],),
              ),
        ],),
    );

  }
}