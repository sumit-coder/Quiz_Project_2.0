import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_project_2_0/views/constants/colors.dart';
import 'package:quiz_project_2_0/views/rowData.dart';

class TrueAndFalsequizScreen extends StatefulWidget {
  const TrueAndFalsequizScreen({super.key});

  @override
  State<TrueAndFalsequizScreen> createState() => _TrueAndFalsequizScreenState();
}

class _TrueAndFalsequizScreenState extends State<TrueAndFalsequizScreen> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.buttonColor,
        elevation: 2,
        toolbarHeight: 64,
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
                    "True & False",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(minHeight: 220),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Question: ${rowData.length}",
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
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
              ),
              const SizedBox(height: 24),
              Container(
                width: 400,
                height: 350,
                // color: Colors.red,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                alignment: Alignment.center,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TrueFalseOptionCard(
                        isSelected: selectedOptionIndex == 0 ? true : false,
                        onTapOption: () {
                          setState(() {
                            selectedOptionIndex = 0;
                          });
                        },
                        optionTitle: "True",
                        buttonBackgroundColor: Colors.green,
                      ),
                      const SizedBox(width: 20),
                      TrueFalseOptionCard(
                        isSelected: selectedOptionIndex == 1 ? true : false,
                        onTapOption: () {
                          setState(() {
                            selectedOptionIndex = 1;
                          });
                        },
                        optionTitle: "False",
                        buttonBackgroundColor: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrueFalseOptionCard extends StatefulWidget {
  const TrueFalseOptionCard({
    Key? key,
    required this.isSelected,
    required this.onTapOption,
    required this.optionTitle,
    required this.buttonBackgroundColor,
  });

  final bool isSelected;
  final VoidCallback onTapOption;
  final String optionTitle;
  final Color buttonBackgroundColor;

  @override
  State<TrueFalseOptionCard> createState() => _TrueFalseOptionCardState();
}

class _TrueFalseOptionCardState extends State<TrueFalseOptionCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: InkWell(
        onTap: widget.onTapOption,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 150,
              height: 150,
              color: widget.buttonBackgroundColor,
              child: Text(
                widget.optionTitle,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
