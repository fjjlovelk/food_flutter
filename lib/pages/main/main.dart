import 'package:flutter/material.dart';
import 'package:food_flutter/pages/main/config.dart';

class MyMainPage extends StatefulWidget {
  static const String routeName = "/";

  const MyMainPage({Key? key}) : super(key: key);

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: MyMainPageConfig.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: MyMainPageConfig.items,
          currentIndex: _currentIndex,
          onTap: (val) {
            setState(() {
              _currentIndex = val;
            });
          }),
    );
  }
}
