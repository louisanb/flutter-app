import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/orders_detail_item.dart';
// import '../../widgets/app_drawer.dart';

class OrdersDetailScreen extends StatelessWidget {
  static const routeName = '/orders_detail';

  @override
  Widget build(BuildContext context) {
    print('building orders');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Your Orders'),
      // ),
      // drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Products>(context, listen: false).fetchAndSetProducts(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Products>(
                builder: (ctx, orderData, child) => ListView.builder(
                      itemCount: orderData.orders.length,
                      itemBuilder: (ctx, i) => OrdersDetailItem(orderData.orders[i]),
                    ),
              );
            }
          }
        },
      ),
    );
  }
}
