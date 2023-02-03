import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../rowData.dart';

class ImageWithFourOptionsQuiz extends StatefulWidget {
  const ImageWithFourOptionsQuiz({Key? key}) : super(key: key);

  @override
  State<ImageWithFourOptionsQuiz> createState() => _ImageWithFourOptionsQuizState();
}

class _ImageWithFourOptionsQuizState extends State<ImageWithFourOptionsQuiz> {
  int? selectedOptiionIndex;
  int currentQuestionIndex = 0;

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
        child: Column(
          children: [
            // question number and timer
            Container(
              constraints: const BoxConstraints(minHeight: 220),
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
                  const SizedBox(height: 24),
                  Container(
                    alignment: Alignment.topLeft,
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
                            text: rowData[currentQuestionIndex]['question'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    QuestionOptionCard(
                      optionTitle: rowData[currentQuestionIndex]["options"][0],
                      isSelected: selectedOptiionIndex == 0 ? true : false,
                      onTapOption: () {
                        setState(() {
                          selectedOptiionIndex = 0;
                        });
                      },
                    ),
                    QuestionOptionCard(
                      optionTitle: rowData[currentQuestionIndex]["options"][1],
                      isSelected: selectedOptiionIndex == 1 ? true : false,
                      onTapOption: () {
                        setState(() {
                          selectedOptiionIndex = 1;
                        });
                      },
                    ),
                    QuestionOptionCard(
                      optionTitle: rowData[currentQuestionIndex]["options"][2],
                      isSelected: selectedOptiionIndex == 2 ? true : false,
                      onTapOption: () {
                        setState(() {
                          selectedOptiionIndex = 2;
                        });
                      },
                    ),
                    QuestionOptionCard(
                      optionTitle: rowData[currentQuestionIndex]["options"][3],
                      isSelected: selectedOptiionIndex == 3 ? true : false,
                      onTapOption: () {
                        setState(() {
                          selectedOptiionIndex = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            BigButton(
              buttonColor: MyColors.primaryColor,
              buttonTitle: 'Submit',
              onTapButton: () {
                if (currentQuestionIndex < rowData.length - 1) {
                  setState(() {
                    currentQuestionIndex++;
                  });
                } else {}
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const QuizEndScreen(),
                //   ),
                // );
              },
            ),
          ],
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
      child:
          // isSelected
          // ? Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         children: [
          //           const SizedBox(width: 24 + 48),
          //           Text(
          //             optionTitle,
          //             style: const TextStyle(
          //               color: Colors.white,
          //               fontSize: 18,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         ],
          //       ),
          //       InkWell(
          //         onTap: onTapOption,
          //         child: const CircleAvatar(
          //           radius: 23,
          //           backgroundColor: MyColors.cardColor,
          //           child: Icon(
          //             Icons.clear_rounded,
          //             size: 28,
          //             color: MyColors.primaryColor,
          //           ),
          //         ),
          //       ),
          //     ],
          //   )
          // :
          InkWell(
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
              duration: Duration(milliseconds: 1000),
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
              duration: Duration(milliseconds: 500),
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
  }) : super(key: key);

  final String buttonTitle;
  final VoidCallback onTapButton;
  final Color buttonColor;
  Color? buttonTitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTapButton,
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
