import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class UserProvider with ChangeNotifier {
  String? _email;
  List<Order> _orders = [];
  List<Product> _favorites = [];
  final List<Map<String, dynamic>> _shippingAddresses = [
    {
      'name': 'Home',
      'address': '123 Main St, Apt 4B\nNew York, NY 10001\nUnited States',
      'isDefault': true,
    },
    {
      'name': 'Office',
      'address':
          '456 Business Ave, Suite 200\nNew York, NY 10002\nUnited States',
      'isDefault': false,
    },
  ];

  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'title': 'Visa ending in 4242',
      'subtitle': 'Expires 12/25',
      'isDefault': true,
    },
    {
      'title': 'Mastercard ending in 8888',
      'subtitle': 'Expires 08/24',
      'isDefault': false,
    },
  ];

  String? get email => _email;
  List<Order> get orders => _orders;
  List<Product> get favorites => _favorites;
  List<Map<String, dynamic>> get shippingAddresses => _shippingAddresses;
  List<Map<String, dynamic>> get paymentMethods => _paymentMethods;

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

  void addShippingAddress(String name, String address) {
    _shippingAddresses.add({
      'name': name,
      'address': address,
      'isDefault': _shippingAddresses.isEmpty,
    });
    notifyListeners();
  }

  void addPaymentMethod(String title, String subtitle) {
    _paymentMethods.add({
      'title': title,
      'subtitle': subtitle,
      'isDefault': _paymentMethods.isEmpty,
    });
    notifyListeners();
  }

  void setDefaultShippingAddress(int index) {
    for (var i = 0; i < _shippingAddresses.length; i++) {
      _shippingAddresses[i]['isDefault'] = i == index;
    }
    notifyListeners();
  }

  void setDefaultPaymentMethod(int index) {
    for (var i = 0; i < _paymentMethods.length; i++) {
      _paymentMethods[i]['isDefault'] = i == index;
    }
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
