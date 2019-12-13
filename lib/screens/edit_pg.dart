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



class EditPg extends StatelessWidget {
  static const routeName = '/editpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            // appBar: AppBar(title: Text('ListViews')),
            body: BodyLayout(),
            bottomNavigationBar: BotNav(),
          );
      }
    }

class BodyLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
  return 
  ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: [           
                IconButton(icon:Icon(Icons.arrow_back),
                  onPressed:() => Navigator.pop(context, false),
                ),
                AutoText(
                  params: Params()
                      ..text = "Edit"
                      ..textHeight = 26.0
                      ..textWidth = 42.0
                      ..textColor = ColorRes.editTitle
                      ..letterSpacing = 1.6
                      ..fontSize = 20.0
                      ..marginLeft = 124.0//21
                      ..marginTop = 30.0,//84, 29
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
                    ..marginTop = 45.0,//28 29
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
            AutoText(
              params: Params()
                  ..text = "Time"
                  ..textHeight = 26.0
                  ..textWidth = 48.0
                  ..textColor = ColorRes.greyBtnTxtColor
                  ..letterSpacing = 1.0
                  ..fontSize = 18.0
                  ..fontFamily = "Roboto-Medium"
                  ..marginTop = 41.0//84, 5
                  ..marginLeft = 18.0//21
            ),
            Row(
              children: <Widget>[
                  AutoText(
                    params: Params()
                        ..text = "Start"
                        ..textHeight = 26.0
                        ..textWidth = 57.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..letterSpacing = 1.0
                        ..fontSize = 16.0
                        ..fontFamily = "Roboto-Medium"
                        ..marginTop = 13.0//84, 5
                        ..marginLeft = 13.0//21
                  ),
                  AutoText(
                    params: Params()
                        ..text = "01:00pm"
                        ..textHeight = 26.0
                        ..textWidth = 57.0
                        ..textColor = ColorRes.greyBtnTxtColor
                        ..letterSpacing = 1.0
                        ..fontSize = 16.0
                        ..fontFamily = "Roboto-Medium"
                        ..marginTop = 13.0//
                        ..marginLeft = 13.0//158
                  ),
              ],
            ), 
            Row(
              children: <Widget>[
                AutoText(
                  params: Params()
                      ..text = 'Product' 
                      ..textHeight = 26.0
                      ..textWidth = 72.0 
                      ..textColor = ColorRes.greyBtnChatColor
                      ..letterSpacing = 1.0
                      ..fontSize = 18.0 //25
                      ..fontFamily = 'Roboto-Medium'
                      ..marginTop = 39.0
                      ..marginLeft = 18.0,
                ),
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
                    ..marginTop = 26.0 //8
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
                  ..marginLeft = 8.0 //18
                  ..marginTop = 21.0,
                tap: () {
                  // Navigator.of(context).pushNamed(EditPage.routeName);
                }
            ),    
            ],),
            ]);

  }
// }
