import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'themes/main_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //Title
      title: 'Extreme Assistant',

      //Main Theme of the app
      theme: getMainThemeWithBrightness(context, Theme.of(context).brightness),

      //Load the home screen
      home: HomeScreen(),
    );
  }
}
