import 'dart:ui';

class MyCategoryModel {
  String? id;
  String? title;
  String? color;
  Color? cColor;

  MyCategoryModel({this.id, this.title, this.color});

  MyCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    final colorInt = int.parse(color!, radix: 16);
    cColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    return data;
  }
}
