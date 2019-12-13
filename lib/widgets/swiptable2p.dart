import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../providers/products.dart';
import '../providers/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../res/colors.dart';
import '../utils/sp_util.dart';

// export 'package:flutter_slidable/src/widgets/slidable.dart';
// export 'package:flutter_slidable/src/widgets/slide_action.dart';
// export 'package:flutter_slidable/src/widgets/slidable_action_pane.dart';
// export 'package:flutter_slidable/src/widgets/slidable_dismissal.dart';
// export 'package:flutter_slidable/src/widgets/fractionnally_aligned_sized_box.dart';


class CartItem2 extends StatefulWidget {
  // static const routeName = '/cart2';
  // const CustomListItem({
  // const Cart2({
  //   this.thumbnail,
  //   this.title,
  //   this.user,
  //   this.viewCount,
  // });

  // final Widget thumbnail;
  // final String title;
  // final String user;
  // final int viewCount;

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

  // final String id;
  // final String productId;
  // final double price;
  // final int quantity;
  // final String title;

  // const CartItem2(
  //   this.id,
  //   this.productId,
  //   this.price,
  //   this.quantity,
  //   this.title,
  // );
// print();
  @override
  _CartItem2State createState() => _CartItem2State();
}

class _CartItem2State extends State<CartItem2> {

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  _CartItem2State({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  });
  // final String title;
  // final String user;
  // final int viewCount;
  // const _CartItem2State({
  //   Key key,
  //   this.title,
  //   this.user,
  //   this.viewCount,
  // }) : super(key: key);
// print();
  @override
  Widget build(BuildContext context) {
    //double check maybe here cosumer is better for performence 
    final product = Provider.of<Product>(context, listen: false);
    print('**************************product.id in cart_item2: ${product.id}');
    return 
      Container(
        // margin: EdgeInsets.all(23),
        // margin: EdgeInsets.only(left: SpUtil.getSize(23), right: SpUtil.getSize(23)),
        margin: EdgeInsets.symmetric(horizontal: SpUtil.getSize(23)),
        color: Color(ColorRes.inputBoxBgColor),
        height: 104,
        width: 317,
        child:

          Slidable(
                  key: ValueKey(productId),
                  // key: id,
                  // key: 1,
                  actionPane: SlidableDrawerActionPane(),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.blue,
                      icon: Icons.archive,
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
                      color: Colors.grey.shade200,
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
                      child: Row(
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
                              title: product.title,
                              user: product.id,
                              // title: "product.title",
                              // user: 'product.id',
                              viewCount: 3,
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
                    ),//;//padding
                  )
                );//slidabe 
      
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key key,
    this.title,
    this.user,
    this.viewCount,
  }) : super(key: key);

  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[ const Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
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
          const Padding(padding: EdgeInsets.symmetric(vertical: 13.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 15.0, fontFamily: "Roboto-Regular",), 
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Text(
            '$viewCount views',
            style: const TextStyle(fontSize: 15.0, fontFamily: "Roboto-Regular",),
          ),
        ],
      ),
    );
  }
}