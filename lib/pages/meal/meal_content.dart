import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/model/category_model.dart';
import 'package:food_flutter/model/meal_model.dart';
import 'package:food_flutter/providers/meal_provider.dart';
import 'package:food_flutter/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class MyMealContent extends StatelessWidget {
  const MyMealContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as MyCategoryModel;

    return Selector<MealProvider, List<MealModel>>(
      selector: (_, provider) => provider.meals
          .where((meal) => meal.categories?.contains(category.id) ?? false)
          .toList(),
      shouldRebuild: (prev, next) => !listEquals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(meals[index]),
        );
      },
    );
  }
}
