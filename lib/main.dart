import 'package:flutter/material.dart';

import 'views/screen/sell_course/sell_course_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SellCourseScreen(),
    );
  }
}
