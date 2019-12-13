import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];
  // var _showFavoritesOnly = false;
  final String authToken;

  Products(this.authToken, this._items);

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List _serv = [];
  List get serv {
    // _serv[]
    return [..._serv];
  }

  // String _idR;
  // void set idR(_idR){idR = _idR;}
  // String get idR {
  //   idR = _idR;
  //   return idR;
  // }

  // String get idR {
  //   // idR = _idR;
  //   return idR;
  // }
  // void set idR(String _idR) {
  //   idR = _idR;
  // }
  
  //tt u may want to put this in the f instead of setting here alone outside of the idRetrieve f. 
  //actually that ll stuck in local var
  String _idR;//using default setter
  String get idR {//this can turn into a list if we need to retrieve more ids; now is used for orderId only
    // idR = _idR;
    return _idR;//now any pg can get this order id easyly instead of passing it through each lvl to reach the place/pg
  }
  // void set _idR(String _idr) {
  //   _idR = _idr;
  // }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.orderId == id);
    // return _items.firstWhere((prod) => prod.buyerId == id);
    // return _items.firstWhere((prod) => prod.testId == id);
  }
  List<Product> findById2(String id) {
    return _items.where((prod) => prod.testId == id).toList();
  }

  List<Product> filterById(String id) {
    return _items.where((prod) => prod.imageUrl == id).toList();
  }

  List<Product> filterByStatus(String status) {
    return _items.where((prod) => prod.status == status).toList();
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

Future<void> fetchAndSetProducts() async {
    // final List<Product> loadedProducts = [];
    // final url = 'http://test.api.sevenbuddies.com/api/v1/orders/requesting_orders/';
    var url = 'http://test.api.sevenbuddies.com/api/v1/orders/shops/requesting_orders/';
    try {
      var response = await http.get(
        url, 
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          "Authorization": "Token $authToken"
          // "Authorization": "eyJpZCI6IjE1YmNhNjQyLWZiOWEtNDhlMy1hNzZmLWNiZmQxMzdmZGZmOSIsImVtYWlsIjoieWNsaXZlMDkyNUBnbWFpbC5jb20iLCJleHAiOjE1NjgzOTYxMjh9"
        }
      );
      final reqOrdersA = json.decode(response.body) as Map<String, dynamic>;
      print("********extractedData in products: $reqOrdersA");
      // final extractedData = json.decode(response.body)['data']['orders'] as Map<String, dynamic>;
      // final extractedData2 = json.decode(response.body)['data']['orders'];
      // final reqOrders = reqOrdersA['data']['orders'] as List<String>;
      // final reqOrders = reqOrdersA['data']['orders'] as Map<String, dynamic>;
      // final reqOrders = reqOrdersA['data']['orders'] as List<Map>;//List<dy is not sub type of List<map<dy, dy
      final reqOrders = reqOrdersA['data']['orders'];
      // final extractedData = json.decode(response.body);
      // final readyData = extractedData[data][orders];
      // final readyData = extractedData['data']['orders'];
      print("********reqOrders in products: $reqOrders");
      if (reqOrders == null) {
        return;
      }

      final urlIdS = reqOrders[0]['product']['seller']['urlID'];
      // final String urlId = extractedData2['product']['seller']['urlID'];
      // final String urlId = json.decode(response.body)['data']['orders']['product']['seller']['urlID'].
      print("888888888888888 urlId in products: $urlIdS");//zhangqiwei81746142
      
      // final favoriteResponse = await http.get(url);
      // final favoriteData = json.decode(favoriteResponse.body);
      url = 'http://test.api.sevenbuddies.com/api/v1/myproductlist/$urlIdS';
      // try {
         response = await http.get(
          url, 
          headers: {
            "Content-Type": "application/json",
            "X-Requested-With": "XMLHttpRequest",
            // "Authorization": "Token $authToken"
            // "Authorization": "eyJpZCI6IjE1YmNhNjQyLWZiOWEtNDhlMy1hNzZmLWNiZmQxMzdmZGZmOSIsImVtYWlsIjoieWNsaXZlMDkyNUBnbWFpbC5jb20iLCJleHAiOjE1NjgzOTYxMjh9"
          }
        );
        final myProducts = json.decode(response.body) as Map<String, dynamic>;
        final List<dynamic> myServices = myProducts['Products'][0]['prices'];
        // print("8888888888888 myProducts/services in products: $myProducts");
        // print("8888888888888 myServices in products: $myServices");
        final String emailV = myProducts['Profile']['email'];
     
      // final readyData = extractedData[data][orders];
      final List<Product> loadedProducts = [];
      // extractedData2.forEach((prodId, reqOrder) {
        reqOrders.forEach((reqOrder) {
        // if (extractedData2 && extractedData2.length > 0){
          // return extractedData2.map(order => {
        // extractedData2.map((order) => {
          // extractedData2.map((order) {
          // const {first_name, last_name, email,urlID} = order.buyer
          // return {
        // print("3333333333333inside forEach reqOrder: $reqOrder");    
        // print("3333333333333inside forEach orderId/reqOrder['order_id']: ${reqOrder['order_id']}");
        // print("3333333333333inside forEach buyerId/reqOrder['purchaser']['urlID']: ${reqOrder['purchaser']['urlID']}");
        // print("++++++inside forEach reqOrder['order_id']: ${order['order_id']}");
        // print("inside forEach reqOrder['order_id']: ${order.order_id}"),
//this somehow ll create an weird err about boolean cant be null wtf. but special taken care of needed when backend or unregular action/creation ll make/create some filed null which ll create bugs
        // if (reqOrder['purchaser']['first_name'] = null) {
        //   // reqOrder['purchaser']['first_name'] = "first name or last name is missing click chat or chat ll lead u to the person to confirm the request/order";
        //   reqOrder['purchaser']['first_name'] = "no name";
        //   // reqOrder['purchaser']['last_name'] = "first name or last name is missing";
        //   // reqOrder["contact_info"] = "none";
        // }
        // if (reqOrder['purchaser']['last_name'] = null) {
        //   // reqOrder['purchaser']['first_name'] = "first name or last name is missing click chat or chat ll lead u to the person to confirm the request/order";
        //   // reqOrder['purchaser']['first_name'] = "!";
        //   reqOrder['purchaser']['last_name'] = "no name";
        //   // reqOrder["contact_info"] = "none";
        // }
        // return
        String fm = reqOrder['service_time'].replaceAll('T',' ');
        fm = fm.replaceAll('.',' ');
        List<String> fTime = fm.split(' ');
        String fmt = fTime[1].substring(0, 5); //same name as in edit pg
        // print('9999999 fTime in prods: $fTime');
        // print("9999999 fmt in prods: $fmt");
        String fmd = fTime[0];//same name as in edit pg
        //best way d be a list but then u ll have to modify product file actually wont be that much of a diff 
        //or u can pass d and t separatetly but still need modify product but still ahh not worth it
        String fmdt = fmd + " " + fmt; 

        loadedProducts.add(Product(
          // var idd;
          // id: prodId,
          // reqOrder['purchaser']['first_name'] = null ? 
          // id: reqOrder['purchaser']['first_name'] + " " + reqOrder['purchaser']['last_name'],
          buyerId: reqOrder['purchaser']['urlID'],
          // buyerId: "test123",
          orderId: reqOrder['order_id'],
          // title: reqOrder['shipping_address']['address_line1'],
          // address: reqOrder['shipping_address']['address_line1'],
          title: '123',
          address: '456',
          // id: order['order_id'],
          // title: order['note_to_seller'],
          // print("dd");
          // description: reqOrder['description'],
          // price: reqOrder['price'],
          // isFavorite: reqOrder['isFavorite'],
          // imageUrl: reqOrder['imageUrl'],
          // title: "reqOrder['title']",
          description: reqOrder['product']['description'],
          quantity: reqOrder['quantity'],
          time: fmdt,
          // time: reqOrder['order_id'],
          price: reqOrder['total_price'],
          isFavorite: true,
          // imageUrl: reqOrder['product']['skill_certification_images']['url'],
          imageUrl: reqOrder['product']['photos'][0]['url'],//not right pic just a placeholder
          status: reqOrder['status'],
          services: myServices,//this may not needed cuz same as _serv or vice versa  
          emailV: emailV,
          // testId: "5ea77e35",
          testId: "laundry",
        ))//.add product
        // ,
        ;
          // }
      });//for each
        // }//if >0
      print("33333333loadedProducts in products: $loadedProducts");
      print("33333333loadedProducts[0] in products: ${loadedProducts[0]}");
      print("33333333loadedProducts[0].orderId in products: ${loadedProducts[0].orderId}");
      
      _items = loadedProducts;
      _serv = myServices;
      // _serv = myServices['prices'];
      // _serv = myServices.prices;
      notifyListeners();
    } catch (error) {//try
      throw (error);
    }

    // i was gonna modify this for multi data recievement and mulipucation 
    // final url = 'http://test.api.sevenbuddies.com/api/v1/orders/requesting_orders/';
    // try {
    //   final response = await http.get(
    //     url, 
    //     headers: {
    //       "Content-Type": "application/json",
    //       "X-Requested-With": "XMLHttpRequest",
    //       "Authorization": "Token $authToken"
    //       // "Authorization": "eyJpZCI6IjE1YmNhNjQyLWZiOWEtNDhlMy1hNzZmLWNiZmQxMzdmZGZmOSIsImVtYWlsIjoieWNsaXZlMDkyNUBnbWFpbC5jb20iLCJleHAiOjE1NjgzOTYxMjh9"
    //     }
    //   );
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //   print("********extractedData in products: $extractedData");
    //   // final extractedData = json.decode(response.body)['data']['orders'] as Map<String, dynamic>;
    //   final extractedData2 = json.decode(response.body)['data']['orders'];
    //   // final extractedData = json.decode(response.body);
    //   // final readyData = extractedData[data][orders];
    //   // final readyData = extractedData['data']['orders'];
    //   print("********extractedData2 in products: $extractedData2");
    //   if (extractedData == null) {
    //     return;
    //   }
    //   // final readyData = extractedData[data][orders];
    //   // final List<Product> loadedProducts = [];
    //     extractedData2.forEach((reqOrder) {
    //     print("++++++inside forEach reqOrder['order_id']: ${reqOrder['order_id']}");
    //     // print("++++++inside forEach reqOrder['order_id']: ${order['order_id']}");
    //     // print("inside forEach reqOrder['order_id']: ${order.order_id}"),
    //     loadedProducts.add(Product(
    //       // id: prodId,
    //       id: reqOrder['purchaser']['first_name']+reqOrder['purchaser']['last_name'],
    //       title: reqOrder['shipping_address']['address_line1'],
    //       // id: order['order_id'],
    //       // title: order['note_to_seller'],
    //       // print("dd");
    //       // description: reqOrder['description'],
    //       // price: reqOrder['price'],
    //       // isFavorite: reqOrder['isFavorite'],
    //       // imageUrl: reqOrder['imageUrl'],
    //       // title: "reqOrder['title']",
    //       description: reqOrder['service_time'],
    //       price: 1.0,
    //       isFavorite: true,
    //       imageUrl: reqOrder['status'],
    //     ));//.add product
    //   });//for each
    //     // }//if >0
    //   print("********loadedProducts in products: $loadedProducts");
    //   _items = loadedProducts;
    //   notifyListeners();
    // } catch (error) {//try
    //   throw (error);
    // }
    
  }//fetch

  String _chat;
  String get chat {
    return  _chat;
  }
  Future<void> chatApi() async {
    // final url = 'https://api.sevenbuddies.com/chat/';
    final url = 'http://test.api.sevenbuddies.com/chat/';
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          "Authorization": "Token $authToken"
        },

      );
      // String chat;
      // String get chat {
      //   return  chat;
      // };
      final load = json.decode(response.body) as List<dynamic>;
      // print("11111111111 chat Api response: $load");
      _chat = load[0]['content'];
      print("11111111111 chat Api called");
      // notifyListeners();
    } catch (error) {
      print('11111111111 in prods chatApi err: $error');
      throw error;
    }
  }//fetch


  Future<void> addProduct(Product product) async {
    // final url = 'http://test.api.sevenbuddies.com/api/v1/accounts/myaccount/';
    // try {
    //   final response = await http.post(
    //     url,
    //     body: json.encode({
    //       'title': product.title,
    //       'description': product.description,
    //       'imageUrl': product.imageUrl,
    //       'price': product.price,
    //       'isFavorite': product.isFavorite,
    //     }),
    //   );
    //   final newProduct = Product(
    //     title: product.title,
    //     description: product.description,
    //     price: product.price,
    //     imageUrl: product.imageUrl,
    //     id: json.decode(response.body)['name'],
    //   );
    //   _items.add(newProduct);
    //   // _items.insert(0, newProduct); // at the start of the list
    //   notifyListeners();
    // } catch (error) {
    //   print(error);
    //   throw error;
    // }
  }

  Future<void> confirmReq(String orderId) async {
    final url = 'http://test.api.sevenbuddies.com/api/v1/orders/$orderId/confirm_status/';
    try {
      await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          "Authorization": "Token $authToken"
        },
        body: json.encode({
            "order": {
                "action" : "accept"
            }
        }),
      );
      
      // notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  //i was gonna use this to retrieve and keep the id to update the right part
  //orderId was originated/filtered from req pg and passed to swiptable2 then this method was called to get the orderId in order detail scrn
  //since at req pg where orderId was originated, we picked/passed up another buyerId so at its retireve i had to use a list[1] 
  void idRetrieve(String orderId) {
    print("555555555555555 idReri f is called");
    _idR = orderId;   
  }
  String _timeS;//using default setter
  String get timeS {
    // idR = _idR;
    return _timeS;
  }
  void timeRetrieve(String times) {
    print("555555555555555 timeReri f is called");
    _timeS = times;   
  }

  Future<void> updateTime(
    String upDate, 
    String upTime, String dt) async {
    // final prodIndex = _items.indexWhere((prod) => prod.orderId == idR);
    // if (prodIndex >= 0) {
      print('22222222222222222 upDate in prods updateTime: $upDate');//2019-11-21 00:00:00.000
      print('22222222222222222 upTime in prods updateTime: $upTime');//10:27:57.000 
      //u can also modify the source file of DatePicker, i thought there s "xxx as" in there to prevent type change 
      //but there s none. solution might be here https://dart.dev/guides/language/sound-problems
      String upDateTime;
      if (dt == "date"){
        upDate = upDate.substring(0, 10);
        // upTime = upTime.replaceAll(' ','').substring(0, 5);
        upTime = upTime.replaceAll(' ','');
        upDateTime = upDate + " " + upTime + ":00";//sec not need to modify(:00) actually i mean u can pass in seconds
        print('22222222222222222 upDate.sub date in prods updateTime: $upDate');
        print('22222222222222222 upTime.sub in date prods updateTime: $upTime');
      } else {
        // upDate = upDate.replaceAll(' ','').substring(0, 10);
        upDate = upDate.replaceAll(' ','');
        upTime = upTime.substring(11, 19);
        upDateTime = upDate + " " + upTime;
        print('22222222222222222 upDate.sub time in prods updateTime: $upDate');
        print('22222222222222222 upTime.sub time in prods updateTime: $upTime');
      }
      print('22222222222222222 upDate modified in prods updateTime: $upDate');
      print('22222222222222222 upTime modified in prods updateTime: $upTime');
      print('22222222222222222 upDateTime in prods updateTime: $upDateTime');
      final url = 'http://test.api.sevenbuddies.com/api/v1/orders/$idR/service_time/';
      await http.put(url,
          headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          "Authorization": "Token $authToken"
          // "Authorization": "eyJpZCI6IjE1YmNhNjQyLWZiOWEtNDhlMy1hNzZmLWNiZmQxMzdmZGZmOSIsImVtYWlsIjoieWNsaXZlMDkyNUBnbWFpbC5jb20iLCJleHAiOjE1NjgzOTYxMjh9"
          },
          body: json.encode({
              "order" : {
                  "service_time" : "$upDateTime"
              }
          }));
      // _items[prodIndex] s= newProduct;
      print('55555555555 updateTime is called');
      notifyListeners();
    // } else {
    //   print('...');
    // }
  }

  Future<void> deleteProduct(String id) async {
  //   final url = 'http://test.api.sevenbuddies.com/api/v1/accounts/myaccount/';
  //   final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
  //   var existingProduct = _items[existingProductIndex];
  //   _items.removeAt(existingProductIndex);
  //   notifyListeners();
  //   final response = await http.delete(url);
  //   if (response.statusCode >= 400) {
  //     _items.insert(existingProductIndex, existingProduct);
  //     notifyListeners();
  //     throw HttpException('Could not delete product.');
  //   }
  //   existingProduct = null;
  }

  //i was gonna make this into update
  // Future<void> addOrder(List<CartItem> cartProducts, double total) async {
  //   final url = 'http://test.api.sevenbuddies.com/api/v1/orders/<order_id>/service_time/';
  //   final timestamp = DateTime.now();
  //   final response = await http.post(
  //     url,
  //     body: json.encode({
  //       'amount': total,
  //       'dateTime': timestamp.toIso8601String(),
  //       'products': cartProducts
  //           .map((cp) => {
  //                 'id': cp.id,
  //                 'title': cp.title,
  //                 'quantity': cp.quantity,
  //                 'price': cp.price,
  //               })
  //           .toList(),
  //     }),
  //   );
  //   _orders.insert(
  //     0,
  //     OrderItem(
  //       id: json.decode(response.body)['name'],
  //       amount: total,
  //       dateTime: timestamp,
  //       products: cartProducts,
  //     ),
  //   );
  //   notifyListeners();
  // }

}
