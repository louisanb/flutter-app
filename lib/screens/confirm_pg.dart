import 'package:flutter/material.dart';
import 'dart:math';
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


class ConfirmPage extends StatelessWidget {

static const routeName = '/confirm-page';

Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        // .fetchAndSetProducts(true);
        .fetchAndSetProducts();
}

 @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final respvRH = deviceSize.height/708;//responsive ratio from height
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
    // _myListView(context);
    ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[ 
                  IconButtonC(
                    params: Params()
                      ..icon = Icon(Icons.arrow_back)
                      ..iconColor = ColorRes.greyBtnChatColor
                      ..height = 50.0
                      // ..height = (50.0*respRH)//touchable area 29
                      // ..height = (50.0*$respRH)
                      // ..height = {50.0*respRH}
                      // ..height = $respRH
                      // ..height = \$respRH
                      ..width = 50.0 //17
                      ..size = 22.0 
                      ..marginLeft = 14.0//18o phon sett
                      ..marginTop = 25.0,//28o 
                    tap: () {
                      Navigator.pop(context, false);
                    }
                  ),     
                  // AutoText(
                  //     params: Params()
                  //       ..text = "Account Setting"
                  //       ..textHeight = 32.0
                  //       ..textWidth = 195.0
                  //       ..textColor = ColorRes.editTitle
                  //       ..letterSpacing = 1.37
                  //       ..fontFamily = "Roboto-Medium"
                  //       ..fontSize = 24.0
                  //       ..marginLeft = 29.0
                  //       ..marginTop = 47.0,
                  // ),
            ]),          
                  AutoText(
                      params: Params()
                        ..text = "Thank you for confirming this order! The order's status is changed to \"To Do\". You can find the order in the \"To Do\" page!"
                        ..textHeight = 150.0//104
                        ..textWidth = 304.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..letterSpacing = 2.57
                        ..fontFamily = "PingFangSC-Medium"
                        ..fontSize = 24.0
                        ..textAlig = Alignment.center//not in d
                        ..marginLeft = 0.0 //31d
                        ..marginTop = 92.0,//146 to top 92 to arrow
                  ),
                

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
                  ..text = '\"To Do\" Page'
                  ..textHeight = 26.0
                  ..fontFamily = 'Roboto-Medium'
                  ..fontSize = 20.0
                  ..letterSpacing = 2.14
                  ..textColor = ColorRes.colorWhite
                  ..height = 47.0
                  ..width = 242.0
                  ..backgroundColor = ColorRes.greyBtnChatColor
                  ..textAlig = Alignment.center//not in d
                  ..marginLeft = 0.0//62d
                  ..marginTop = 20,
                tap: () {

                    // print("555555555555 updateTime ll be called in edit pg save btn");
                    // updateT.updateTime('_time');
                    //  _refreshProducsts(context);
                  
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
            RegButton(
                params: Params()
                  ..text = 'Chat Customer'
                  ..textHeight = 26.0
                  ..fontFamily = 'Roboto-Medium'
                  ..fontSize = 20.0
                  ..letterSpacing = 2.14
                  ..textColor = ColorRes.colorWhite
                  ..height = 47.0
                  ..width = 242.0
                  ..backgroundColor = ColorRes.greyBtnChatColor
                  ..textAlig = Alignment.center //not in d
                  ..marginLeft = 0.0//62d
                  ..marginTop = 20,
                tap: () {}
            ),
            ],),
            ]);
  }
}

