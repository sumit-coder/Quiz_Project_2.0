import 'package:flutter/material.dart';
import 'package:quiz_project_2_0/views/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 56, vertical: 18),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 42, 49, 75),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.white)),
              child: InkWell(
                onTap: () {},
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
              margin: const EdgeInsets.only(left: 56, right: 56, bottom: 56),
              height: 52,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 42, 49, 75),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const VerticalDivider(width: 1, thickness: 1, color: Colors.white),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const VerticalDivider(width: 1, thickness: 1, color: Colors.white),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const VerticalDivider(width: 1, thickness: 1, color: Colors.white),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
