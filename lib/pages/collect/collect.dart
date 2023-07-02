import 'package:flutter/material.dart';

class MyCollectPage extends StatelessWidget {
  static const String routeName = "/MyCollectPage";

  const MyCollectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('收藏'),
      ),
      body: const Text('收藏'),
    );
  }
}
