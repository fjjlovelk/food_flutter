import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_flutter/model/category_model.dart';

class CategoryService {
  static Future<List<MyCategoryModel>> getCategoryJson() async {
    // 1、读取json文件
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    // 2、将jsonString转成Map/List
    final result = json.decode(jsonString);
    // 3、取出list
    final resultList = result['category'];
    List<MyCategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(MyCategoryModel.fromJson(json));
    }
    return categories;
  }
}
