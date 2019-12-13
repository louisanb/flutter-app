import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../widgets/appearance/button.dart';
import '../widgets/appearance/text.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
// import '../widgets/.dart';


// class ProdEdit extends StatelessWidget {
 
//   @override
//   Widget build(BuildContext context) {
//     return 
void settingModalBottomSheet(context){
// void ProdEdit(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
            return Container( child:
      Column( children: <Widget>[
          Container(
            color: Color(ColorRes.greyBtnChatColor),
            // alignment: Alignment.center,
            height: 40,//50-9.8
            child:
          Row(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            TextButton(
              params: Params()
                ..text = 'Cancel'
                ..textHeight = 24.0 
                ..textWidth = 62.0
                ..fontFamily = 'Rotobto-Regular'
                ..fontSize = 18
                ..letterSpacing = 1.1
                ..textColor = ColorRes.colorWhite
                ..bgColor = ColorRes.greyBtnChatColor
                // ..height = 24.0
                // ..width = 62.0
                // ..backgroundColor = ColorRes.greyBtnChatColor
                // ..textAlig = Alignment.center
                ..marginLeft = 23.0 
                ..marginTop = 8.0, //13
              tap: () {
                Navigator.pop(context);
              }
          ),
          TextButton(
              params: Params()
                ..text = 'Done'
                ..textHeight = 24.0
                ..textWidth = 47
                ..fontFamily = 'Rotobto-Regular'
                ..fontSize = 18
                ..letterSpacing = 1.1
                ..textColor = ColorRes.colorWhite
                ..bgColor = ColorRes.greyBtnChatColor
                // ..height = 24.0
                // ..width = 47.0
                // ..backgroundColor = ColorRes.greyBtnChatColor
                // ..textAlig = Alignment.center
                ..marginLeft = 206.0 
                ..marginTop = 8.0,//13 40-24=16/2=8
              tap: () {

                Navigator.pop(context);
              }
          ),
          ],),
          ),
          Row(// greyBtnColor
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoText(
                  params: Params()
                      ..text = "Item"
                      ..textHeight = 26.0
                      ..textWidth = 41.0
                      ..textColor = ColorRes.greyBtnTxtColor
                      ..letterSpacing = 1.71
                      ..fontSize = 16.0
                      ..fontFamily = "Roboto-Medium"
                      ..marginTop = 18.0
                      ..marginLeft = 18.0
                ),
                AutoText(
                    params: Params()
                      ..text = "Amount"
                      ..textHeight = 26.0
                      ..textWidth = 69.0
                      ..textColor = ColorRes.greyBtnTxtColor
                      ..letterSpacing = 1.71
                      ..fontSize = 16.0
                      ..fontFamily = "Roboto-Medium"
                      ..marginTop = 18.0//84, 5
                      ..marginLeft = 138.0//21
                ),
                AutoText(
                    params: Params()
                      ..text = "Price"
                      ..textHeight = 26.0
                      ..textWidth = 53.0
                      ..textColor = ColorRes.greyBtnTxtColor
                      ..letterSpacing = 1.71
                      ..fontSize = 16.0
                      ..fontFamily = "Roboto-Medium"
                      ..marginTop = 18.0//84, 5
                      ..marginLeft = 24.0//21
                ),
            ]),
          Divider(),
          EditList(),
          // editList(),      
      ]),
      );
            });      
  }
// }

// class EditList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc){
//             return Container( 
//               child: Consumer<Products>(
//                 builder: (ctx, servList, child) => ListView.builder(
//                       // itemCount: servList.items['services'].toList().length,
//                       // itemCount: servList.items['services'].length,
//                       // itemCount: servList.items.services.length,
//                       itemCount: servList.serv.length
//                       itemBuilder: (ctx, i) => OrderItem(servList.orders[i]),
//                     ),
//               );
//             );
//         }
//     );
//   }
// }

class EditList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  // Widget editList(context){
  // Widget editList(){
    // showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext bc){
            return Container( 
              height: 300,
              child: 
              // Text("this is fine"),
              // ShrinkWrap(children: <Widget>[
              // Column(children: <Widget>[
              // ListView(children: <Widget>[
              //   // Wrap(children: <Widget>[
              //   Column(children: <Widget>[
              //   Row(children: <Widget>[
              //     Text("this is fine"),
              //     Text("this is fine"),
              //   ],)
              // ],)
              // ],)
              // Column(children: <Widget>[
              // ListView.builder(
              //     // itemCount: servList.items['services'].toList().length,
              //     // itemCount: servList.items['services'].length,
              //     // itemCount: servList.items.services.length,
              //     itemCount: 3,
              //     itemBuilder: (ctx, i) => EditItem(Text("data")),
              // ),
              // Column(children: <Widget>[
              Consumer<Products>(
                builder: (ctx, servList, child) => ListView.builder(
                      // itemCount: servList.items['services'].toList().length,
                      // itemCount: servList.items['services'].length,
                      // itemCount: servList.items.services.length,
                      itemCount: servList.serv.length,
                      // itemBuilder: (ctx, i) => EditItem(servList.serv[i]),
                      itemBuilder: (ctx, i) => EditItem(servList.serv[i]['price_title'], servList.serv[i]['unit_price']),
                      // itemBuilder: (ctx, i) => EditItem(servList.serv[i].price_title),
                    ),
              ),
              // ],)
            );
    //     }
    // );
  }
}

class EditItem extends StatelessWidget {
  final String srv, srvP;
  EditItem(this.srv, this.srvP);
  @override
  Widget build(BuildContext context) {
    // print("77777777777srvP: $srvP");
    // showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext bc){
            return 
            // Expanded( 
            //   child: 
              Row(children: <Widget>[
                  AutoText(
                      params: Params()
                        // ..text = '${srv.price_title}' 
                        ..text = '$srv' 
                        // ..text = '${srv[price_title]}' 
                        // ..text = 'this is fine'
                        ..textHeight = 26.0
                        ..textWidth = 180.0 
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..letterSpacing = 0.79
                        ..fontSize = 18.0 //13
                        ..fontFamily = 'Roboto-Medium'
                        ..marginTop = 10.0
                        ..marginLeft = 18.0,
                  ),
                  AutoText(
                      params: Params()
                        // ..text = '${srv.price_title}' 
                        ..text = '\$$srvP' 
                        // ..text = '${srv[price_title]}' 
                        // ..text = 'this is fine'
                        // ..text = '20.0'
                        ..textHeight = 26.0
                        ..textWidth = 62.0 //34+34/3*2=34+22=56+8=64 max(right space left)=30-22=8 ava
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..letterSpacing = 1.71
                        ..fontSize = 16.0 
                        ..fontFamily = 'Roboto-Regular'
                        ..marginTop = 16.0
                        ..marginLeft = 98.0,
                  ),
              ],);
            // );
    //     }
    // );
  }
}