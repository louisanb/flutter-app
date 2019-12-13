import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/prod_edit.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

import '../utils/sp_util.dart';
import '../widgets/appearance/text.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';
import '../widgets/appearance/bot_nav.dart';
// import '../screens/edit_page.dart';

import 'dart:math';
import 'package:intl/intl.dart';
import '../widgets/time_picker.dart';
import '../widgets/prod_edit.dart';


class SettingPage extends StatelessWidget {

static const routeName = '/Setting-page';

Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        // .fetchAndSetProducts(true);
        .fetchAndSetProducts();
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: 
              // FutureBuilder(
              //   future: _refreshProducts(context),
              //   builder: (ctx, snapshot) =>
              //       snapshot.connectionState == ConnectionState.waiting
              //           ? Center(
              //               child: CircularProgressIndicator(),
              //             )
              //           : RefreshIndicator(
              //               onRefresh: () => _refreshProducts(context),
              //               child:
                            BodyLayout(),
                            // ),),
            bottomNavigationBar: BotNav(),
          );
      }
    }

class BodyLayout extends StatelessWidget {

  // Future<void> _refreshProducts(BuildContext context) async {
  //   await Provider.of<Products>(context, listen: false)
  //       // .fetchAndSetProducts(true);
  //       .fetchAndSetProducts();
  // }  
  @override
  Widget build(BuildContext context) {
    return 
    // Text("data"); 
    _myListView(context);
  }
}

