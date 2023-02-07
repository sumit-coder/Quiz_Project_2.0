import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';

class TimeCounter extends StatefulWidget {
  TimeCounter({Key? key}) : super(key: key);

  @override
  State<TimeCounter> createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
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
