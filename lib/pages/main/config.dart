import 'package:flutter/material.dart';
import 'package:food_flutter/pages/collect/collect.dart';
import 'package:food_flutter/pages/home/home.dart';

class MyMainPageConfig {
  static final List<Widget> pages = [const MyHomePage(), const MyCollectPage()];

  static final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      label: '首页',
      icon: Icon(Icons.home),
    ),
    const BottomNavigationBarItem(
      label: '收藏',
      icon: Icon(Icons.star),
    ),
  ];
}
