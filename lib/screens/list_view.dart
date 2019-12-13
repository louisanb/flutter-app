import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../widgets/appearance/bot_nav.dart';
import '../utils/sp_util.dart';
import '../widgets/appearance/text.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';


    class ListView2 extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ListViews',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: Scaffold(
            appBar: AppBar(title: Text('ListViews')),
            body: BodyLayout(),
            bottomNavigationBar: BotNav(),
          ),
        );
      }
    }

    class BodyLayout extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return _myListView(context);
      }
    }

    // replace this function with the code in the examples
Widget _myListView(BuildContext context) {
      return ListView(
        children: <Widget>[
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
                        ..marginTop = 38.0,//28
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
                 prefix0.Text("1"),
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
                          ..text = "1"
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
                      ..text = '2' 
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
                  ..text = '3' 
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
                  ..text = '4' 
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
                  ..text = '5' 
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
                  ..text = '6' 
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
                  ..text = '7' 
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
                  ..marginTop = 18.0
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
                ..textAlig = Alignment.center
                ..marginLeft = 8.0 //18
                ..marginTop = 40.0,
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
                // ..textAlig = Alignment.center
                ..marginLeft = 8.0 //18
                ..marginTop = 21.0,
            tap: () {
              
            }
          ),    
          ],),
        ],
      );
    }