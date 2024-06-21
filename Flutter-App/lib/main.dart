import 'package:flutter/material.dart';
import 'screens/Routes.dart';
import 'theme/color.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      home: const RootApp(),
    );
  }
}
