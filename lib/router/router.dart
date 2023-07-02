import 'package:flutter/material.dart';
import 'package:food_flutter/pages/collect/collect.dart';
import 'package:food_flutter/pages/home/home.dart';
import 'package:food_flutter/pages/main/main.dart';
import 'package:food_flutter/pages/meal/meal.dart';
import 'package:food_flutter/pages/meal_detail/meal_detail.dart';
import 'package:food_flutter/pages/unknown/unknown.dart';

class MyRouter {
  static const String initialRoute = MyMainPage.routeName;

  // 路由表
  static final Map<String, WidgetBuilder> routes = {
    MyMainPage.routeName: (_) => const MyMainPage(),
    MyHomePage.routeName: (_) => const MyHomePage(),
    MyCollectPage.routeName: (_) => const MyCollectPage(),
    MyMealPage.routerName: (_) => const MyMealPage(),
    MyMealDetailPage.routerName: (_) => const MyMealDetailPage(),
  };

  // 404
  static MaterialPageRoute unknownRoute(settings) {
    return MaterialPageRoute(builder: (ctx) {
      return const MyUnknownPage();
    });
  }
}
