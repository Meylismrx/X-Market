import 'package:flutter/foundation.dart';

import '../models/product.dart';

class UserProvider with ChangeNotifier {
  String? _email;
  List<Order> _orders = [];
  List<Product> _favorites = [];

  String? get email => _email;
  List<Order> get orders => _orders;
  List<Product> get favorites => _favorites;

  void setUser(String email) {
    _email = email;
    notifyListeners();
  }

  void addOrder(Order order) {
    _orders.insert(0, order); // Add new order at the beginning
    notifyListeners();
  }

  void toggleFavorite(Product product) {
    if (_favorites.any((p) => p.id == product.id)) {
      _favorites.removeWhere((p) => p.id == product.id);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _favorites.any((p) => p.id == productId);
  }

  void clearUser() {
    _email = null;
    _orders = [];
    _favorites = [];
    notifyListeners();
  }
}

class Order {
  final String id;
  final String productName;
  final String status;
  final String date;
  final double price;

  Order({
    required this.id,
    required this.productName,
    required this.status,
    required this.date,
    required this.price,
  });
}
