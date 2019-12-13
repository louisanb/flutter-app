import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/sp_util.dart';
import '../providers/products.dart';
import '../utils/parameter.dart';

//this should be part of orders_detail_scr and not separated out 
//alone but that file s too big and this might be re usable so...
class LoadPic extends StatefulWidget {
  // final String img;
  final Params params;
  final tap;
  // const LoadPic(
  //   Key key,
  //   this.img,
  // ) : super(key: key);
  const LoadPic({
    // this.img,
    Key key, 
    @required 
    this.params, 
    this.tap
  }):super(key:key);

  @override
  _LoadPicState createState() => _LoadPicState();
}

class _LoadPicState extends State<LoadPic> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // final argSet =
    //     ModalRoute.of(context).settings.arguments as String; 
    // final argSet =
    //     ModalRoute.of(context).settings.arguments as List; 
    // final String buyerId = argSet[0].toString();
    // final String orderId = argSet[1].toString();
    final orderId =
        ModalRoute.of(context).settings.arguments as String;
    //this is redudent to the arg passed in from orders detail scrn cuz u can do loadedProd.imgUrl
    Provider.of<Products>(
      context,
      listen: false,
    ).findById(orderId);
    // ).findById(buyerId);
    return _isLoading ? 
      CircularProgressIndicator() 
      : 
      Container(
        height: SpUtil.getSize(widget.params.height),
        width: SpUtil.getSize(widget.params.height),
        margin: EdgeInsets.only(
          top: SpUtil.getSize(widget.params.marginTop), 
          left: SpUtil.getSize(widget.params.marginLeft)
        ),
        // color: Colors.red,
        child:
        CircleAvatar(
          backgroundImage: NetworkImage(widget.params.img),
          minRadius: 90,
          maxRadius: 150,
        ),
      );
    // FlatButton(
    //   child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
    //   onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
    //       ? null
    //       : () async {
    //           setState(() {
    //             _isLoading = true;
    //           });
    //           await Provider.of<Orders>(context, listen: false).addOrder(
    //             widget.cart.items.values.toList(),
    //             widget.cart.totalAmount,
    //           );
    //           setState(() {
    //             _isLoading = false;
    //           });
    //           widget.cart.clear();
    //         },
    //   textColor: Theme.of(context).primaryColor,
    // );
  }
}
