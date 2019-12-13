
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/parameter.dart';
import '../utils/sp_util.dart';
import '../res/colors.dart';

import '../providers/products.dart';
import '../providers/product.dart';
import '../providers/cart.dart' show Cart;
// import '../providers/cart.dart';

import '../widgets/appearance/button.dart';
import '../widgets/appearance/text.dart';
import '../widgets/appearance/input.dart';
import '../widgets/appearance/title.dart';
import '../widgets/swiptable2.dart';
import '../widgets/appearance/bot_nav.dart';

class RequestPage extends StatefulWidget {
  static const routeName = '/request-page';

  // const RequestPage() : super();
  @override
  // State<StatefulWidget> createState() => _RequestPage();
  _RequestPage createState() => _RequestPage();
}


class _RequestPage extends State<RequestPage> {
  // int _currentIndex = 0;
  // void _onItemTapped(int index) {
  //   if (mounted) {
  //     setState(() {
  //       _currentIndex = index;
  //     });
  //   }
  // }

  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    // Future<void> _refreshProducts(BuildContext context) async {
    //   await Provider.of<Products>(context, listen: false)
    //       // .fetchAndSetProducts(true);
    //       .fetchAndSetProducts();
    // }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      //  Future<void> _refreshProducts(BuildContext context) async {
      //   await Provider.of<Products>(context, listen: false)
      //       // .fetchAndSetProducts(true);
      //       .fetchAndSetProducts();
      // }
      // final loadProds = Provider.of<Products>(context);
      // final load = Provider.of<Products>(context).fetchAndSetProducts().then((_) {
      // final products = load.items;
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
      // Provider.of<Products>(context, listen: false).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });//fetch
    }//if is init
    _isInit = false;
    super.didChangeDependencies();
  }//did cahnge dep
  // Future<void> _refreshProducts(BuildContext context) async {
  //   await Provider.of<Products>(context, listen: false)
  //       // .fetchAndSetProducts(true);
  //       .fetchAndSetProducts();
  // }

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
    final products = load.filterByStatus("Order Pending");
    // final cart = Provider.of<Cart>(context);
    // print("********products in request_pg: $products");
    
    return Scaffold(
        body: 
        //in the future need to exclude request txt out cuz there should be an back arrow in front of it too 
        // //so if it stuck at loading then there a way to get out of the loop now i left out the bot nav bar so it s ok
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
                      SingleChildScrollView(
            child: Container(
                height: deviceSize.height,
                width: deviceSize.width,
                child: Column(children: <Widget>[
                  TitleBar(
                      params: Params()
                        ..text = "Request"
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
                  _isLoading ? 
                  Center(
                        child: CircularProgressIndicator(),
                  )
                  :
                  // Expanded(
                    // child: 
                    Container(
                    //   margin: EdgeInsets.all(23),
                      // color: Color(ColorRes.greyBtnColor),
                      // height: deviceSize.height - 360.0,//104*3=312 18*2=36+312=348-12=336 30-18=12 d gap err 30 instead of 18
                      height: 464,//348+12=360 not working so add one row width +104=464
                      child:
                      // Consumer<Products>(builder: (ctx,products, _) =>
                        ListView.builder(
                          // print();
                        // padding: const EdgeInsets.all(23.0),//8 18
                        // container
                        // color
                        // margin: EdgeInsets.all(15),
                        // itemExtent: 106.0,
                        // itemCount: products.items.length,
                        // itemCount: products.filterByStatus("Order Pending").length,
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
                          // value: products.items[i],
                          // value: products.filterByStatus("Order Pending")[i],
                          value: products[i],
                          child: Swiptable2(
                            "request", 
                            // product.values.toList()[i].price,
                            // product.items.values.toList()[i].price,
                            // product.items.toList()[i].price,
                            // product.items.toList()[i].price,
                            // products.values.toList()[i].price,
                            // products.items.values.toList()[i].price,
                            // products.items.toList()[i].price,
                            // products[i].price,
                            // products.toList()[i].price,
                            // products.items[i].buyerId,
                            // products.items[i].orderId,
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
                      // ),//consumer<prod
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
                    ),//container
                  // ), //expanded 
                  // bottomNavigationBar:
                  // Container(
                  //     alignment: Alignment.bottomCenter,
                  //     // height: SpUtil.getSize(57.0),
                  //     // padding: ,
                  //     margin: EdgeInsets.only(
                  //         top: SpUtil.getSize(
                  //             46.0)), //41 marginTop, 57 nav height
                  //     child: BottomNavigationBar(
                  //       type: BottomNavigationBarType
                  //           .fixed, // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
                  //       iconSize: 24.0, // BottomNavigationBarItem 中 icon 的大小
                  //       currentIndex: _currentIndex, // 当前所高亮的按钮index
                  //       onTap: _onItemTapped, // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
                  //       // backgroundColor: Color(ColorRes.buttonBgColor),
                  //       fixedColor: Colors
                  //           .orange, // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
                  //       items: <BottomNavigationBarItem>[
                  //         BottomNavigationBarItem(
                  //             title: Text("Home"),
                  //             icon: Icon(
                  //               Icons.home,
                  //               // {Color: Color(ColorRes.titleTextColor)}
                  //             )),
                  //         BottomNavigationBarItem(
                  //           title: Text("Message"),
                  //           icon: Icon(FontAwesomeIcons.comments),
                  //         ),
                  //         BottomNavigationBarItem(
                  //           title: Text("Profile"),
                  //           icon: Icon(Icons.person),
                  //           backgroundColor: Color(ColorRes.buttonBgColor),
                  //         ),
                  //         BottomNavigationBarItem(
                  //             title: Text("Setting"), icon: Icon(Icons.list)),
                  //         // BottomNavigationBarItem(
                  //         //     title:  Text("menu"), icon:  Icon(Icons.menu)),
                  //         // BottomNavigationBarItem(
                  //         //     title:  Text("other"), icon:  Icon(Icons.devices_other)),
                  //       ],
                  //     )   
                  // ) //navbar container
                ]
              )
            )//container
        ),//singleChildView
    // ),),//refresh futureBuilder
        bottomNavigationBar: BotNav(),
    );//scaffold
  } //build
} //stt
