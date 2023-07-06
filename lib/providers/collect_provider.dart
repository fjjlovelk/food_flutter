import 'package:flutter/material.dart';
import 'package:food_flutter/model/meal_model.dart';

class CollectProvider extends ChangeNotifier {
  late final List<MealModel> _collect = [];

  List<MealModel> get collect => _collect;

  void addMeal(MealModel meal) {
    _collect.add(meal);
    notifyListeners();
  }

  void deleteMeal(MealModel meal) {
    _collect.remove(meal);
    notifyListeners();
  }

  void handleMeal(MealModel meal) {
    if (_collect.contains(meal)) {
      deleteMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}
