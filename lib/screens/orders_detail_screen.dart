import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' as prefix0;
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/products.dart';
import '../providers/product.dart';

import '../utils/sp_util.dart';
import '../widgets/appearance/text.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';
import '../widgets/appearance/bot_nav.dart';
import '../screens/edit_page.dart';
import '../screens/edit_pg.dart';
import '../widgets/load_pic.dart';
import '../screens/confirm_pg.dart';



class OrdersDetailScreen extends StatelessWidget {
  // final String buyerId, orderId;

  // OrdersDetailScreen(this.buyerId, this.orderId);
  // final argSet =
  //       ModalRoute.of(context).settings.arguments as List; 
  // final String prodId = argSet[0].toString();
  // // final orderId =
  // //       ModalRoute.of(context).settings.arguments as String;
  // final String orderId = argSet[1].toString();
  static const routeName = '/order-detail-screen';
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, 
    listen: false
    )
        // .fetchAndSetProducts(true);
        .fetchAndSetProducts();
    // await Provider.of<Products>(
    //   context,
    //   listen: false,
    // ).findById(buyerId);
  }
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //  final argSet =
  //       ModalRoute.of(context).settings.arguments as String; // is the id!
  //   final loadedProduct = Provider.of<Products>(
  //     context,
  //     listen: false,
  //   ).findById(argSet);

//   @override
//   _OrdersDetailScreenState createState() => _OrdersDetailScreenState();
// }

// class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// int _currentIndex = 0;

//   void _onItemTapped(int index) {
//     if (mounted) {
//       setState(() {
//         _currentIndex = index;
//       });
//     }
//   }

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
    // final argSet =
    //     ModalRoute.of(context).settings.arguments as String; // is the id!
    // final loadedProduct = Provider.of<Products>(
    //   context,
    //   listen: false,
    // ).findById(argSet);
    return Scaffold(
            // appBar: AppBar(title: Text('ListViews')),
            body: 
            // FutureBuilder(
            //     future: _refreshProducts(context),
            //     builder: (ctx, snapshot) =>
            //         snapshot.connectionState == ConnectionState.waiting
            //             ? Center(
            //                 child: CircularProgressIndicator(),
            //               )
            //             : RefreshIndicator(
            //                 onRefresh: () => _refreshProducts(context),
            //                 child:
                            BodyLayout(),
                            // ),),
            bottomNavigationBar: BotNav(),
          );
      }
    }//sttless

class BodyLayout extends StatelessWidget {
  // final argSet =
  //       ModalRoute.of(context).settings.arguments as String; // is the id!
  //   final loadedProduct = Provider.of<Products>(
  //     context,
  //     listen: false,
  //   ).findById(argSet);
  @override
  //  final argSet =
  //       ModalRoute.of(context).settings.arguments as String; // is the id!
  //   final loadedProduct = Provider.of<Products>(
  //     context,
  //     listen: false,
  //   ).findById(argSet);
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  print('666666666666666666666ModalRoute.of(context).settings.arguments in orders detail scrn:');
  print('${ModalRoute.of(context).settings.arguments}');
  //here is another way to process arg https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments 
  //tt also need to test out which way s better passing it like this our we can use provider especailly we already called products with provider
  // final argSet =
  //       ModalRoute.of(context).settings.arguments as List; 
  // //in convention of this code buyer id should be first to be consistent but there s a bug here that orderId has to be 
  // // the first or only the first ele ll work otherwise err: bad state no ele. 
  // final String orderId = argSet[0].toString();
  // // final orderId =
  // //       ModalRoute.of(context).settings.arguments as String;
  // final String buyerId = argSet[1].toString();
  // print('666666666666666666666 argSet in orders detail scrn: $argSet');
  // print('333333333333333prodId and orderId in orders detail scrn: $buyerId, $orderId');
  final orderId =
        ModalRoute.of(context).settings.arguments as String;
  final load = Provider.of<Products>(
    context,
    listen: false,
  );  
  final loadedProduct = load.findById("$orderId");    
  // final loadedProduct = Provider.of<Products>(
  //   context,
  //   listen: false,
  // ).findById("$orderId");
  // ).findById("orderId");
  // ).findById("buyerId");
  // ).findById("$buyerId");
  // ).findById("5ea77e35");
  // ).findById("laundry");
  // final loadedProduct = Provider.of<Products>(
  //   context,
  //   listen: false,
  // // ).findById("5ea77e35");
  // ).findById2("laundry")[0];
  // print('333333333333333 loadedProduct in orders detail scrn: $loadedProduct');
  // print('333333333333333 loadedProduct.orderId in orders detail scrn: ${loadedProduct.orderId}');
  // print('333333333333333 loadedProduct.buyerId in orders detail scrn: ${loadedProduct.buyerId}');
  // final loadedProduct = Provider.of<Product>(
  //   context,
  //   // listen: false,
  // );
  //this data might be passed/set from the swiptable2 which is one lvl above. actually it may not be a good idea
  print('5555555555555555 idRetri ll be called');
  // Provider.of<Products>(
  //   context,
  //   listen: false,
  // ).idRetrieve(orderId);
  load.idRetrieve(orderId);
  // load.idRetrieve('$orderId');
  // load.idR;
  print('000000000000 load.idR in order detail pg: ${load.idR}');


  return ListView(children: <Widget>[
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
//there must be better way to write this big block of code.                 
                // IconButton(icon:Icon(Icons.arrow_back),
                //   onPressed:() => Navigator.pop(context, false),
                // ),
                IconButtonC(
                    params: Params()
                      ..icon = Icon(Icons.arrow_back)
                      ..iconColor = ColorRes.greyBtnChatColor
                      ..height = 50.0//29
                      ..width = 50.0 //17
                      ..size = 22.0 
                      ..marginLeft = 18.0
                      ..marginTop = 28.0,
                    tap: () {
                      Navigator.pop(context, false);
                    }
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
                        ..marginLeft = 253.0 //307 270 270-6.4=263-10(mr)
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
                // LoadPic(widget.loadedProduct.imageUrl),
                //u may not need to pass img in
                LoadPic(
                    params: Params()
                      ..height = 70.0
                      ..width = 70.0
                      ..marginLeft = 40.0
                      ..marginTop = 25.0
                      ..img = loadedProduct.imageUrl
                ),
                // Container(
                //   height: SpUtil.getSize(70.0),
                //   width: SpUtil.getSize(70.0),
                //   margin: EdgeInsets.only(top: SpUtil.getSize(25.0), left: SpUtil.getSize(40.0)),
                //   // color: Colors.red,
                //   child:
                //   CircleAvatar(
                //     backgroundImage: NetworkImage(loadedProduct.imageUrl),
                //     minRadius: 90,
                //     maxRadius: 150,
                //   ),
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
                // ),//container
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
                  // ..text = '${loadedProduct.title}' 
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
                  // ..text = '${loadedProduct.address}' 
                  ..text = '${loadedProduct.orderId}' 
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
                // ..textAlig = Alignment.center
                ..marginLeft = 8.0 //18
                ..marginTop = 15.0, //40
              tap: () {
                  // Provider.of<Products>(
                  //   context,
                  //   listen: false,
                  // ).confirmReq(orderId);
                  load.confirmReq(orderId);
                  Navigator.of(context).pushNamed(ConfirmPage.routeName);
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
                // Navigator.of(context).pushNamed(EditPage.routeName);
                Navigator.of(context).pushNamed(EditPage.routeName, arguments: orderId);
                // Navigator.of(context).pushNamed(EditPg.routeName, arguments: argSet);
              }
          ),    
          ],),
          ]);

  }
// }
