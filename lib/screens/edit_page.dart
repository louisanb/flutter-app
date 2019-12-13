import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/prod_edit.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/product.dart';

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


class EditPage extends StatefulWidget {

static const routeName = '/edit-page';

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var _isLoading = false;
  Future<void> _refreshProducts(BuildContext context) async {
      await Provider.of<Products>(context, listen: false)
          // .fetchAndSetProducts(true);
          .fetchAndSetProducts();
  }

 @override
  Widget build(BuildContext context) {
    // var _isLoading = false;
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
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        // .fetchAndSetProducts(true);
        .fetchAndSetProducts();
  }
  print('666666666666666666666 ModalRoute.of(context).settings.arguments in edit pg:');
  print('${ModalRoute.of(context).settings.arguments}');
  //this is needed but i thoguht not so, since prodId is passed in which is (conterted) string xx actually i was right
  // final buyerId =
  //       ModalRoute.of(context).settings.arguments as List; 
  // final prodId = buyerId[0].toString();
  final orderId = ModalRoute.of(context).settings.arguments as String; 
  print("99999999996666666 orderId in edit pg: $orderId");
  final loadedProduct = Provider.of<Products>(
    context,
    listen: false,
  ).findById(orderId);
  // final loadedProduct = Provider.of<Product>(
  //   context,
  //   // listen: false,
  // );
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
    
    //if u dont date time together we dont need this cuz time processing is moved to prods but here we change date 
    //and time separately 
    String fm = loadedProduct.time;
    // fm = fm.replaceAll('.',' ');
    List<String> fTime = fm.split(' ');
    String fmt = fTime[1];
    // print('9999999 fTime in edit pg: $fTime');
    // print("9999999 fmt in edit pg: $fmt");
    String fmd = fTime[0];
// }
  return 
  // Text("data");
     ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: [           
                // IconButton(icon:Icon(Icons.arrow_back),
                //   onPressed:() => Navigator.pop(context, false),
                // ),
                AutoText(
                  params: Params()
                      ..text = "Edit"
                      ..textHeight = 26.0
                      ..textWidth = 42.0
                      ..textColor = ColorRes.editTitle
                      ..letterSpacing = 1.6
                      ..fontFamily = "Roboto-Regular"
                      ..fontSize = 20.0
                      ..marginLeft = 159.0//124 with arrow
                      ..marginTop = 29.0,//84, 29
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
                    ..marginLeft = 104.0 //307 270
                    ..marginTop = 29.0,//28 29
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
            //weird bug this got centered somehow
            Container(
              alignment: Alignment.bottomLeft,
              // margin: EdgeInsets.only(left: 0),
              child:
            AutoText(
              params: Params()
                  ..text = "ANY CHANGES WILL BE REFLECTED INSTANTLY!"
                  ..textHeight = 26.0
                  ..textWidth = 350.0 //48
                  ..textColor = ColorRes.buttonBgColor //ColorRes.greyBtnTxtColor ColorRes.orange
                  ..letterSpacing = 1.0
                  ..fontSize = 18.0
                  ..fontFamily = "Roboto-Medium"
                  // ..alignment = Alignment.bottomLeft
                  ..marginLeft = 15.0//21 18
                  ..marginTop = 41.0//84, 5
            ),
            ),
           //if leave row out here mess up margin top
            // Row(
            //   children: <Widget>[
            //       AutoText(
            //         params: Params()
            //             ..text = "Start"
            //             ..textHeight = 26.0
            //             ..textWidth = 57.0
            //             ..textColor = ColorRes.greyBtnTxtColor
            //             ..letterSpacing = 1.0
            //             ..fontSize = 16.0
            //             ..fontFamily = "Roboto-Medium"
            //             ..marginTop = 13.0//84, 5
            //             ..marginLeft = 13.0//21
            //       ),
                  // AutoText(
                  //   params: Params()
                  //       ..text = "$fTime"
                  //       ..textHeight = 26.0
                  //       ..textWidth = 60.0//57
                  //       ..textColor = ColorRes.greyBtnTxtColor
                  //       ..letterSpacing = 1.0
                  //       ..fontSize = 16.0
                  //       ..fontFamily = "Roboto-Medium"
                  //       ..marginTop = 13.0//
                  //       ..marginLeft = 158.0//158
                  // ),
                  TimePicker(fmd, fmt),//no need passing data cuz we can access that in products
            //   ],
            // ), 
            Row(
              children: <Widget>[
                AutoText(
                  params: Params()
                      ..text = 'Ordered Services' 
                      ..textHeight = 26.0
                      ..textWidth = 150.0 //72
                      ..textColor = ColorRes.greyBtnChatColor
                      ..letterSpacing = 1.0
                      ..fontSize = 18.0 //25
                      ..fontFamily = 'Roboto-Medium'
                      ..marginTop = 39.0
                      ..marginLeft = 18.0,
                ),
                IconButtonC(
                    params: Params()
                      ..icon = Icon(Icons.add_box)
                      ..iconColor = ColorRes.greyBtnChatColor
                      ..height = 50.0
                      ..width = 50.0 
                      ..size = 36.0 //36
                      // ..backgroundColor = ColorRes.buttonBgColor
                      // ..textAlig = Alignment.center
                      ..marginLeft = 140.0//230.9 242-163=73-1.7=71 215 150-72=80
                      ..marginTop = 39.0,
                    tap: () {
                      print("777777777777add btn pressed from edit page");
                      // ProdEdit();
                      settingModalBottomSheet(context);
                    }
                ),
                // IconButton(
                //   icon: Icon(Icons.add_box),
                //   color: Color(ColorRes.greyBtnChatColor),
                //   // onPressed: 
                // ),  
              ],
            ),
            
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
                    ..marginTop = 16.0 //26
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
                    ..marginTop = 8.0 //16 
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
                    ..fontFamily = 'Roboto-Regular'
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
                    ..fontFamily = 'Roboto-Regular'
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
                    ..fontFamily = 'Roboto-Regular'
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
                    ..fontFamily = 'Roboto-Regular'
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
                    ..fontFamily = 'Roboto-Bold'
                    ..marginTop = 17.0 //15
                    ..marginLeft = 11.0,
              ), 
            ]),
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
                    //           : 
                              // widget._isLoading = true; 
                              Future.delayed(Duration.zero).then((_) async{
                
                                await _refreshProducts(context);
                                Navigator.pop(context, false);
                              });

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