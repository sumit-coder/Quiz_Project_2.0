import 'dart:developer';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../rowData.dart';
import '../../../widgets/max_width_bound_widget.dart';
import 'quiz_end_screen.dart';

class ImageWithFourOptionsQuiz extends StatefulWidget {
  const ImageWithFourOptionsQuiz({Key? key}) : super(key: key);

  @override
  State<ImageWithFourOptionsQuiz> createState() => _ImageWithFourOptionsQuizState();
}

class _ImageWithFourOptionsQuizState extends State<ImageWithFourOptionsQuiz> {
  int? selectedOptiionIndex;
  int currentQuestionIndex = 0;
  List<Map> selectedAnswersOfTheQuestions = [];

  // For Each Question Change
  bool isNextButtonDisabled = true;

  ///this Function for Reseting all selected
  void resetAll() {
    selectedOptiionIndex = null;
    currentQuestionIndex = 0;
    isNextButtonDisabled = true;
    // set answers to empty in case use come back form
    // quiz end screen
    Future.delayed(const Duration(seconds: 2), () {
      selectedAnswersOfTheQuestions = [];
    });
    setState(() {});
  }

  /// This function will check if selected option is right answer
  void checkSelectedAnswerAndSetValues() {
    // rowData[currentQuestionIndex].options

    if (rowData[currentQuestionIndex].currectAnswer ==
        rowData[currentQuestionIndex].options[selectedOptiionIndex ?? 0]) {
      log("this is right");

      // when answer is right
      selectedAnswersOfTheQuestions.add(
        {
          "q-id": currentQuestionIndex.toString(),
          "answer-result": true,
          "selected-option-index": selectedOptiionIndex,
        },
      );
    } else {
      // when answer is wrong
      selectedAnswersOfTheQuestions.add(
        {
          "q-id": currentQuestionIndex.toString(),
          "answer-result": false,
          "selected-option-index": selectedOptiionIndex,
        },
      );
    }
  }

  /// This function will set active to taped answer option
  void setActiveSelectedOption({required int optionIndex}) {
    // only if any option is allready not selected
    if (selectedOptiionIndex == null) {
      selectedOptiionIndex = optionIndex;
      isNextButtonDisabled = false;
      checkSelectedAnswerAndSetValues();
      setState(() {});
    }
  }

  /// On Tap next Button
  void onTapNexButton() {
    if (currentQuestionIndex < rowData.length - 1) {
      currentQuestionIndex++;
    } else {
      // print('last aswer');
      // when current question is last question and submited the option
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizEndScren(listOfAnswers: selectedAnswersOfTheQuestions),
        ),
      );
      resetAll();

      return;
    }
    // make this button disable after send to next question
    isNextButtonDisabled = true;
    // Clear selected answer option for next question
    selectedOptiionIndex = null;

    // setState
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 64,
        backgroundColor: MyColors.buttonColor,
        leading: const SizedBox(),
        flexibleSpace: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 18,
            right: 18,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.abc,
                    color: MyColors.primaryColor,
                    size: 32,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Science and Nature',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: MaxWidthAndHeightBound(
          child: Column(
            children: [
              // question number and timer
              Container(
                // color: Colors.red,
                // constraints: const BoxConstraints(minHeight: 220),
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quiz: ${rowData.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          '03:00 min',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Divider(height: 1, thickness: 1, color: Colors.white),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 18, right: 18),
                constraints: const BoxConstraints(maxWidth: 400),
                // height: 200,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '${currentQuestionIndex + 1}. ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: rowData[currentQuestionIndex].question,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      QuestionOptionCard(
                        optionTitle: rowData[currentQuestionIndex].options[0],
                        isSelected: selectedOptiionIndex == 0 ? true : false,
                        onTapOption: () {
                          setActiveSelectedOption(optionIndex: 0);
                        },
                      ),
                      QuestionOptionCard(
                        optionTitle: rowData[currentQuestionIndex].options[1],
                        isSelected: selectedOptiionIndex == 1 ? true : false,
                        onTapOption: () {
                          setActiveSelectedOption(optionIndex: 1);
                        },
                      ),
                      QuestionOptionCard(
                        optionTitle: rowData[currentQuestionIndex].options[2],
                        isSelected: selectedOptiionIndex == 2 ? true : false,
                        onTapOption: () {
                          setActiveSelectedOption(optionIndex: 2);
                        },
                      ),
                      QuestionOptionCard(
                        optionTitle: rowData[currentQuestionIndex].options[3],
                        isSelected: selectedOptiionIndex == 3 ? true : false,
                        onTapOption: () {
                          setActiveSelectedOption(optionIndex: 3);
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),

              BigButton(
                buttonColor: MyColors.primaryColor,
                buttonTitle: rowData.length - 1 == currentQuestionIndex ? "Submit" : 'Next',
                // if it's last question then show "Submit" else show "Next"
                isDisabled: isNextButtonDisabled,
                onTapButton: onTapNexButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionOptionCard extends StatelessWidget {
  const QuestionOptionCard({
    Key? key,
    required this.isSelected,
    required this.onTapOption,
    required this.optionTitle,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTapOption;
  final String optionTitle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 62,
      margin: const EdgeInsets.only(bottom: 12),
      constraints: const BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: isSelected ? MyColors.primaryColor : MyColors.cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      duration: const Duration(milliseconds: 300),
      // alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTapOption,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedPositioned(
              left: isSelected ? null : 0,
              bottom: 0,
              top: 0,
              right: isSelected ? 0 : null,
              duration: const Duration(milliseconds: 1000),
              child: CircleAvatar(
                radius: 23,
                backgroundColor: isSelected ? MyColors.cardColor : MyColors.primaryColor,
                child: isSelected
                    ? const Icon(
                        Icons.clear_rounded,
                        size: 28,
                        color: MyColors.primaryColor,
                      )
                    : Text(
                        'A',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: isSelected ? MyColors.backgroundColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
            // const SizedBox(width: 24),
            AnimatedPositioned(
              top: 0,
              left: 58,
              // right: 0,
              bottom: 0,
              duration: const Duration(milliseconds: 500),
              child: Center(
                child: Text(
                  optionTitle,
                  style: const TextStyle(
                    color: MyColors.backgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigButton extends StatelessWidget {
  BigButton({
    Key? key,
    required this.buttonTitle,
    required this.onTapButton,
    required this.buttonColor,
    this.buttonTitleColor,
    this.isDisabled,
  }) : super(key: key);

  final String buttonTitle;
  final VoidCallback onTapButton;
  final Color buttonColor;
  Color? buttonTitleColor;
  bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: isDisabled == true ? const Color.fromARGB(255, 185, 103, 35) : buttonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: isDisabled == true ? null : onTapButton,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: buttonTitleColor ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
