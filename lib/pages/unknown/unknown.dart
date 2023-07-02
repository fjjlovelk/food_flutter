import 'package:flutter/material.dart';

class MyUnknownPage extends StatelessWidget {
  static const String routeName = "/MyUnknownPage";

  const MyUnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404'),
      ),
      body: const Center(
        child: Text('你来到了没有知识的荒原'),
      ),
    );
  }
}
