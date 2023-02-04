import 'package:flutter/material.dart';

class QuizEndScren extends StatelessWidget {
  const QuizEndScren({Key? key, required this.listOfAnswers}) : super(key: key);

  final List<Map> listOfAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Quiz End Screen ' + listOfAnswers.length.toString()),
            ListView.builder(
              padding: const EdgeInsets.all(28),
              itemCount: listOfAnswers.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${index + 1}'),
                    listOfAnswers[index]["answer-result"] == true
                        ? Icon(Icons.check_rounded, color: Colors.green)
                        : Icon(Icons.clear_rounded, color: Colors.red),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
