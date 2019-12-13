import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/orders_detail_screen.dart';
import 'package:flutter_complete_guide/screens/request_page2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../providers/products.dart';
import '../providers/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../res/colors.dart';
import '../utils/sp_util.dart';
import '../screens/orders_detail_screen.dart';
import '../screens/order_list_page.dart';

// export 'package:flutter_slidable/src/widgets/slidable.dart';
// export 'package:flutter_slidable/src/widgets/slide_action.dart';
// export 'package:flutter_slidable/src/widgets/slidable_action_pane.dart';
// export 'package:flutter_slidable/src/widgets/slidable_dismissal.dart';
// export 'package:flutter_slidable/src/widgets/fractionnally_aligned_sized_box.dart';

class Swiptable2 extends StatelessWidget {
// class Swiptable2 extends StatefulWidget {

  // final Widget thumbnail;
  // final String title;
  // final String user;
  // final int viewCount;

  // const CustomListItem({
  // const Cart2({
  //   this.thumbnail,
  //   this.title,
  //   this.user,
  //   this.viewCount,
  // });

  // final String id;
  // final String productId;
  // final double price;
  // final int quantity;
  // final String title;

  // CartItem(
  //   this.id,
  //   this.productId,
  //   this.price,
  //   this.quantity,
  //   this.title,
  // );
//w/o this ll have runtime err but not complie err
  // final String id;
  // final String productId;
  // final double price;
  // final int quantity;
  // final String title;
  final String page, buyerId, orderId;

  Swiptable2(
  // const Swiptable2(
    // {
    // this.id,
    // this.productId,
    // this.price,
    // this.quantity,
    // this.title,
    
    this.page,
    this.buyerId,
    this.orderId,
    // }
  );
// print();
//   @override
//   _Swiptable2State createState() => _Swiptable2State();
// }

// class _Swiptable2State extends State<Swiptable2> {
  // final String page;
  // final String id;
  // final String productId;
  // final double price;
  // final int quantity;
  // final String title;
  // final String page;

