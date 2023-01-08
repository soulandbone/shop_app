import 'package:flutter/material.dart';

import '../models/cart_Item.dart';

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    // Key of Map is the Id of the original, product.
    return {..._items};
  }

  void addItem(String productId, String title, double price) {
    _items.update(
        productId,
        (value) => CartItem(
            id: value.id,
            title: value.title,
            price: value.price,
            quantity: value.quantity + 1),
        ifAbsent: () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1,
            ));
  }
}
