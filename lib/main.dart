import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';

// import 'package:flutter/rendering.dart';
import './res/colors.dart';
import './utils/sp_util.dart';

import './screens/auth_screen.dart';
import './screens/home_page.dart';
import './screens/request_page.dart';
import './screens/order_list_page.dart';
import './screens/orders_detail_screen.dart';
import './screens/edit_page.dart';
import './screens/list_view.dart';
import './screens/edit_pg.dart';//
import './screens/setting_page.dart';
import './screens/phone_book_pg.dart';
import './screens/confirm_pg.dart';
import './screens/chat_list_pg.dart';
import './screens/chat_pg.dart';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  SpUtil.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          builder: (ctx, auth, previousProducts) => Products(
                auth.token,
                previousProducts == null ? [] : previousProducts.items,
              ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          builder: (ctx, auth, previousOrders) => Orders(
                auth.token,
                previousOrders == null ? [] : previousOrders.orders,
              ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
              title: 'MyShop',
              theme: ThemeData(
                primaryColor: Color(ColorRes.titleTextColor),
                accentColor: Color(ColorRes.hintTextColor),
                fontFamily: 'Lato',
              ),
              // home: auth.isAuth ? ProductsOverviewScreen() : AuthCard(),
              // home: auth.isAuth ? BottomNavigationBarItemLessDefault() : AuthCard(),
              home: auth.isAuth ? HomePage() : AuthCard(),
              // home: auth.isAuth ? RequestPage() : AuthCard(),
              // home: ListView2(),
              routes: {
                RequestPage.routeName: (ctx) => RequestPage(),
                OrderListPage.routeName: (ctx) => OrderListPage(),
                OrdersDetailScreen.routeName: (ctx) => OrdersDetailScreen(),
                EditPage.routeName: (ctx) => EditPage(),
                // EditPg.routeName: (ctx) => EditPg(),
                SettingPage.routeName: (ctx) => SettingPage(),
                HomePage.routeName: (ctx) => HomePage(),
                PhonePage.routeName: (ctx) => PhonePage(),
                ConfirmPage.routeName: (ctx) => ConfirmPage(),
                ChatListPage.routeName: (ctx) => ChatListPage(),
                ChatPage.routeName: (ctx) => ChatPage(
                  // title: "title",
                  // channel: IOWebSocketChannel.connect('ws://echo.websocket.org'),
                  // channel: IOWebSocketChannel.connect('ws://54.183.150.155:8082/ws/chat/f46e5b4c-1fd3-40f1-a1d5-110e882c6eee'),
                  // channel: IOWebSocketChannel.connect('ws://54.183.150.155:8082'),                
                ),

              },
            ),
      ),
    );
  }
}
