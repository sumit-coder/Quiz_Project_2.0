import 'package:flutter/services.dart';

class MyUtility {
  /// To change status bar color
  static changeStatusBarColor({required Color newColor}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: newColor,
      ),
    );
  }

  /// To systemNavigationBarColor background color
  static changeSystemNavBarColorBarColor({required Color newColor}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: newColor,
      ),
    );
  }
}
