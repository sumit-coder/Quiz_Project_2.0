import 'package:flutter/material.dart';
import 'package:quiz_project_2_0/views/constants/colors.dart';

import '../widgets/max_width_bound_widget.dart';
import 'quiz_types_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: MaxWidthAndHeightBound(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/bgPattern.png',
                  fit: BoxFit.cover,
                  // repeat: ImageRepeat.repeat,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 56, vertical: 18),
                    decoration: BoxDecoration(
                      color: MyColors.buttonLightColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: MyColors.darkBgColor),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizTypesListScreen(),
                          ),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "PLAY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 56, vertical: 8),
                    margin: const EdgeInsets.only(left: 56, right: 56, bottom: 56, top: 12),
                    height: 52,
                    decoration: BoxDecoration(
                      color: MyColors.buttonLightColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: MyColors.darkBgColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          splashRadius: 25,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.store_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const VerticalDivider(width: 1, thickness: 1, color: MyColors.darkBgColor),
                        IconButton(
                          splashRadius: 25,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const VerticalDivider(width: 1, thickness: 1, color: MyColors.darkBgColor),
                        IconButton(
                          splashRadius: 25,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const VerticalDivider(width: 1, thickness: 1, color: MyColors.darkBgColor),
                        IconButton(
                          splashRadius: 25,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
