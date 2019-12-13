import 'package:flutter/material.dart';
import '../utils/sp_util.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../res/colors.dart';

import '../utils/parameter.dart';
import '../widgets/appearance/button.dart';
import '../widgets/appearance/text.dart';
import '../widgets/appearance/input.dart';
import '../widgets/appearance/title.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/swiptable2.dart';
import '../widgets/appearance/bot_nav.dart';

// import '../providers/cart.dart';
import '../providers/product.dart';
import '../providers/products.dart';

import '../res/colors.dart';

// BottomNavigationBar 默认的实例
class OrderListPage extends StatefulWidget {
  static const routeName = '/order_list_page';
  
  const OrderListPage() : super();
  @override
  State<StatefulWidget> createState() => _OrderListPage();
}

// BottomNavigationBar 默认的实例,有状态
class _OrderListPage extends State {
  var _showOnlyFavorites = false;
  var _filterAll = true;
  var _filterReq =false;
  var _filterUpc =false;
  var _filterFin =false;

  // int _currentIndex = 0;
  // void _onItemTapped(int index) {
  //   if (mounted) {
  //     setState(() {
  //       _currentIndex = index;
  //     });
  //   }
  // }
//i think better logic/function can be written here so future work needed
  void _filterActive(String active) {
    // if () {
    //   setState(() {
    //     _filterAll = false;
    //   });
    // } else {
    //   setState(() {
    //     _authMode = AuthMode.Login;
    //   });
    // }
    var command = active;
    switch (command) {
      case 'All':
        setState(() {
          _filterAll = true;
          print("All actived");
          if (_filterReq) _filterReq = false;
          if (_filterUpc) _filterUpc = false;
          if (_filterFin) _filterFin = false;
        });
        break;
      case 'Request':
        setState(() {
          _filterReq = true;
          print("Req actived");
          if (_filterAll) _filterAll = false;
          if (_filterUpc) _filterUpc = false;
          if (_filterFin) _filterFin = false;
        });
        break;
      case 'ToDo':
        setState(() {
          _filterUpc = true;
          print("Upc actived");
          if (_filterAll) _filterAll = false;
          if (_filterReq) _filterReq = false;
          if (_filterFin) _filterFin = false;
        });
        break;
      case 'Finished':
        setState(() {
          _filterFin = true;
          print("Fin actived");
          if (_filterAll) _filterAll = false;
          if (_filterReq) _filterReq = false;
          if (_filterUpc) _filterUpc = false;
        });
        break;
      // case 'FRIDAY':
      //   print('FRIDAY');
        // break;
      default:
        print('It\'s weekend');
    }
  }

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        // .fetchAndSetProducts(true);
        .fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // ChangeNotifierProvider.value(
    //         builder: (c) => products[i],
    //         // value: products,
    //         )
    // final product = Provider.of<Product>(context, listen: false);
    final load = Provider.of<Products>(context);
    // final products = load.items;
    List<Product> products = []; 
    if (_filterAll) products = load.items;
    if (_filterReq) products = load.filterByStatus("Order Pending");
    if (_filterUpc) products = load.filterByStatus("Order Confirmed");//we call ToDo as Upcoming bef
    if (_filterFin) products = load.filterByStatus("Finished");
    // if (_filterReq) products = load.filterById("Order Pending");
    // if (_filterFin) products = load.favoriteItems;
    // if (_filterAll) List<Product> products = load.items;
    // if (_filterReq) products = load.findById("p1");
    // if (_filterUpc) products = load.findById("p2");
    // if (_filterFin) List<Product> products = load.favoriteItems;
    // final cart = Provider.of<Cart>(context);
    
