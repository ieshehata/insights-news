import 'package:flutter/material.dart';

import 'core/app_color.dart';
import 'feature/splash/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insights News',
      theme: ThemeData(scaffoldBackgroundColor: AppColor.backgroundColor,),
      home: const SplashView(),
    );
  }
}


