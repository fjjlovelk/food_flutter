import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter/model/category_model.dart';
import 'package:food_flutter/pages/home/category_item.dart';
import 'package:food_flutter/services/category_service.dart';

class MyHomeContent extends StatelessWidget {
  const MyHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyCategoryModel>>(
        future: CategoryService.getCategoryJson(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('数据加载失败'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final categories = snapshot.data;
          return GridView.builder(
              padding: EdgeInsets.all(20.w),
              itemCount: categories?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 20.w,
                  crossAxisSpacing: 20.w),
              itemBuilder: (BuildContext context, int index) =>
                  MyCategoryItem(categories![index]));
        });
  }
}
