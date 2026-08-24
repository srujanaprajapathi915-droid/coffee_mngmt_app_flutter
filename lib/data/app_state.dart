import 'package:flutter/foundation.dart';
import 'package:coffee_management_flutter/models/coffee_item.dart';

class CartItem {
  final CoffeeItem coffee;
  int quantity;

  CartItem({required this.coffee, this.quantity = 1});
}

class AppState {
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  final List<CartItem> cartItems = [];
  final List<CoffeeItem> wishlistItems = [];

  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }

  void addToCart(CoffeeItem item) {
    final index = cartItems.indexWhere((c) => c.coffee.id == item.id);
    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(coffee: item));
    }
    _notifyListeners();
  }

  void removeFromCart(CoffeeItem item) {
    final index = cartItems.indexWhere((c) => c.coffee.id == item.id);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
    }
    _notifyListeners();
  }

  void toggleWishlist(CoffeeItem item) {
    final index = wishlistItems.indexWhere((c) => c.id == item.id);
    if (index >= 0) {
      wishlistItems.removeAt(index);
    } else {
      wishlistItems.add(item);
    }
    _notifyListeners();
  }

  bool isInWishlist(CoffeeItem item) {
    return wishlistItems.any((c) => c.id == item.id);
  }

  double get totalCartPrice {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.coffee.price * item.quantity;
    }
    return total;
  }

  void clearCart() {
    cartItems.clear();
    _notifyListeners();
  }
}
