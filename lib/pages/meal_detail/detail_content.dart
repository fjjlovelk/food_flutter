import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter/model/meal_model.dart';

class MealDetailContent extends StatelessWidget {
  final MealModel _meal;

  const MealDetailContent(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBannerImage(),
          SizedBox(height: 10.w),
          _buildMakeMaterial(context),
          SizedBox(height: 10.w),
          _buildMakeSteps(context),
          SizedBox(height: 20.w),
        ],
      ),
    );
  }

  // 图片
  Widget _buildBannerImage() {
    return Image.network(
      _meal.imageUrl ?? '',
      width: double.infinity,
    );
  }

  // 制作材料
  Widget _buildMakeMaterial(context) {
    return Column(
      children: [
        Text("制作材料", style: Theme.of(context).textTheme.headlineSmall),
        Container(
          width: MediaQuery.of(context).size.width - 30.w,
          padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 0),
          margin: EdgeInsets.only(top: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.w),
            color: Colors.white,
          ),
          child: Column(
            children: (_meal.ingredients ?? [])
                .map((e) => _buildMaterialItem(e, context))
                .toList(),
          ),
        )
      ],
    );
  }

  // 材料item
  Widget _buildMaterialItem(String text, context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.w),
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: Colors.yellow,
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  // 步骤
  Widget _buildMakeSteps(context) {
    return Column(
      children: [
        Text("步骤", style: Theme.of(context).textTheme.headlineSmall),
        Container(
          width: MediaQuery.of(context).size.width - 30.w,
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.only(top: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.w),
            color: Colors.white,
          ),
          child: Column(
            children: (_meal.steps ?? [])
                .asMap()
                .entries
                .map(
                  (e) => _buildStepItem(
                    e.value,
                    e.key,
                    e.key != _meal.steps!.length - 1,
                    context,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  // 材料item
  Widget _buildStepItem(String text, int index, bool showDivider, context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.8),
                child: Text(
                  '${index + 1}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
          if (showDivider) Divider(thickness: 0.4.w)
        ],
      ),
    );
  }
}
