import 'package:flutter/material.dart';
import 'package:zero/features/auth/screens/loginScreen.dart';

import 'Home/Screens/Home.dart';
import 'Home/Screens/category_deals_screen.dart';
import 'features/product/screen/ProductDetailScreen.dart';
import 'features/search/screen/searchScreen.dart';
import 'models/product.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case authScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => authScreen(),
        settings: routeSettings,
      );
    case Home.routeName:
      return MaterialPageRoute(
        builder: (_) => Home(),
        settings: routeSettings,
      );
    case categoryProducts.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => categoryProducts(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    default:
      return MaterialPageRoute(builder: (_) => Scaffold(
        body: Column(
          children: [
            Center(
              child: Text('Page is Not Found'),
            )
          ],
        ),
      ));

  }
}
