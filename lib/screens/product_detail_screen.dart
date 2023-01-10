import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments
        as String; // id of the product

    final productLoaded = Provider.of<ProductsProvider>(context, listen: false)
        .getProduct(productId);

    return Scaffold(
      appBar: AppBar(title: Text(productLoaded.title)),
    );
  }
}
