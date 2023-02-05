import 'package:flutter/material.dart';
import 'package:quiz_project_2_0/views/constants/colors.dart';
import 'package:quiz_project_2_0/views/screens/quiz_types/true_or_false_quiz/true_or_false_quiz_screen.dart';

import '../rowData.dart';
import 'quiz_types/image_with_four_option_quiz/image_with_four_option_quiz.dart';

class QuizTypesListScreen extends StatelessWidget {
  const QuizTypesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            padding: const EdgeInsets.only(
                left: 18, right: 18, bottom: 18, top: 104),
            itemCount: quizTypes.length,
            itemBuilder: (BuildContext context, int index) {
              return QuizTypeCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrueAndFalsequizScreen(),
                    ),
                  );
                },
                cardBgColorLight:
                    Color(int.parse(quizTypes[index]['colorCodeLight'])),
                cardBgColorDark:
                    Color(int.parse(quizTypes[index]['colorCodeDark'])),
                posterImageUrl: quizTypes[index]['posterImageUrl'],
              );
            },
          ),
        ),
      ),
    );
  }
}

class QuizTypeCard extends StatelessWidget {
  const QuizTypeCard({
    Key? key,
    required this.cardBgColorDark,
    required this.cardBgColorLight,
    required this.posterImageUrl,
    required this.onTap,
  }) : super(key: key);

  final Color cardBgColorDark;
  final Color cardBgColorLight;
  final String posterImageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        // color: MyColors.buttonLightColor,
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(width: 1, color: Colors.white),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              left: 24,
              top: 24,
              child: Material(
                borderRadius: BorderRadius.circular(8),
                color: cardBgColorLight,
                elevation: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: cardBgColorLight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardBgColorDark,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Row(
                children: [
                  Container(
                    // color: Colors.amber,
                    constraints: const BoxConstraints(maxWidth: 208),
                    alignment: Alignment.bottomLeft,
                    child: Image.network(
                      posterImageUrl,
                      // "https://freepngimg.com/download/cartoon/36403-7-cartoon-photos.png",
                      // "https://freepngimg.com/thumb/cartoon/36530-9-cartoon-hd.png",
                      // "https://cdn.pixabay.com/photo/2018/12/03/21/22/cartoon-3854292_1280.png",
                      // "https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png",
                      fit: BoxFit.fitHeight,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