    return Scaffold(
        body: 
        // FutureBuilder(
        //         future: _refreshProducts(context),
        //         builder: (ctx, snapshot) =>
        //             snapshot.connectionState == ConnectionState.waiting
        //                 ? Center(
        //                     child: CircularProgressIndicator(),
        //                   )
        //                 : RefreshIndicator(
        //                     onRefresh: () => _refreshProducts(context),
        //                     child: 
                            SingleChildScrollView(
            child: Container(
              //tt weird extra or unfound marign may have something to do with this
                height: deviceSize.height,
                width: deviceSize.width,
                // color: Colors.yellow,
                child: Column(children: <Widget>[
//tt passing data like this without provider may create memory leak/overflow or manuelly remove/clean memory/data to avoid so. same goes on every page/place uses params
                  TitleBar(
                      params: Params()
                        ..text = "Order List"
                        ..textHeight = 29.0
                        ..textWidth = 121.0
                        ..marginLeft = 0.0
                        ..textColor = ColorRes.titleTextColor
                        ..letterSpacing = 2.36
                        ..fontFamily = "Roboto-Medium"
                        ..marginTop = 52.0 //32
                        ..height = 34.0),
                  InputBox(
                      params: Params()
                        ..hintText = "Search"
                        ..bgColor = ColorRes.searchBoxBg
                        ..icon = Icon(Icons.search)
                        ..marginTop = 30.0
                        ..marginLeft = 0.0
                        ..autoFocus = false 
                      ),
                  Container(
                    //tt..marginTop can be omitted in TextButton or TextButton orgin block in button file, if add marging here in container. so in auth_screen TextButton line 403ish u can add container to add the margin
                    margin: EdgeInsets.fromLTRB(SpUtil.getSize(30), SpUtil.getSize(18), 0.0, SpUtil.getSize(20)),
                    // color: Colors.green,//18
                    child: 
                    Row(
                        children: <Widget>[ 
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(SpUtil.getSize(10)),
                          //   child: Center( child: 
                            Container(
                              // color: Colors.yellow,
                              // alignment: Alignmen,
                              // decoration: BoxDecoration(
                              //     color: Colors.green,
                              //     borderRadius: BorderRadius.circular(40.0),
                              // ), 
                              child: 
//here needs to be RegButton i ll have to switch it when i have time also because of this miss usage i had to change 
//auth screen where used textbtn so i need to change it back
                                TextButton(
                                  params: Params()
                                      ..text = "ALL"
                                      ..bgColor = _filterAll ? ColorRes.chosenBtnBg : ColorRes.searchBoxBg
                                      // ..bgColor = ColorRes.chosenBtnBg 
                                      ..textHeight = 33.0
                                      ..textWidth = 70.0
                                      ..letterSpacing = 0.87
                                      ..fontFamily = "Roboto_Bold"
                                      ..fontSize = 10.0
                                      ..textColor = ColorRes.colorWhite
                                      ..marginLeft = 0.0//18
                                      ..marginTop = 0.0,//18
                                  tap: () {
                                      _filterActive("All");
                                  }
                              ),
                          //   ),),
                          ),
                          //without htis container adding margin with params ll have werid bug
                          Container(
                              // color: Colors.yellow,
                              // margin: EdgeInsets.fromLTRB(SpUtil.getSize(12), 0.0, 0.0, 0.0),
                              margin: EdgeInsets.only(left: SpUtil.getSize(12),),
                              child:
                                TextButton(
                                  params: Params()
                                      ..text = "REQEUST"
                                      ..bgColor = _filterReq ? ColorRes.chosenBtnBg : ColorRes.searchBoxBg
                                      ..textHeight = 33.0
                                      ..textWidth = 70.0
                                      ..letterSpacing = 0.87
                                      ..fontFamily = "Roboto_Bold"
                                      ..fontSize = 10.0
                                      ..textColor = ColorRes.greyBtnChatColor
                                      ..marginLeft = 0.0//12
                                      ..marginTop = 0.0,//18
                                  tap: () {
                                      _filterActive("Request");
                                  }
                                ),
                          ),
                          Container(
                              // color: Colors.yellow,
                              // margin: EdgeInsets.fromLTRB(SpUtil.getSize(12), 0.0, 0.0, 0.0),
                              margin: EdgeInsets.only(left: SpUtil.getSize(12),),
                              child:
                                TextButton(
                                  params: Params()
                                      ..text = "To Do"
                                      ..bgColor = _filterUpc ? ColorRes.chosenBtnBg : ColorRes.searchBoxBg
                                      ..textHeight = 33.0
                                      ..textWidth = 70.0
                                      ..letterSpacing = 0.1//0.87 designed one does not fit in the box for some reason (bug)
                                      ..fontFamily = "Roboto_Bold"
                                      ..fontSize = 16.0//10
                                      ..textColor = ColorRes.toDoTxt
                                      ..marginLeft = 0.0//12
                                      ..marginTop = 0.0,//18
                                  tap: () {
                                      _filterActive("ToDo");
                                  }
                                ), 
                          ),
                          Container(
                              // color: Colors.yellow,
                              // margin: EdgeInsets.fromLTRB(SpUtil.getSize(12), 0.0, 0.0, 0.0),
                              margin: EdgeInsets.only(left: SpUtil.getSize(12),),
                              child:
                                TextButton(
                                  params: Params()
                                      ..text = "FINISHED"
                                      ..bgColor = _filterFin ? ColorRes.chosenBtnBg : ColorRes.searchBoxBg
                                      ..textHeight = 33.0
                                      ..textWidth = 70.0
                                      ..letterSpacing = 0.87
                                      ..fontFamily = "Roboto_Bold"
                                      ..fontSize = 10.0
                                      ..textColor = ColorRes.finishedTxt
                                      ..marginLeft = 0.0//12
                                      ..marginTop = 0.0,//18
                                  tap: () {
                                      _filterActive("Finished");
                                  }
                                ),
                          ),      
                        ]  
                    ),
                  ),//container
                  // GreyButton(
                  //     params: Params()
                  //       ..text = 'Service Name xxx'
                  //       // ..height = 104.0 
                  //       // ..width = 317.0 

                  //       // ..marginBot = 0.0
                  //       ..marginTop = 33, //18
                  //     tap: () {}),
                  // RegButton(
                  //     params: Params()
                  //       ..text = 'Upcoming Order'
                  //       ..textHeight = 26.0
                  //       ..fontFamily = "Roboto-Medium"
                  //       ..letterSpacing = 2.14
                  //       ..textColor = ColorRes.colorWhite //xx
                  //       ..height = 94.0 //xx2
                  //       ..width = 242.0 //xx2
                  //       ..backgroundColor = ColorRes.buttonBgColor
                  //       // ..marginBot = 0.0
                  //       ..marginTop = 20, //20
                  //     tap: () {}),
                  // RegButton(
                  //     params: Params()
                  //       ..text = 'Order List'
                  //       ..textHeight = 26.0
                  //       ..fontFamily = "Roboto-Medium"
                  //       ..letterSpacing = 2.14
                  //       ..textColor = ColorRes.colorWhite //xx
                  //       ..height = 94.0 //xx2
                  //       ..width = 242.0 //xx2
                  //       ..backgroundColor = ColorRes.buttonBgColor
                  //       // ..marginBot = 0.0
                  //       ..marginTop = 20, //20
                  //     tap: () {}),
                  // Consumer<Product>( builder: (ctx, product, _) =>
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.shopping_cart,
                  //   ),
                  //   onPressed: () {
                  //     cart.addItem(product.id, product.price, product.title);
                  //   },
                  // // )
                  // ),
                  Container(
                    // height: deviceSize.height - 369.0,//56+36+20 104+265=369 357-56-36=265 
                    height: 405.0,//369cut off at 3rd s edge so cant see if there s 4th so add bit more +36=405
                    child:
                      ListView.builder(
                        // print();
                      padding: const EdgeInsets.all(8.0),
                      // itemExtent: 106.0,
                      itemCount: products.length,
                      itemBuilder: 
                    //   // (ctx, i) => CartItem2(
                    //   //       // product.items.values.toList()[i].id,
                    //   //       // product.items.keys.toList()[i],
                    //   //       // product.items.values.toList()[i].price,
                    //   //       // product.items.values.toList()[i].quantity,
                    //   //       // product.items.values.toList()[i].title,
                    //   //     ),
                      (ctx, i) => ChangeNotifierProvider.value(
                        // builder: (c) => products[i],
                        value: products[i],
                        child: Swiptable2(
                          "order",
                          products[i].buyerId,
                          products[i].orderId,
                            // products.values.toList()[i].id,
                      //       // product.items.keys.toList()[i],
                      //       // product.items.values.toList()[i].price,
                      //       // product.items.values.toList()[i].quantity,
                      //       // product.items.values.toList()[i].title,
                            ),
                      ),
                      // (ctx, i) => ChangeNotifierProvider.value(
                      //   // builder: (c) => products[i],
                      //   value: products[i],
                      //   child: ProductItem(
                      //       // products[i].id,
                      //       // products[i].title,
                      //       // products[i].imageUrl,
                      //       ),
                      // ),
                    ),//listView builder
                    // GridView.builder(
                    //   padding: const EdgeInsets.all(10.0),
                    //   itemCount: products.length,
                    //   itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    //         // builder: (c) => products[i],
                    //         value: products[i],
                    //         child: ProductItem(
                    //             // products[i].id,
                    //             // products[i].title,
                    //             // products[i].imageUrl,
                    //             ),
                    //       ),
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     childAspectRatio: 3 / 2,
                    //     crossAxisSpacing: 10,
                    //     mainAxisSpacing: 10,
                    //   ),
                    // ),//grid view 
                  ),  
                  
                  // bottomNavigationBar:
                  // Container(
                  //     alignment: Alignment.bottomCenter,
                  //     // height: SpUtil.getSize(57.0),
                  //     // padding: ,
                  //     margin: EdgeInsets.only(
                  //         top: SpUtil.getSize(
                  //             46.0)), //41 marginTop, 57 nav height
                  //     child: BottomNavigationBar(
                  //         type: BottomNavigationBarType
                  //             .fixed, // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
                  //         iconSize: 24.0, // BottomNavigationBarItem 中 icon 的大小
                  //         currentIndex: _currentIndex, // 当前所高亮的按钮index
                  //         onTap: _onItemTapped, // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
                  //         // backgroundColor: Color(ColorRes.buttonBgColor),
                  //         fixedColor: Colors
                  //             .orange, // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
                  //         items: <BottomNavigationBarItem>[
                  //             BottomNavigationBarItem(
                  //                 title: Text("Home"),
                  //                 icon: Icon(
                  //                   Icons.home,
                  //                   // {Color: Color(ColorRes.titleTextColor)}
                  //                 )),
                  //             BottomNavigationBarItem(
                  //               title: Text("Message"),
                  //               icon: Icon(FontAwesomeIcons.comments),
                  //             ),
                  //             BottomNavigationBarItem(
                  //               title: Text("Profile"),
                  //               icon: Icon(Icons.person),
                  //               backgroundColor: Color(ColorRes.buttonBgColor),
                  //             ),
                  //             BottomNavigationBarItem(
                  //                 title: Text("Setting"), icon: Icon(Icons.list)),
                  //             // BottomNavigationBarItem(
                  //             //     title:  Text("menu"), icon:  Icon(Icons.menu)),
                  //             // BottomNavigationBarItem(
                  //             //     title:  Text("other"), icon:  Icon(Icons.devices_other)),
                  //           ],
                  //     )   
                  // ) //navbar
                ]
              )
            )
        ),//singleChildScrolView
        bottomNavigationBar: BotNav(),
    // )),//refresh futureBulider
    );
  } //build
} //stt
