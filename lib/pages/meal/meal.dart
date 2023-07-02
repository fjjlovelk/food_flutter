import 'package:flutter/material.dart';
import 'package:food_flutter/model/category_model.dart';
import 'package:food_flutter/pages/meal/meal_content.dart';

class MyMealPage extends StatelessWidget {
  static const String routerName = '/MyMealPage';

  const MyMealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as MyCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.title ?? '未知标题'),
      ),
      body: const MyMealContent(),
    );
  }
}
