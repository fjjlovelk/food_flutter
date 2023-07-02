import 'package:flutter/material.dart';
import 'package:food_flutter/pages/home/home_content.dart';

class MyHomePage extends StatelessWidget {
  static const String routeName = "/MyHomePage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('美食广场'),
      ),
      body: const MyHomeContent(),
    );
  }
}
