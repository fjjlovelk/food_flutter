import 'package:food_flutter/model/meal_model.dart';
import 'package:food_flutter/utils/http_util.dart';

class MealService {
  static Future<List<MealModel>> getMealData() async {
    final result = await HttpUtil.get('/meal');
    final mealArray = result['meal'];
    List<MealModel> meals = [];
    for (var json in mealArray) {
      meals.add(MealModel.fromJson(json));
    }
    return meals;
  }
}
