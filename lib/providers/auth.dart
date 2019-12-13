import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

import '../res/apis.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  List<String> _user;

  bool get isAuth {
    return token != null;
  }

  String get token {
    // if (_expiryDate != null &&
    //     _expiryDate.isAfter(DateTime.now()) &&
    //     _token != null) {
      if (_token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment, [String pswConf]) async {
        print("_authenticate is called");
    final url = AppAction.BASE_URL + "/accounts/$urlSegment/";
        // 'http://test.api.sevenbuddies.com/api/v1/accounts/$urlSegment/';
    try {
      print("try in _authenticate is called");//yclive0925@gmail.com louisan7buddies@gmail.com
      var data = urlSegment == "login" 
      // ? json.encode({ "user": { "email": "louisan7buddies@gmail.com", "password": "test12345" }})
      // ? json.encode({ "user": { "email": email, "password": password }})
      ? json.encode({ "user": { "email": "yclive0925@gmail.com", "password": "c06db68e819be6ec3d26c6038d8e8d1f" }})
      // ? json.encode({ "user": { "email": "zhangqiwei817@gmail.com", "password": "c06db68e819be6ec3d26c6038d8e8d1f" }})
      : json.encode({ "user": { "email": email, "password": password, "confirm_password": pswConf }});
      print("data in _authenticate: $data \n urlSegment: $urlSegment");
      final response = await http.post(
        url,
        headers: AppAction.HEADERS,
        body: data,
      );//post
      final responseData = json.decode(response.body);
      if (responseData['errors'] != null) {
      print("responseData af post bef throw http: $responseData \n responseData[errors] af post: ${responseData['errors']}");
      // var passData = responseData['errors'].toString();
      // var passData = responseData.toString();
      var passData = responseData['errors'].toString().replaceAll('[','');
      passData = passData.replaceAll(']','');
      passData = passData.replaceAll('{','');
      passData = passData.replaceAll('}','');
      // print(responseData.toString().replaceAll('[',''));
      // print(responseData.toString().trim('[');  
      // var passData = responseData['errors']['error'].remove("[");// return false in err
      print("passData: $passData");
      // print("responseData['errors']['error'].remove: $passData");
      // print("passdata.toString: ${passData.toString}");
      // if (responseData['errors']['email'] != null) {
      //   print("undef checked");
      //   passData = responseData['errors']['email'];
      // }
        //course way ll have err: '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'String'
        //still an err regarding .tostring: Closure: () => String from Function 'toString':. u can eitehr use the method 
        //abv using str munipulation getting ride of {}[] then pass it to auth_screen as an obj or something. or u pass 
        //the whole responseData['errors'] and then do json.encode on it and then access the desired err using obj 
        //annotation or u can redefine HttpException to accept not only str. 
        throw HttpException(responseData['errors'].toString());
      }
      print("responseData in _authenticate bf post: $responseData");
      _token = responseData['user']['token'];
      //if register err email already registered then err: []("token") and line below wont exectue
      print("responseData in _authenticate af post and _token: $responseData");
      notifyListeners();
    } catch (error) {
      print("error in catch of _authenticate af post httpException: $error");
      throw error;
    }
  }

  Future<void> signup(String email, String password, String pswConf) async {
    print("auth.signup is called");
    return _authenticate(email, password, 'register', pswConf );
    // final url =
    //     'http://test.api.sevenbuddies.com/api/v1/accounts/register/';
    // try {
    //   final response = await http.post(
    //     url,
    //     headers: {
    //       "Content-Type": "application/json",
    //       "X-Requested-With": "XMLHttpRequest"
    //     },
    //     body: json.encode(
    //       {
    //         "user": {
    //           "email": email,
    //           "password": password,
    //           "confirm_password": pswConf,
    //         }
    //       },
    //     ),
    //   );//post
    //   final responseData = json.decode(response.body);
    //   if (responseData['error'] != null) {
    //     throw HttpException(responseData['error']['message']);
    //   }
    //   print("responseData: $responseData");
    //   _token = responseData['user']['token'];
    //   notifyListeners();
    // } catch (error) {
    //   throw error;
    // }

  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'login');
  //   final url =
  //       'http://test.api.sevenbuddies.com/api/v1/accounts/login/';
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "X-Requested-With": "XMLHttpRequest"
  //       },
  //       body: json.encode(
  //         {
  //           "user": {
  //             "email": email,
  //             "password": password,
  //           }
  //         },
  //       ),
  //     );//post
  //     final responseData = json.decode(response.body);
  //     if (responseData['error'] != null) {
  //       throw HttpException(responseData['error']['message']);
  //     }
  //     print(responseData);
  //     _token = responseData['user']['token'];
  //     notifyListeners();
  //   } catch (error) {
  //     throw error;
  //   }

  }//future login
}
