import 'dart:async';

import 'package:flutter/material.dart';

class TimeCounter extends StatefulWidget {
  TimeCounter({Key? key}) : super(key: key);

  @override
  State<TimeCounter> createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // timeer();
  }

  // int counter = 5;
  // timeer() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     print(timer.tick);
  //     counter--;
  //     if (counter == 0) {
  //       print('Cancel timer');
  //       timer.cancel();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        ' {}:00:00',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
