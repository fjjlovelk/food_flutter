import 'dart:convert';

List<String> complexStrList = ['简单', '中等', '复杂'];

class MealModel {
  String? id;
  List<String>? categories;
  String? title;
  int? affordability;
  int? complexity;
  String complexStr;
  String? imageUrl;
  int? duration;
  List<String>? ingredients;
  List<String>? steps;
  bool? isGlutenFree;
  bool? isVegan;
  bool? isVegetarian;
  bool? isLactoseFree;

  MealModel({
    this.id,
    this.categories,
    this.title,
    this.affordability,
    this.complexity,
    required this.complexStr,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
  });

  factory MealModel.fromRawJson(String str) =>
      MealModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        id: json["id"],
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        title: json["title"],
        affordability: json["affordability"],
        complexity: json["complexity"],
        complexStr: json["complexity"] == null
            ? '无'
            : complexStrList[json["complexity"]],
        imageUrl: json["imageUrl"],
        duration: json["duration"],
        ingredients: json["ingredients"] == null
            ? []
            : List<String>.from(json["ingredients"]!.map((x) => x)),
        steps: json["steps"] == null
            ? []
            : List<String>.from(json["steps"]!.map((x) => x)),
        isGlutenFree: json["isGlutenFree"],
        isVegan: json["isVegan"],
        isVegetarian: json["isVegetarian"],
        isLactoseFree: json["isLactoseFree"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "title": title,
        "affordability": affordability,
        "complexity": complexity,
        "imageUrl": imageUrl,
        "duration": duration,
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x)),
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x)),
        "isGlutenFree": isGlutenFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
        "isLactoseFree": isLactoseFree,
      };
}
