import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter/model/meal_model.dart';
import 'package:food_flutter/pages/meal_detail/meal_detail.dart';

class MealItem extends StatelessWidget {
  final MealModel _meal;

  const MealItem(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.w),
        clipBehavior: Clip.hardEdge,
        elevation: 5.w,
        child: Column(
          children: [
            _buildImage(),
            _buildBottom(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(MyMealDetailPage.routerName, arguments: _meal);
      },
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: Image.network(
            _meal.imageUrl ?? '',
            width: double.infinity,
            height: 250.w,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20.w,
          right: 20.w,
          child: Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: Text(
              _meal.title ?? '',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.w),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconAndText(
            const Icon(Icons.access_time_outlined),
            '${_meal.duration ?? '0'}min',
          ),
          _buildIconAndText(
            const Icon(Icons.restaurant),
            _meal.complexStr,
          ),
          _buildIconAndText(
            const Icon(Icons.favorite_border),
            '未收藏',
          ),
        ],
      ),
    );
  }

  Widget _buildIconAndText(Icon icon, String text) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 5.w,
        ),
        Text(text),
      ],
    );
  }
}
