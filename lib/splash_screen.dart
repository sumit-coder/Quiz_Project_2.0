import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _heightC = 1000;
  double _widthC = 1000;
  BorderRadius _borderRadius = BorderRadius.circular(0);

  //
  double _topP = 0;
  double _rightP = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      Duration(milliseconds: 500),
      () {
        _borderRadius = BorderRadius.circular(100);

        _heightC = 100;
        _widthC = 100;
        setState(() {});

        Future.delayed(Duration(milliseconds: 700), () {
          setState(() {
            _topP = 400;
            _rightP = 150;
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              left: 0,
              top: _topP,
              right: _rightP,
              bottom: 0,
              child: Center(
                child: AnimatedContainer(
                  height: _heightC,
                  width: _widthC,
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    borderRadius: _borderRadius,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
