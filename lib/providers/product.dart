import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String orderId, 
  // sellerId, 
  buyerId, title, description, imageUrl, status, time, address, emailV, testId;
  // final String title;
  // final String description;
  final double price;
  // final String imageUrl;
  // final String status;
  // final String time;
  // final String address;
  final int quantity;
  final List<dynamic> services;
  bool isFavorite;

  Product({
    @required this.buyerId, 
    // @required this.sellerId, 
    @required this.orderId,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.status,
    @required this.time,
    @required this.address,
    @required this.emailV,
    @required this.testId,
    @required this.quantity,
    @required this.services,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = 'https://flutter-update.firebaseio.com/products/$buyerId.json?auth=$token';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }
}
