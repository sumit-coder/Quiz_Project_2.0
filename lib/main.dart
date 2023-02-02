import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_project_2_0/utility/utility_functions.dart';
import 'package:quiz_project_2_0/views/constants/colors.dart';

import 'views/screens/home_screen.dart';
import 'views/screens/quiz_types/image_with_four_option_quiz/image_with_four_option_quiz.dart';

void main() {
  MyUtility.changeStatusBarColor(newColor: MyColors.backgroundColor);
  MyUtility.changeSystemNavBarColorBarColor(newColor: MyColors.backgroundColor);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Project 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: MyTextColor.textColorDark,
      ),
      home: const HomeScreen(),
      // home: const ImageWithFourOptionsQuiz(),
    );
  }
}
