import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product_grid.dart';

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsShown = Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          PopupMenuButton<FilterOptions>(
              onSelected: (FilterOptions value) {
                if (value == FilterOptions.Favorites) {
                  productsShown.showFavoritesOnly();
                } else {
                  productsShown.showAll();
                }
              },
              child: const Icon(
                (Icons.more_vert),
              ),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('All items'),
                      value: FilterOptions.All,
                    ),
                    PopupMenuItem(
                      child: Text('Favorites'),
                      value: FilterOptions.Favorites,
                    )
                  ])
        ],
      ),
      body: ProductGrid(),
    );
  }
}
