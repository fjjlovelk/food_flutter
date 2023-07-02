import 'package:flutter/material.dart';
import 'package:food_flutter/model/meal_model.dart';
import 'package:food_flutter/services/meal_service.dart';

class MealProvider with ChangeNotifier {
  late List<MealModel> _meals = [];

  List<MealModel> get meals => _meals;

  MealProvider() {
    MealService.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