//tt this might be redudent so just put this in body layout straightly
Widget _myListView(BuildContext context) {
  // Future<void> _refreshProducts(BuildContext context) async {
  //   await Provider.of<Products>(context, listen: false)
  //       // .fetchAndSetProducts(true);
  //       .fetchAndSetProducts();
  // }
  // print('666666666666666666666 ModalRoute.of(context).settings.arguments in edit pg:');
  // print('${ModalRoute.of(context).settings.arguments}');
  //this is needed but i thoguht not so, since prodId is passed in which is (conterted) string xx actually i was right
  // final productId =
  //       ModalRoute.of(context).settings.arguments as List; 
  // final prodId = productId[0].toString();
  // final productId = ModalRoute.of(context).settings.arguments as String; 
  // print("99999999996666666 productId in edit pg: $productId");
  final load = Provider.of<Products>(
    context,
    // listen: false,
  );
  // final emailV = loadedProduct['emailV']; 
  final emailV = load.items[0].emailV;//u can also get this with _serv way 
  print('0000000000 emialV=loadedProduct.items[0] in setting pg: $emailV');
  print('0000000000 load.items in setting pg: ${load.items}');
  print('0000000000 load.items[0] in setting pg: ${load.items[0]}');
  print('0000000000 load.items[0].img in setting pg: ${load.items[0].imageUrl}');
  // final loadedProduct = Provider.of<Products>(
  //   context,
  //   listen: false,
  // ).findById(productId);
    // final time = DateFormat('dd/MM/yyyy hh:mm').format(loadedProduct.time);
    //  timeFormat(order.created_at) ,
  // timeFormat(time) {
  //time format 2019-03-24T03:03:38.291512Z
  // if (time && typeof time === "string") {
  //   if (true) {
  //   var arr = time.split("T");
  //   var result = arr[0] + " " + arr[1].slice(0, 5);
  //   print("999999time in edit pg: $result");
  //   // return result.replace(/-/g, "/");
  // }
  // timeFormat(loadedProduct.time);
    
    // String fm = loadedProduct.time.replaceAll('T',' ');
    // fm = fm.replaceAll('.',' ');
    // List<String> fTime = fm.split(' ');
    // String fmt = fTime[1].substring(0, 5);
    // print('9999999 fTime in edit pg: $fTime');
    // print("9999999 fmt in edit pg: $fmt");
    // String fmd = fTime[0];
    
    // String fm = loadedProduct.time;
    // // fm = fm.replaceAll('.',' ');
    // List<String> fTime = fm.split(' ');
    // String fmt = fTime[1];
    // print('9999999 fTime in edit pg: $fTime');
    // print("9999999 fmt in edit pg: $fmt");
    // String fmd = fTime[0];
// }
  return 
  // Text("data");
     ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[ 
                  IconButtonC(
                    params: Params()
                      ..icon = Icon(Icons.arrow_back)
                      ..iconColor = ColorRes.greyBtnChatColor
                      ..height = 50.0//touchable area 29
                      ..width = 50.0 //17
                      ..size = 22.0 
                      ..marginLeft = 18.0
                      ..marginTop = 28.0,//45
                    tap: () {
                      // set
                      Navigator.pop(context, false);
                    }
                  ),     
                  // IconButton(icon:Icon(Icons.arrow_back),
                  //   onPressed:() => Navigator.pop(context, false),
                  // ),
                  AutoText(
                      params: Params()
                        ..text = "Account Setting"
                        ..textHeight = 32.0
                        ..textWidth = 195.0
                        ..textColor = ColorRes.editTitle
                        ..letterSpacing = 1.37
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 24.0
                        ..marginLeft = 29.0
                        ..marginTop = 47.0,
                  ),
            ]),
            Divider(color: Color(ColorRes.greyBtnChatColor),),
            Row(
              children: <Widget>[           
                  AutoText(
                      params: Params()
                        ..text = "Email"
                        ..textHeight = 24.0
                        ..textWidth = 51.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..letterSpacing = 1
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 18.0
                        ..marginLeft = 30.0 
                        ..marginTop = 19.5,
                  ),
                  AutoText(
                      params: Params()
                        ..text = "$emailV"
                        ..textHeight = 20.0
                        ..textWidth = 270//127d+137mL=264 260+10
                        ..textColor = ColorRes.emailGrey
                        ..letterSpacing = 0.83
                        ..fontFamily = "Roboto-Regular"
                        ..fontSize = 15.0
                        ..textAlig = Alignment.centerRight
                        ..marginLeft = 10.0 //4
                        ..marginTop = 21,
                  ),
              ],
            ),
            Divider(color: Color(ColorRes.greyBtnChatColor),),
            //tt u can also wrap the whole row with GestureDetector which might be better
            Row(
              children: <Widget>[
                TextButton(
                  params: Params()
                    ..text = "Change Password"
                    ..bgColor = ColorRes.colorWhite
                    ..textHeight = 24.0
                    ..textWidth = 161.0
                    ..letterSpacing = 1
                    ..fontFamily = "Roboto-Medium"
                    ..fontSize = 18.0
                    ..textColor = ColorRes.greyBtnTxtColor
                    ..marginLeft = 30.0 
                    ..marginTop = 15.0,
                  tap: () {

                  }
                ),  
                IconButtonC(
                    params: Params()
                      ..icon = Icon(Icons.keyboard_arrow_right)
                      ..iconColor = ColorRes.greyBtnChatColor
                      ..height = 50.0//33
                      ..width = 50.0 //16
                      ..size = 36.0 //36
                      ..marginLeft = 132.0//230.9 242-163=73-1.7=71 215 150-72=80 139-7=132
                      ..marginTop = 0.0,//15
                    tap: () {
                    
                    }
                ),  
              ],
            ),
            Divider(color: Color(ColorRes.greyBtnChatColor),),
            Row( children: <Widget>[
              TextButton(
                  params: Params()
                    ..text = "Phone number book"
                    ..bgColor = ColorRes.colorWhite
                    ..textHeight = 24.0
                    ..textWidth = 180.0
                    ..letterSpacing = 1
                    ..fontFamily = "Roboto-Medium"
                    ..fontSize = 18.0
                    ..textColor = ColorRes.greyBtnTxtColor
                    ..marginLeft = 30.0 
                    ..marginTop = 15.0,
                  tap: () {

                  }
                ),  
                IconButtonC(
                    params: Params()
                      ..icon = Icon(Icons.keyboard_arrow_right)
                      ..iconColor = ColorRes.greyBtnChatColor
                      ..height = 50.0//33
                      ..width = 50.0 //16
                      ..size = 36.0 //36
                      ..marginLeft = 113.0//230.9 242-163=73-1.7=71 215 150-72=80 120d-7=113
                      ..marginTop = 0.0,//15
                    tap: () {
                    
                    }
                ),
            ],),
            Divider(color: Color(ColorRes.greyBtnChatColor),),
            Row(
              children: <Widget>[
                  TextButton(
                      params: Params()
                        ..text = "Addresse book"
                        ..bgColor = ColorRes.colorWhite
                        ..textHeight = 24.0
                        ..textWidth = 123.0
                        ..letterSpacing = 1
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 18.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..marginLeft = 30.0 
                        ..marginTop = 15.0,
                      tap: () {

                      }
                    ),  
                    IconButtonC(
                        params: Params()
                          ..icon = Icon(Icons.keyboard_arrow_right)
                          ..iconColor = ColorRes.greyBtnChatColor
                          ..height = 50.0//33
                          ..width = 50.0 //16
                          ..size = 36.0 //36
                          ..marginLeft = 170.0//177d-7; 242-163=73-1.7=71 215 150-72=80 207-3.6=200-26=174 mr14 177-25=152
                          ..marginTop = 0.0,//15
                        tap: () {
                        
                        }
                    ),
            ],),
            Divider(color: Color(ColorRes.greyBtnChatColor),),
            Row(
              children: <Widget>[
                  TextButton(
                      params: Params()
                        ..text = "Social Accounts"
                        ..bgColor = ColorRes.colorWhite
                        ..textHeight = 24.0
                        ..textWidth = 136.0
                        ..letterSpacing = 1
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 18.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..marginLeft = 30
                        ..marginTop = 15.0,
                      tap: () {

                      }
                    ),  
                    IconButtonC(
                        params: Params()
                          ..icon = Icon(Icons.keyboard_arrow_right)
                          ..iconColor = ColorRes.greyBtnChatColor
                          ..height = 50.0//33
                          ..width = 50.0 //16
                          ..size = 36.0 //36
                          ..marginLeft = 157.0 //164d-7=157; 177d-174a=3 164d-25=139+25 161
                          ..marginTop = 0.0,//15
                        tap: () {
                        
                        }
                    ),
            ],),
            Divider(color: Color(ColorRes.greyBtnChatColor),),
            Row(
              children: <Widget>[
                  TextButton(
                      params: Params()
                        ..text = "Payment Methods"
                        ..bgColor = ColorRes.colorWhite
                        ..textHeight = 24.0
                        ..textWidth = 158.0
                        ..letterSpacing = 1
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 18.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..marginLeft = 30.0 
                        ..marginTop = 15.0,
                      tap: () {

                      }
                    ),  
                    IconButtonC(
                        params: Params()
                          ..icon = Icon(Icons.keyboard_arrow_right)
                          ..iconColor = ColorRes.greyBtnChatColor
                          ..height = 50.0//33
                          ..width = 50.0 //16
                          ..size = 36.0 //36
                          ..marginLeft = 135//142d-25=117+25eb=142-3.6=-4=138 142-7=135;
                          ..marginTop = 0.0,//15
                        tap: () {
                        
                        }
                    ),
            ],),
            Divider(color: Color(ColorRes.greyBtnChatColor),),
            Row(
              children: <Widget>[
                  TextButton(
                      params: Params()
                        ..text = "Sign Out"
                        ..bgColor = ColorRes.colorWhite
                        ..textHeight = 24.0
                        ..textWidth = 78.0
                        ..letterSpacing = 1
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 18.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..marginLeft = 30.0 
                        ..marginTop = 15.0,
                      tap: () {

                      }
                    ),  
                    // IconButtonC(
                    //     params: Params()
                    //       ..icon = Icon(Icons.keyboard_arrow_right)
                    //       ..iconColor = ColorRes.greyBtnChatColor
                    //       ..height = 50.0//33
                    //       ..width = 50.0 //16
                    //       ..size = 36.0 //36
                    //       ..marginLeft = 174.0
                    //       ..marginTop = 0.0,//15
                    //     tap: () {
                        
                    //     }
                    // ),
            ],),
            Divider(color: Color(ColorRes.greyBtnChatColor),),
            
            
            // FutureBuilder(
            //     future: _refreshProducts(context),
            //     builder: (ctx, snapshot) =>
            //         snapshot.connectionState == ConnectionState.waiting
            //             ? Center(
            //                 child: CircularProgressIndicator(),
            //               )
            //             : 
                        // FlatButton(
                        //   onPressed: () {
                        //     _refreshProducts(context);
                        //     Navigator.pop(context, false);
                        //   },
                        //   child: Text(
                        //     "Flat Button",
                        //   ),
                        // )
                        // IconButton(
                        //   icon: Icon(Icons.beach_access),
                        //   onPressed:  _refreshProducts(context),
                        // )
                        // RefreshIndicator(
                        //     onRefresh: () => _refreshProducts(context),
                        //     child:
            RegButton(
                params: Params()
                  ..text = 'Go Back'
                  ..textHeight = 26.0
                  ..fontFamily = 'Roboto-Medium'
                  ..fontSize = 20.0
                  ..letterSpacing = 2.14
                  ..textColor = ColorRes.colorWhite
                  ..height = 47.0
                  ..width = 242.0
                  ..backgroundColor = ColorRes.greyBtnChatColor
                  // ..textAlig = Alignment.center
                  ..marginLeft = 63.0//63
                  ..marginTop = 20,
                tap: () {
                    // print("555555555555 updateTime ll be called in edit pg save btn");
                    // updateT.updateTime('_time');
                    //  _refreshProducsts(context);
                    print("555555555555 2 actions in edit pg save btn");
                    // FutureBuilder(
                    //   future: _refreshProducts(context),
                    //   builder: (ctx, snapshot) =>
                    //       snapshot.connectionState == ConnectionState.waiting
                    //           ? Center(
                    //               child: CircularProgressIndicator(),
                    //             )
                    // //           : 
                    //           Future.delayed(Duration.zero).then((_) async{
                              
                    //           await _refreshProducts(context);
                    //           Navigator.pop(context, false);
                    //           });

                              // _refreshProducts(context) ?? Navigator.pop(context, false) 
                              // _refreshProducts(context).then(Navigator.pop(context, false) ); 
                              // Spacer(),
                              // RefreshIndicator(
                              //     onRefresh: () => _refreshProducts(context),
                              //     child:BodyLayout(),),);
                     
                    // Navigator.pop(context, false)
                    // ;
                    // );//FutureBuilder
                    // Navigator.pop(context, false);
                }
            ),
            // ),//RefreshIndicator
            // ),//FutureBuilder
            ],),
            ]);
}