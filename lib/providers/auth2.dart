import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  // DateTime _expiryDate;
  // String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    // if (_expiryDate != null &&
    //     _expiryDate.isAfter(DateTime.now()) &&
    //     _token != null) {
      // if（_token != null){
      return _token;
    // }
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'http://test.api.sevenbuddies.com/api/v1/accounts/$urlSegment/';
    try {
      final response = await http.post(
        url, 
        headers: {
          "Content-Type": "application/json", 
          "X-Requested-With": "XMLHttpRequest" 
        },
        // if urlsegment = "register" {
        //     body: json.encode(
        //     {
        //         "user": {
        //             "email": email,
        //             "password": password,
        //             "confirm_password": password
        //         }
        //     },
        //   ), 
        // } else {
        //     body: json.encode(
        //       {
        //           "user": {
        //               "email": email,
        //               "password": password,
        //               "confirm_password": password
        //           }
        //       },
        //     ), 
        // }//else
       
      );//post
      _authRes () {
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      print("res data err none");
      print(responseData);
      _token = responseData['token'];
      // _token = eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1YmNhNjQyLWZiOWEtNDhlMy1hNzZmLWNiZmQxMzdmZGZmOSIsImVtYWlsIjoieWNsaXZlMDkyNUBnbWFpbC5jb20iLCJleHAiOjE1NjY1OTA5MDZ9.UPSn0Ze4z0M4Yy_w_T46GHS__LR6Y8Y9o_ndb7r5TrM;
      print(_token);
      // _userId = responseData['localId'];
      // _expiryDate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(
      //       responseData['expiresIn'],
      //     ),
      //   ),
      // );
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
    }//authRes
  // }//_authen

  // Future<void> signup(String email, String password) async {
    
  //   return _authenticate(email, password, 'register');
  // }

  // Future<void> login(String email, String password) async {
  //   print(email);
  //   print(password);
  //   return _authenticate(email, password, 'login');
  // }

  Future<void> signup(String email, String password) async {
       final url =
        'http://test.api.sevenbuddies.com/api/v1/accounts/$urlSegment/';
    try {
      final response = await http.post(
        url, 
        headers: {
          "Content-Type": "application/json", 
          "X-Requested-With": "XMLHttpRequest" 
        },
            body: json.encode(
            {
                "user": {
                    "email": email,
                    "password": password,
                    "confirm_password": password
                }
            },
          ), 
       
      );//post
      _authRes();  
  }

  Future<void> login(String email, String password) async {
    
  }

}//auth changenotifier
