import 'package:flutter/material.dart';
import 'package:food_flutter/model/meal_model.dart';
import 'package:food_flutter/pages/meal_detail/detail_content.dart';

class MyMealDetailPage extends StatelessWidget {
  static const String routerName = '/MyMealDetailPage';

  const MyMealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title ?? '未知标题'),
      ),
      body: MealDetailContent(meal),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.favorite_border),
      ),
    );
  }
}
