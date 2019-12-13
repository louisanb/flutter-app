import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' as prefix0;
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/products.dart';

import '../utils/sp_util.dart';
import '../widgets/appearance/text.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';
import '../widgets/appearance/bot_nav.dart';


class OrdersDetailScreen extends StatefulWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/order-detail-screen';
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _OrdersDetailScreenState createState() => _OrdersDetailScreenState();
}

class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  // @override
  // void initState() {
  //   // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
  //   Future.delayed(Duration.zero).then((_) {
  //     Provider.of<Products>(context).fetchAndSetProducts();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return 
    Scaffold(
      // key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: 
      // Column( children: <Widget>[
      // Stack( children: <Widget>[
      // SingleChildScrollView(
      //   // child: ConstrainedBox(
      //   //   constraints: BoxConstraints(
      //   //     minHeight: 500,
      //   //   ),
      //   //    child: IntrinsicHeight(
      //   child: 
        // Container(
        //   color: Colors.red,
        //   height: 500,
        //   child: 
      //   Stack( children: <Widget>[
        // Column( children: <Widget>[
          ListView(children: <Widget>[
        Column(
          children: <Widget>[
            // ListView(children: <Widget>[
            Row(
              children: [
                // Padding(
                //   padding: EdgeInsets.only(left: SpUtil.getSize(307.0)),
                //   child: Text(
                //       'Chat',
                //     style: TextStyle(
                //       color: Color(ColorRes.greyBtnTxtColor),
                //       fontFamily: "Roboto-Bold",
                //       letterSpacing: 1.71,
                //       fontSize: 16,

                //     ),
                //   ),
                // ),
//iconButton need to be created and added to the button widget so we can add style and reuse it
//there must be better way to write this big block of code.                 
                IconButton(icon:Icon(Icons.arrow_back),
                  onPressed:() => Navigator.pop(context, false),
                ),
                TextButton(
                      params: Params()
                        ..text = "Chat"
                        ..bgColor = ColorRes.colorWhite
                        ..textHeight = 26.0
                        ..textWidth = 45.0
                        ..letterSpacing = 1.71
                        ..fontFamily = "Roboto-Bold"
                        ..fontSize = 16.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..marginLeft = 307.0 
                        ..marginTop = 28.0,//28
                      tap: () {
                        //  _switchAuthMode();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return SignUpPage();
                        // }));
                      }
                  )  
              ],
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: SpUtil.getSize(70.0),
                  width: SpUtil.getSize(70.0),
                  margin: EdgeInsets.only(top: SpUtil.getSize(25.0), left: SpUtil.getSize(40.0)),
                  // color: Colors.red,
                  child:
                  CircleAvatar(
                    backgroundImage: NetworkImage(loadedProduct.imageUrl),
                    minRadius: 90,
                    maxRadius: 150,
                  ),
                  // decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  // child: 
                  // // Spacer(),
                  // image: NetworkImage(
                  // // Image.network(
                  //   loadedProduct.imageUrl,
                  //   // "img not linked yet",
                  //   // "https://s3.amazonaws.com/louisanresume.com/public/images/resume/me.JPG",
                  //   // fit: BoxFit.cover,
                  //   fit: BoxFit.fill,
                  // ),
                  // ),//decoration
                ),//container
                Column(
                  children: <Widget>[
//Expanded or constariner xxxx.expend or mainAlixAlignment may needed here to fill up the space now i altered the designed param to do the same
                    AutoText(
                      params: Params()
                          ..text = "${loadedProduct.buyerId}"
                          // ..text = "def"
                          ..textHeight = 26.0
                          ..textWidth = 116.0
                          ..textColor = ColorRes.greyBtnTxtColor
                          ..letterSpacing = 1.17
                          ..fontSize = 16.0
                          // ..fontWeight = FontWeight.w500
                          // ..alignment = null
                          ..marginTop = 30.0//84, 5
                          ..marginLeft = 5.0//21
                    ),
                    // Container( 
                      //padding ll help to see where is the problem/container
                      // padding: EdgeInsets.only(
                      //     top: SpUtil.getSize(10), 
                      //     left: SpUtil.getSize(10),
                      // ),
                      // margin: EdgeInsets.only(
                      //     top: SpUtil.getSize(10.0), 
                      //     left: SpUtil.getSize(20.0),
                      // ),
                      // child:
                    TextBox(
                      params: Params()
                        ..text = 'request'
                        // ..bgColor = ColorRes.greyBtnChatColor
                        ..lgS = const Color.fromRGBO(71, 73, 160, 0)
                        ..lgE = const Color.fromRGBO(219, 220, 255, 0)
                        ..textHeight = 30.0
                        ..textWidth = 132.0
                        ..letterSpacing = 1.71 
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 16.0 
                        ..textColor = ColorRes.colorWhite
                        ..marginLeft = 20 //20
                        ..marginTop = 10,//10
                    ),
                    // )
                  ],
                ), 
                // Container(
                // //   alignment: Alignment.center,
                //   child: 
                // Center(child: 
                // Container(child: 
                AutoText(
                  params: Params()
                      ..text = '\$${loadedProduct.price}' 
                      ..textHeight = 33.0
                      ..textWidth = 94.0 //51
                      ..textColor = ColorRes.greyBtnTxtColor
                      ..letterSpacing = 1.56
                      ..fontSize = 25.0 //25
                      // ..fontWeight = FontWeight.w500
                      ..fontFamily = 'Roboto-Medium'
                      // ..alignment = Alignment.center
                      ..marginTop = 66.0
                      ..marginLeft = 20.0,
                ),
                // ),
                // ), 
              ],
            ),
            Container ( 
              alignment: Alignment.topLeft,
              child:
            AutoText(
              params: Params()
                  ..text = 'Request Detail' 
                  ..textHeight = 26.0
                  ..textWidth = 180.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1
                  ..fontSize = 16.0
                  ..fontFamily = 'Roboto-Medium'
                  // ..alignment = Alignment(-1.0, -1.0)
                  // ..alignment = Alignment.topLeft
                  ..marginTop = 25.0
                  ..marginLeft = 27.0,
            ), 
            ),
            Divider(),
            // Container(
            //   height: 1,
            //   width: double.maxFinite,
            //   color: Colors.grey,
            // ),
            Row( children: <Widget>[
            // Container ( 
            //   alignment: Alignment.topLeft,
            //   child:
            AutoText(
              params: Params()
                  ..text = 'Time' 
                  ..textHeight = 26.0
                  ..textWidth = 45.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1
                  ..fontSize = 16.0
                  ..fontFamily = 'Roboto-Medium'
                  ..marginTop = 11.0 //22
                  ..marginLeft = 27.0,
            ),
            AutoText(
              params: Params()
                  ..text = '${loadedProduct.time}' 
                  ..textHeight = 26.0
                  ..textWidth = 190.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1
                  ..fontSize = 16.0
                  // ..fontWeight = FontWeight.w500
                  ..fontFamily = 'Roboto-Regular'
                  // ..alignment = Alignment.center
                  ..marginTop = 11.0
                  ..marginLeft = 91.0,
            ), 
            ]
            ), 
            Row( 
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              // Container ( 
              // alignment: Alignment.topLeft,
              // child:
               
              AutoText(
                params: Params()
                    ..text = 'Location' 
                    ..textHeight = 26.0
                    ..textWidth = 77.0 
                    ..textColor = ColorRes.greyBtnTxtColor
                    ..letterSpacing = 1
                    ..fontSize = 16.0
                    ..fontFamily = 'Roboto-Medium'
                    ..marginTop = 12.0 //22
                    ..marginLeft = 27.0,
              ),
            AutoText(
              params: Params()
                  ..text = '${loadedProduct.address}' 
                  ..textHeight = 67.0
                  ..textWidth = 190.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1
                  ..fontSize = 16.0
                  // ..fontWeight = FontWeight.w500
                  ..fontFamily = 'Roboto-Regular'
                  // ..alignment = Alignment.center
                  ..marginTop = 11.0
                  ..marginLeft = 59.0,
            ), 
          ]),
          Divider(),
          Row( children: <Widget>[
            AutoText(
              params: Params()
                  ..text = 'Item' 
                  ..textHeight = 26.0
                  ..textWidth = 41.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1.71
                  ..fontSize = 16.0
                  ..fontFamily = 'Roboto-Medium'
                  ..marginTop = 8.0 //22
                  ..marginLeft = 27.0,
            ),
            AutoText(
              params: Params()
                  ..text = 'Amount' 
                  ..textHeight = 26.0
                  ..textWidth = 69.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1.71
                  ..fontSize = 16.0
                  ..fontFamily = 'Roboto-Medium'
                  ..marginTop = 8.0 //22
                  ..marginLeft = 144.0,
            ),
            AutoText(
              params: Params()
                  ..text = 'Price' 
                  ..textHeight = 26.0
                  ..textWidth = 53.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1.71
                  ..fontSize = 16.0
                  ..fontFamily = 'Roboto-Medium'
                  ..marginTop = 8.0 //22
                  ..marginLeft = 19.0,
            ),
          ],),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            AutoText(
              params: Params()
                  ..text = '${loadedProduct.description}' 
                  ..textHeight = 78.0
                  ..textWidth = 180.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1
                  ..fontSize = 16.0
                  // ..fontWeight = FontWeight.w500
                  ..fontFamily = 'Roboto-Regular'
                  // ..alignment = Alignment.center
                  ..marginTop = 12.0
                  ..marginLeft = 27.0,
            ), 
            AutoText(
              params: Params()
                  ..text = '${loadedProduct.quantity}' 
                  ..textHeight = 26.0
                  ..textWidth = 34.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1.71
                  ..fontSize = 16.0
                  // ..fontWeight = FontWeight.w500
                  ..fontFamily = 'Roboto-Regular'
                  // ..alignment = Alignment.center
                  ..marginTop = 12.0
                  ..marginLeft = 30.0,//6
            ), 
            AutoText(
              params: Params()
                  ..text = '\$${loadedProduct.price}' 
                  ..textHeight = 26.0
                  ..textWidth = 34.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1.71
                  ..fontSize = 16.0
                  // ..fontWeight = FontWeight.w500
                  ..fontFamily = 'Roboto-Regular'
                  // ..alignment = Alignment.center
                  ..marginTop = 12.0
                  ..marginLeft = 34.0,//58
            ), 
          ],),
          Divider(),
          Row( children: <Widget>[
            AutoText(
              params: Params()
                  ..text = 'Strip Fee(3rd party online trans. fee)' 
                  ..textHeight = 17.0
                  ..textWidth = 260.0 //180
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 0.79
                  ..fontSize = 13.0
                  ..fontFamily = 'Roboto-Medium'
                  ..marginTop = 9.0 //22
                  ..marginLeft = 27.0,
            ),
            AutoText(
              params: Params()
                  ..text = '\$2' 
                  ..textHeight = 26.0
                  ..textWidth = 34.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1.71
                  ..fontSize = 16.0
                  // ..fontWeight = FontWeight.w500
                  ..fontFamily = 'Roboto-Regular'
                  // ..alignment = Alignment.center
                  ..marginTop = 9.0
                  ..marginLeft = 10.0,//98
            ), 
          ],),
          Divider(),
          Row(children: <Widget>[
            AutoText(
              params: Params()
                  ..text = 'Total' 
                  ..textHeight = 17.0
                  ..textWidth = 35.0 //34
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 0.79
                  ..fontSize = 13.0
                  // ..fontWeight = FontWeight.w500
                  ..fontFamily = 'Roboto-Regular'
                  // ..alignment = Alignment.center
                  ..marginTop = 13.0 //18
                  ..marginLeft = 260.0,
            ), 
            AutoText(
              params: Params()
                  ..text = '\$25' 
                  ..textHeight = 26.0
                  ..textWidth = 34.0 
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1.71
                  ..fontSize = 16.0
                  // ..fontWeight = FontWeight.w500
                  ..fontFamily = 'Roboto-Bold'
                  // ..alignment = Alignment.center
                  ..marginTop = 17.0 //15
                  ..marginLeft = 11.0,
            ), 
          ]),
