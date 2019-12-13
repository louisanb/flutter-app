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
import '../widgets/load_pic.dart';


class ChatListPage extends StatelessWidget {

static const routeName = '/Chat-List-Page';

Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        // .fetchAndSetProducts(true);
        .fetchAndSetProducts();
}
// Future.delayed(Duration.zero).then((_) async{//cant be here
//   await _refreshProducts(context);
//   Navigator.pop(context, false);
// });
 @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero).then((_) async{
    //   await _refreshProducts(context);
    //   Navigator.pop(context, false);
    // });
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
  // final load = Provider.of<Products>(context, listen: false)//load.idR is not def if call prods with .fetch only 
  // Provider.of<Products>(context, listen: false)
  //       // .fetchAndSetProducts(true);
  //       .fetchAndSetProducts();
  // Future.delayed(Duration.zero).then((_) async{
  //   await _refreshProducts(context);
  //   Navigator.pop(context, false);
  // });
  // final load = Provider.of<Products>(
  //   context,
  //   // listen: false,
  // );  
  // final orderId = ModalRoute.of(context).settings.arguments as String;
  // final String orderId = load.idR;
  // final String orderId = load.idR.replaceAll(' ','');
  // orderId = orderId.replaceAll(' ','');
  // print('000000000000 load.idR in chat list pg: ${load.idR}');
  // final filterProd = load.findById("$orderId");//orderId   
  // final img = load.items[0].imageUrl;//this is an alternative way and u can also get this with _serv way 
  //print('000000000 img=load.items[0].imageUrl in chat list pg: $img');
  // load.idRetrieve(orderId);
    return 
    // Text("data"); 
    _myListView(context);
    // ListView(children: <Widget>[
    //     Column(
    //       children: <Widget>[
    //         // Row(
    //         //   children: <Widget>[ 
    //               // IconButtonC(
    //               //   params: Params()
    //               //     ..icon = Icon(Icons.arrow_back)
    //               //     ..iconColor = ColorRes.greyBtnChatColor
    //               //     ..height = 50.0//touchable area 29
    //               //     ..width = 50.0 //17
    //               //     ..size = 22.0 
    //               //     ..marginLeft = 18.0
    //               //     ..marginTop = 28.0,//45
    //               //   tap: () {
    //               //     // set
    //               //     Navigator.pop(context, false);
    //               //   }
    //               // ),     
    //               AutoText(
    //                   params: Params()
    //                     ..text = "Chat List"
    //                     ..textHeight = 26.0
    //                     ..textWidth = 95.0
    //                     ..textColor = ColorRes.editTitle
    //                     ..letterSpacing = 1.6
    //                     ..fontFamily = "Roboto-Regular"
    //                     ..fontSize = 20.0
    //                     ..marginLeft = 29.0
    //                     ..marginTop = 34.0,
    //               ),
    //         // ]),
    //         GestureDetector(child: 
    //         Row(
    //           children: <Widget>[           
    //               LoadPic(
    //                   params: Params()
    //                     ..height = 70.0
    //                     ..width = 70.0
    //                     ..marginLeft = 40.0
    //                     ..marginTop = 25.0
    //                     // ..img = filterProd.imageUrl
    //                     ..img = img
    //               ),
    //               Column(children: <Widget>[
    //                   AutoText(
    //                       params: Params()
    //                         ..text = "Customer"
    //                         ..textHeight = 21.0
    //                         ..textWidth = 79.0
    //                         ..textColor = ColorRes.chatBlack
    //                         ..letterSpacing = 1
    //                         ..fontFamily = "Roboto-Bold"
    //                         ..fontSize = 16.0
    //                         ..marginLeft = 23.0
    //                         ..marginTop = 77.0,//77 to title 52 to sub title 
    //                   ),    
    //                   AutoText(
    //                       params: Params()
    //                         ..text = "hello world,xxxxxxxxx..."
    //                         ..textHeight = 19.0
    //                         ..textWidth = 167.0
    //                         ..textColor = ColorRes.emailGrey
    //                         ..letterSpacing = 1
    //                         ..fontFamily = "Roboto-Regular"
    //                         ..fontSize = 14.0
    //                         ..marginLeft = 23.0
    //                         ..marginTop = 2.0,
    //                   ),    
    //                   AutoText(
    //                       params: Params()
    //                         ..text = "Appointment May 19, 2018"
    //                         ..textHeight = 19.0
    //                         ..textWidth = 171.0
    //                         ..textColor = ColorRes.emailGrey
    //                         ..letterSpacing = 1
    //                         ..fontFamily = "Roboto-Light"
    //                         ..fontSize = 14.0
    //                         ..marginLeft = 23.0
    //                         ..marginTop = 0.0,
    //                   ),    
    //               ]),
    //               Column(children: <Widget>[
    //                   AutoText(
    //                           params: Params()
    //                             ..text = "May 23,2018"
    //                             ..textHeight = 19.0
    //                             ..textWidth = 103.0
    //                             ..textColor = ColorRes.chatBlack
    //                             ..letterSpacing = 0.88
    //                             ..fontFamily = "Roboto-Regular"
    //                             ..fontSize = 14.0
    //                             ..marginLeft = 58.0
    //                             ..marginTop = 79.0,
    //                   ),
    //                   IconButtonC(
    //                       params: Params()
    //                         ..icon = Icon(Icons.keyboard_arrow_right)
    //                         ..iconColor = ColorRes.greyBtnChatColor
    //                         ..height = 50.0//33
    //                         ..width = 50.0 //16
    //                         ..size = 36.0 //36
    //                         ..marginLeft = 132.0//230.9 242-163=73-1.7=71 215 150-72=80 139-7=132
    //                         ..marginTop = 0.0,//15
    //                       tap: () {
                          
    //                       }
    //                   ),   
    //               ]), 
    //         ]),
    //         onTap: () {

    //         }
    //         ),//Gesture
    //         Divider(color: Color(ColorRes.greyBtnChatColor),),
          
        // ]),
    // ]);
  }
}

