import 'package:flutter/material.dart';

class MaxWidthAndHeightBound extends StatelessWidget {
  const MaxWidthAndHeightBound({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 380),
          child: child,
        ),
      ],
    );
  }
}