//bug cant position it or mrgin s not working felt like there s an invisible center widget constraining it          
          RegButton(
              params: Params()
                ..text = 'Confirm'
                ..textHeight = 26.0
                ..fontFamily = 'Rotobto-Medium'
                ..fontSize = 20
                ..letterSpacing = 2.14
                ..textColor = ColorRes.colorWhite
                ..height = 47.0
                ..width = 242.0
                ..backgroundColor = ColorRes.greyBtnChatColor
                // ..alignment = Alignment.center
                ..marginLeft = 8.0 //18
                ..marginTop = 15.0, //40
              tap: () {
               
              }
          ),
          RegButton(
              params: Params()
                ..text = 'Edit'
                ..textHeight = 26.0
                ..fontFamily = 'Rotobto-Medium'
                ..fontSize = 20
                ..letterSpacing = 2.14
                ..textColor = ColorRes.colorWhite
                ..height = 47.0
                ..width = 242.0
                ..backgroundColor = ColorRes.greyBtnChatColor
                // ..alignment = Alignment.center
                ..marginLeft = 8.0 //18
                ..marginTop = 21.0,
              tap: () {
               
              }
          ),    
          ],),
          ]),//list view
          // ),//container 
          bottomNavigationBar: BotNav(),

        //   ],
        // ),
        //    ),
        // ),
      // ),//scroll
      // Container(
      //   alignment: Alignment.bottomCenter,
      //   // height: SpUtil.getSize(57.0),
      //   // padding: ,
      //   margin: EdgeInsets.only(
      //       top: SpUtil.getSize(
      //           46.0)), //41 marginTop, 57 nav height
      //   child: BottomNavigationBar(
      //     type: BottomNavigationBarType
      //         .fixed, // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
      //     iconSize: 24.0, // BottomNavigationBarItem 中 icon 的大小
      //     currentIndex: _currentIndex, // 当前所高亮的按钮index
      //     onTap: _onItemTapped, // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
      //     // backgroundColor: Color(ColorRes.buttonBgColor),
      //     fixedColor: Colors
      //         .orange, // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           title: Text("Home"),
      //           icon: Icon(
      //             Icons.home,
      //             // {Color: Color(ColorRes.titleTextColor)}
      //           )),
      //       BottomNavigationBarItem(
      //         title: Text("Message"),
      //         icon: Icon(FontAwesomeIcons.comments),
      //       ),
      //       BottomNavigationBarItem(
      //         title: Text("Profile"),
      //         icon: Icon(Icons.person),
      //         backgroundColor: Color(ColorRes.buttonBgColor),
      //       ),
      //       BottomNavigationBarItem(
      //           title: Text("Setting"), icon: Icon(Icons.list)),
      //     ],
      //   )   
      // )//bot nav
      // ]),
      
    );
  }
}
