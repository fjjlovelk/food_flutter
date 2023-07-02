import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter/model/category_model.dart';
import 'package:food_flutter/pages/meal/meal.dart';

class MyCategoryItem extends StatelessWidget {
  final MyCategoryModel _category;

  const MyCategoryItem(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cColor = _category.cColor!;
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: cColor,
          borderRadius: BorderRadius.circular(10.w),
          gradient: LinearGradient(colors: [cColor.withOpacity(0.7), cColor]),
        ),
        alignment: Alignment.center,
        child: Text(
          _category.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(MyMealPage.routerName, arguments: _category);
      },
    );
  }
}