Widget _myListView(BuildContext context) {
  final load = Provider.of<Products>(
    context,
    // listen: false,
  );  
  final img = load.items[0].imageUrl;
  print('000000000 img=load.items[0].imageUrl in chat list pg: $img');
  return

ListView(children: <Widget>[
        Column(
          children: <Widget>[
            // Row(
            //   children: <Widget>[ 
                  // IconButtonC(
                  //   params: Params()
                  //     ..icon = Icon(Icons.arrow_back)
                  //     ..iconColor = ColorRes.greyBtnChatColor
                  //     ..height = 50.0//touchable area 29
                  //     ..width = 50.0 //17
                  //     ..size = 22.0 
                  //     ..marginLeft = 18.0
                  //     ..marginTop = 28.0,//45
                  //   tap: () {
                  //     // set
                  //     Navigator.pop(context, false);
                  //   }
                  // ),     
                  AutoText(
                      params: Params()
                        ..text = "Chat List"
                        ..textHeight = 26.0
                        ..textWidth = 95.0
                        ..textColor = ColorRes.editTitle
                        ..letterSpacing = 1.6
                        ..fontFamily = "Roboto-Regular"
                        ..fontSize = 20.0
                        ..marginLeft = 29.0
                        ..marginTop = 34.0,
                  ),
            // ]),
            GestureDetector(child: 
            Row(
              children: <Widget>[           
                  LoadPic(
                      params: Params()
                        ..height = 70.0
                        ..width = 70.0
                        ..marginLeft = 40.0
                        ..marginTop = 25.0
                        // ..img = filterProd.imageUrl
                        ..img = img
                  ),
                  Column(children: <Widget>[
                      AutoText(
                          params: Params()
                            ..text = "Customer"
                            ..textHeight = 21.0
                            ..textWidth = 79.0
                            ..textColor = ColorRes.chatBlack
                            ..letterSpacing = 1
                            ..fontFamily = "Roboto-Bold"
                            ..fontSize = 16.0
                            ..marginLeft = 23.0
                            ..marginTop = 77.0,//77 to title 52 to sub title 
                      ),    
                      AutoText(
                          params: Params()
                            ..text = "hello world,xxxxxxxxx..."
                            ..textHeight = 19.0
                            ..textWidth = 167.0
                            ..textColor = ColorRes.emailGrey
                            ..letterSpacing = 1
                            ..fontFamily = "Roboto-Regular"
                            ..fontSize = 14.0
                            ..marginLeft = 23.0
                            ..marginTop = 2.0,
                      ),    
                      AutoText(
                          params: Params()
                            ..text = "Appointment May 19, 2018"
                            ..textHeight = 19.0
                            ..textWidth = 171.0
                            ..textColor = ColorRes.emailGrey
                            ..letterSpacing = 1
                            ..fontFamily = "Roboto-Light"
                            ..fontSize = 14.0
                            ..marginLeft = 23.0
                            ..marginTop = 0.0,
                      ),    
                  ]),
                  Column(children: <Widget>[
                      AutoText(
                              params: Params()
                                ..text = "May 23,2018"
                                ..textHeight = 19.0
                                ..textWidth = 103.0
                                ..textColor = ColorRes.chatBlack
                                ..letterSpacing = 0.88
                                ..fontFamily = "Roboto-Regular"
                                ..fontSize = 14.0
                                ..marginLeft = 58.0
                                ..marginTop = 79.0,
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
                  ]), 
            ]),
            onTap: () {

            }
            ),//Gesture
            Divider(color: Color(ColorRes.greyBtnChatColor),),
          ])
]);
}