//tt this might be redudent so just put this in body layout straightly
// Widget _myListView(BuildContext context) {
//   // Future<void> _refreshProducts(BuildContext context) async {
//   //   await Provider.of<Products>(context, listen: false)
//   //       // .fetchAndSetProducts(true);
//   //       .fetchAndSetProducts();
//   // }
//   // print('666666666666666666666 ModalRoute.of(context).settings.arguments in edit pg:');
//   // print('${ModalRoute.of(context).settings.arguments}');
//   //this is needed but i thoguht not so, since prodId is passed in which is (conterted) string xx actually i was right
//   // final productId =
//   //       ModalRoute.of(context).settings.arguments as List; 
//   // final prodId = productId[0].toString();
//   // final productId = ModalRoute.of(context).settings.arguments as String; 
//   // print("99999999996666666 productId in edit pg: $productId");
//   // final loadedProduct = Provider.of<Products>(
//   //   context,
//   //   listen: false,
//   // ).confirmReq(orderId);
//   // final productsData = Provider.of<Products>(context);//this might be changed listen to false
//   // final orderID = productsData.idR;
//   // final emailV = loadedProduct['emailV']; 
//   // final orderID = loadedProduct.items[0].emailV;//u can also get this with _serv way 
//   // final loadedProduct = Provider.of<Products>(
//   //   context,
//   //   listen: false,
//   // ).findById(productId);
//   //String fm = loadedProduct.time.replaceAll('T',' '); 
//   return 
//   // Text("data");
//      ListView(children: <Widget>[
//         Column(
//           children: <Widget>[
//             Row(
//               children: <Widget>[ 
//                   IconButtonC(
//                     params: Params()
//                       ..icon = Icon(Icons.arrow_back)
//                       ..iconColor = ColorRes.greyBtnChatColor
//                       ..height = 50.0
//                       // ..height = (50.0*respRH)//touchable area 29
//                       // ..height = (50.0*$respRH)
//                       // ..height = {50.0*respRH}
//                       // ..height = $respRH
//                       // ..height = \$respRH
//                       ..width = 50.0 //17
//                       ..size = 22.0 
//                       ..marginLeft = 14.0//18o phon sett
//                       ..marginTop = 25.0,//28o 
//                     tap: () {
//                       Navigator.pop(context, false);
//                     }
//                   ),     
//                   // AutoText(
//                   //     params: Params()
//                   //       ..text = "Account Setting"
//                   //       ..textHeight = 32.0
//                   //       ..textWidth = 195.0
//                   //       ..textColor = ColorRes.editTitle
//                   //       ..letterSpacing = 1.37
//                   //       ..fontFamily = "Roboto-Medium"
//                   //       ..fontSize = 24.0
//                   //       ..marginLeft = 29.0
//                   //       ..marginTop = 47.0,
//                   // ),
//             ]),          
//                   AutoText(
//                       params: Params()
//                         ..text = "Thank you for confirming this order! The order's status is changed to \"To Do\". You can find the order in the \"To Do\" page!"
//                         ..textHeight = 150.0//104
//                         ..textWidth = 304.0
//                         ..textColor = ColorRes.greyBtnTxtColor
//                         ..letterSpacing = 2.57
//                         ..fontFamily = "PingFangSC-Medium"
//                         ..fontSize = 24.0
//                         ..textAlig = Alignment.center//not in d
//                         ..marginLeft = 0.0 //31d
//                         ..marginTop = 92.0,//146 to top 92 to arrow
//                   ),
                

//             // FutureBuilder(
//             //     future: _refreshProducts(context),
//             //     builder: (ctx, snapshot) =>
//             //         snapshot.connectionState == ConnectionState.waiting
//             //             ? Center(
//             //                 child: CircularProgressIndicator(),
//             //               )
//             //             : 
//                         // FlatButton(
//                         //   onPressed: () {
//                         //     _refreshProducts(context);
//                         //     Navigator.pop(context, false);
//                         //   },
//                         //   child: Text(
//                         //     "Flat Button",
//                         //   ),
//                         // )
//                         // IconButton(
//                         //   icon: Icon(Icons.beach_access),
//                         //   onPressed:  _refreshProducts(context),
//                         // )
//                         // RefreshIndicator(
//                         //     onRefresh: () => _refreshProducts(context),
//                         //     child:
//             RegButton(
//                 params: Params()
//                   ..text = '\"To Do\" Page'
//                   ..textHeight = 26.0
//                   ..fontFamily = 'Roboto-Medium'
//                   ..fontSize = 20.0
//                   ..letterSpacing = 2.14
//                   ..textColor = ColorRes.colorWhite
//                   ..height = 47.0
//                   ..width = 242.0
//                   ..backgroundColor = ColorRes.greyBtnChatColor
//                   ..textAlig = Alignment.center//not in d
//                   ..marginLeft = 0.0//62d
//                   ..marginTop = 20,
//                 tap: () {

//                     // print("555555555555 updateTime ll be called in edit pg save btn");
//                     // updateT.updateTime('_time');
//                     //  _refreshProducsts(context);
                  
//                     // FutureBuilder(
//                     //   future: _refreshProducts(context),
//                     //   builder: (ctx, snapshot) =>
//                     //       snapshot.connectionState == ConnectionState.waiting
//                     //           ? Center(
//                     //               child: CircularProgressIndicator(),
//                     //             )
//                     // //           : 
//                     //           Future.delayed(Duration.zero).then((_) async{
                              
//                     //           await _refreshProducts(context);
//                     //           Navigator.pop(context, false);
//                     //           });

//                               // _refreshProducts(context) ?? Navigator.pop(context, false) 
//                               // _refreshProducts(context).then(Navigator.pop(context, false) ); 
//                               // Spacer(),
//                               // RefreshIndicator(
//                               //     onRefresh: () => _refreshProducts(context),
//                               //     child:BodyLayout(),),);
                     
//                     // Navigator.pop(context, false)
//                     // ;
//                     // );//FutureBuilder
//                     // Navigator.pop(context, false);
//                 }
//             ),
//             // ),//RefreshIndicator
//             // ),//FutureBuilder
//             RegButton(
//                 params: Params()
//                   ..text = 'Chat Customer'
//                   ..textHeight = 26.0
//                   ..fontFamily = 'Roboto-Medium'
//                   ..fontSize = 20.0
//                   ..letterSpacing = 2.14
//                   ..textColor = ColorRes.colorWhite
//                   ..height = 47.0
//                   ..width = 242.0
//                   ..backgroundColor = ColorRes.greyBtnChatColor
//                   ..textAlig = Alignment.center //not in d
//                   ..marginLeft = 0.0//62d
//                   ..marginTop = 20,
//                 tap: () {}
//             ),
//             ],),
//             ]);
// }