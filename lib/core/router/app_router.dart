import 'package:flutter/material.dart';
import 'package:flutter_doctors/app/Menu/model/food_model.dart';
import 'package:flutter_doctors/app/Menu/view/menu_screen.dart';
import 'package:flutter_doctors/app/product_info/view/product_info.dart';
import 'package:flutter_doctors/core/router/route_name.dart';

class AppRouter {
  Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
          builder: (_) => MenuScreen(),
        );

      case RoutesNames.productInfo:
        return MaterialPageRoute(
          builder: (_) => ProductInfo(
            foodModel: settings.arguments as FoodModel,
          ),
        );
    }

    return null;
  }
}
