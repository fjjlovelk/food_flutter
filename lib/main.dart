import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter/providers/meal_provider.dart';
import 'package:food_flutter/router/router.dart';
import 'package:food_flutter/shared/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MealProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //填入设计稿中设备的屏幕尺寸,单位dp
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: '美食广场',
          theme: MyAppTheme.brightTheme,
          darkTheme: MyAppTheme.darkTheme,
          routes: MyRouter.routes,
          initialRoute: MyRouter.initialRoute,
          onUnknownRoute: MyRouter.unknownRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
