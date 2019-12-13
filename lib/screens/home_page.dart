import 'package:flutter_complete_guide/screens/request_page.dart';

import '../utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../res/colors.dart';

import '../utils/parameter.dart';
import '../widgets/appearance/button.dart';
import '../widgets/appearance/text.dart';
import '../widgets/appearance/input.dart';
import '../widgets/appearance/title.dart';

import 'package:provider/provider.dart';
import '../providers/products.dart';

import '../res/colors.dart';
//should not need this
import '../screens/request_page.dart';
import '../screens/order_list_page.dart';
import '../widgets/appearance/bot_nav.dart';

// BottomNavigationBar 默认的实例
class HomePage extends StatefulWidget {
  //need this for pushed name route
  static const routeName = '/home-page';
  const HomePage() : super();
  @override
  State<StatefulWidget> createState() => _HomePage();
}

// BottomNavigationBar 默认的实例,有状态
class _HomePage extends State {


  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });//fetch
      // Provider.of<Products>(context).fetchAndSetProductsFinished().then((_) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      // });
    }//isInit
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final deviceSize = MediaQuery.of(context).size;
    print('44444444444444444444444device size in home pg: $deviceSize');//360 708
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: deviceSize.height,
                width: deviceSize.width,
                child: Column(children: <Widget>[
                  TitleBar(
                      params: Params()
                        ..text = "Hellow xxx"
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
                        ..autoFocus = false //xx
                      ),
                  RegButton(
                      params: Params()
                        ..text = 'Check Request'
                        ..textHeight = 26.0
                        ..fontFamily = "Roboto-Medium"
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite //xx
                        ..height = 94.0 //xx2
                        ..width = 242.0 //xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        // ..textAlig = Alignment.center
                        ..marginLeft = 0.0
                        ..marginTop = 33, //20
                      tap: () {
                        print("***********check request called");
                        Navigator.of(context).pushNamed(RequestPage.routeName);
                      //   Navigator.of(context).push(ProductsGrid);
                      //   Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return ProductsGrid();
                      // }));
                        // ChangeNotifierProvider.value(
                        //   // builder: (c) => products[i],
                        //   value: products,
                        // );
                      }),
                  RegButton(
                      params: Params()
                        ..text = 'Upcoming Order'
                        ..textHeight = 26.0
                        ..fontFamily = "Roboto-Medium"
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite //xx
                        ..height = 94.0 //xx2
                        ..width = 242.0 //xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        // ..textAlig = Alignment.center
                        ..marginLeft = 0.0
                        ..marginTop = 20, //20
                      tap: () {}),
                  RegButton(
                      params: Params()
                        ..text = 'Order List'
                        ..textHeight = 26.0
                        ..fontFamily = "Roboto-Medium"
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite //xx
                        ..height = 94.0 //xx2
                        ..width = 242.0 //xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        ..textAlig = Alignment.center
                        ..marginLeft = 0.0
                        ..marginTop = 20, //20
                      tap: () {
                         Navigator.of(context).pushNamed(OrderListPage.routeName);
                      }),
                  RegButton(
                      params: Params()
                        ..text = 'Schedule'
                        ..textHeight = 26.0
                        ..fontFamily = "Roboto-Medium"
                        ..letterSpacing = 2.14
                        ..textColor = ColorRes.colorWhite //xx
                        ..height = 94.0 //xx2
                        ..width = 242.0 //xx2
                        ..backgroundColor = ColorRes.buttonBgColor
                        // ..textAlig = Alignment.center
                        ..marginLeft = 0.0
                        ..marginTop = 20, //20
                      tap: () {}),
                  
                ]
              )
            )
        ),
        bottomNavigationBar: BotNav(),
    );
  } //build
} //stt