  // _Swiptable2State(
    // {
    // this.page,
    // this.id,
    // this.productId,
    // this.price,
    // this.quantity,
    // this.title,
    // this.page,
  // }
  // );
  // final String title;
  // final String user;
  // final int viewCount;
  // const _Swiptable2State({
  //   Key key,
  //   this.title,
  //   this.user,
  //   this.viewCount,
  // }) : super(key: key);
  // Color _ftrColorPick;
  //need a smart way to make it not run this when it s request_page cuz it dn need this part 
  var _ftrColorPick;
  Color _ftrColor(String status) {
    print("status in _ftrColor: $status");
    // Color _ftrColorPick;
    // if (productId == "p2") _ftrColorPick = Color(ColorRes.greyBtnChatColor);
    if (status == "Order Pending") _ftrColorPick = Color(ColorRes.greyBtnChatColor);
    if (status == "Order Confirmed") _ftrColorPick = Color(ColorRes.toDoTxt);
    if (status == "p4") _ftrColorPick = Color(ColorRes.finishedTxt);
    print("*********_ftrColorPick: $_ftrColorPick");
    return _ftrColorPick;
  }
// print();
  @override
  Widget build(BuildContext context) {
    //double check maybe here cosumer is better for performence 
    // final product = Provider.of<Product>(context, listen: false);
    final product = Provider.of<Product>(context);
    // final product = Provider.of<Products>(context);
    // print('333333333333333333333333 product.buyerId in swiptable2: ${product.buyerId}');
    // print('333333333333333333333333 product.id in swiptable2: $buyerId');
    // print('333333333333333333333333 product.orderId in swiptable2: ${product.orderId}');
    // print('+++++++++++++++++++++++++product.img in swiptable2: ${product.imageUrl}');
    // print('+++++++++++++++++++++++++product.status in swiptable2: ${product.status}');
    // print('+++++++++++++++++++++++++page in swaptable2: ${widget.page}');
    // print('+++++++++++++++++++++++++page in swaptable2: $page');
    return 
    // Stack(children: [ 
      Container(
        // margin: EdgeInsets.all(23),
        // margin: EdgeInsets.only(left: SpUtil.getSize(23), right: SpUtil.getSize(23), bottom: SpUtil.getSize(18)),
        margin: EdgeInsets.fromLTRB(SpUtil.getSize(23), 0.0, SpUtil.getSize(23), SpUtil.getSize(18)),
        // margin: EdgeInsets.symmetric(horizontal: SpUtil.getSize(23), ), 
        color: Color(ColorRes.inputBoxBgColor),
        // color: Colors.red,
        height: 137,//104
        width: 317,//317
        child:
//either make text box fit or make container/box adjustable with the content in case undesired output occurs that takes too much space
          Slidable(
            key: ValueKey(product.description),
            // key: id,
            // key: 1,
            actionPane: SlidableDrawerActionPane(),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Detail',
                color: Colors.blue,
                icon: Icons.archive,
                onTap: () => Navigator.of(context).pushNamed(OrdersDetailScreen.routeName, arguments: orderId,),
                // onTap: () => Navigator.of(context).pushNamed(OrdersDetailScreen.routeName, arguments: widget.id,),
                // onTap: () => 
                // // Navigator.of(context).pushNamed(OrdersDetailScreen.routeName, arguments: [widget.buyerId, widget.orderId],),
                // // Navigator.of(context).pushNamed(OrdersDetailScreen.routeName, arguments: [buyerId, orderId],),
                // // Navigator.of(context).pushNamed(OrdersDetailScreen.routeName, arguments: [orderId, buyerId],),
                // // Navigator.of(context).pushNamed(OrdersDetailScreen.routeName, arguments: [product.buyerId, product.orderId],),
                // Navigator.of(context).pushNamed(OrdersDetailScreen.routeName, arguments: [product.orderId, product.buyerId],),
                // return 
                // OrdersDetailScreen(buyerId, orderId),
                // onTap: () => Navigator.of(context).pushNamed(OrderListPage.routeName),
                // onPressed: () {}
              ),
              IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
              ),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Message',
                // color: Colors.grey.shade200,
                color: Colors.green,
                icon: Icons.message,
                // Icon(FontAwesomeIcons.comments)
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                // onTap: () => Provider.of<Cart>(context, listen: false).removeItem(productId);
              ),
            ],
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                // padding: const EdgeInsets.symmetric(vertical: SpUtil.getSize(5.0)),
                child: 
                Column( children: <Widget>[ 
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
              
                  children: <Widget>[
                    // Expanded(
                    //   flex: 2,
                    //   child: Text("CHAT"),
                    // ),
                    Expanded(
                      flex: 3,
                      child: _VideoDescription(
                        // title: widget.title,
                        // user: widget.productId,
                        // viewCount: widget.quantity,
                        title: product.buyerId,
                        // user: product.title,
                        user: product.time,
                        // title: "product.title",
                        // user: 'product.id',
                        // time: product.time,
                        time: product.orderId,
                      ),
                    ),
                    Expanded(flex: 2, child: 
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      // padding: EdgeInsets.all(25),
                      // color: Colors.blue,
                      child: Text("Sweap left for actions", style: TextStyle(
                        color: Color(ColorRes.greyBtnChatColor),
                        fontSize: 18.0,
                        fontFamily: "Roboto-Medium",
                        letterSpacing: 1.0
                      ),textAlign: TextAlign.right,),
                    )
                    ),
                  ],
                ),
                // Expanded( child:
                // Stack(children: [ 
                  // Positioned.fill(child:
                // widget.page == "order" ? 
                page == "order" ? 
                // if (page == "order"){
                Container(
                  height: 17.0,
                  width: 317.0,
                  // color: _ftrColor(product.imageUrl),
                  color: _ftrColor(product.status),
                  // color: _ftrColor(productId),
                  // color: Color(_ftrColor(productId)),
                  // color: {if (productId == "p2") Color(ColorRes.greyBtnChatColor)},
                  // color: productId == "p2" ? Color(ColorRes.greyBtnChatColor) productId == "p2" ? Color(ColorRes.greyBtnChatColor) : Color(ColorRes.greyBtnChatColor),
                  // user == AuthMode.Login ? 'Forgot Password' : 'Terms and Conditions',
                  // color: Color(params.ftrBg),
                  // color: Color(ColorRes.greyBtnChatColor),
                  child: Text("${product.status}", textAlign: TextAlign.center),
                )
                : Spacer()
                // }
                // )
                ])
                // ])
              ),//;//padding
            )
          )
          ;//slidabe 
      //  ]);
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key key,
    this.title,
    this.user,
    this.time,
  }) : super(key: key);

  final String title;
  final String user;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //may need to switch padding to container to use mergin so can use spUtil.  
          const Padding(
            // padding: EdgeInsets.symmetric(vertical: 6.0),
            padding: EdgeInsets.only(top: 6.0),
            // padding: EdgeInsets.only(left: SpUtil.getSize(23)),
            ),
          // Container( child:
          Text(
            // pa
            title,
            style: const TextStyle(
              // fontWeight: FontWeight.w500,
              fontFamily: "Roboto-Medium",
              fontSize: 18.0,
            ),
          ),
          // const Padding(padding: EdgeInsets.symmetric(vertical: 13.0)),
          const Padding(padding: EdgeInsets.only(top: 13.0),), 
          Text(
            user,
            style: const TextStyle(fontSize: 15.0, fontFamily: "Roboto-Regular",), 
          ),
          // const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          const Padding(padding: EdgeInsets.only(top: 5.0),), 
          Text(
            '$time',
            style: const TextStyle(fontSize: 15.0, fontFamily: "Roboto-Regular",),
          ),
        ],
      ),
    );
  }
}