import 'package:flutter/material.dart';

//This file contains the main theme settings

//Return the ThemeData with Brightness
ThemeData getMainThemeWithBrightness(BuildContext context, Brightness appBrightness) {
  double size = 300;
  try {
    size = MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
  } catch (e) {
    size = 300;
  }

  return ThemeData(
    primaryColor: Colors.deepPurple,
    accentColor: Colors.deepPurpleAccent,
    primaryColorDark: Colors.deepPurple,

    fontFamily: 'Poppins',

    disabledColor: Colors.grey,

    backgroundColor: appBrightness == Brightness.light ? Colors.white : Colors.black,
    scaffoldBackgroundColor: appBrightness == Brightness.light ? Colors.white : Colors.black,

    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity: VisualDensity.adaptivePlatformDensity,

    //Card Theme
    cardColor: appBrightness == Brightness.light ? Colors.white60 : Colors.black54,
    cardTheme: CardTheme(
      color: appBrightness == Brightness.light ? Colors.white60 : Colors.black54,
      elevation: 4,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),

    //Icon Theme
    iconTheme: IconThemeData(
      color: appBrightness == Brightness.light ? Color.fromARGB(255, 51, 72, 84) : Color.fromARGB(255, 178, 191, 202),
      opacity: 1.0,
      size: size * 0.06,
    ),

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      caption: TextStyle(fontFamily: "Poppins", color: appBrightness == Brightness.light ? Colors.black : Colors.white),
      bodyText2: TextStyle(fontFamily: "Poppins", color: appBrightness == Brightness.light ? Colors.black : Colors.white),
      bodyText1: TextStyle(fontFamily: "Poppins", color: appBrightness == Brightness.light ? Colors.black : Colors.white),
      headline4: TextStyle(fontFamily: "Poppins", color: appBrightness == Brightness.light ? Colors.black : Colors.white),
      headline3: TextStyle(fontFamily: "Poppins", color: appBrightness == Brightness.light ? Colors.black : Colors.white),
      headline2: TextStyle(fontFamily: "Poppins", color: appBrightness == Brightness.light ? Colors.black : Colors.white),
      headline1: TextStyle(fontFamily: "Poppins", color: appBrightness == Brightness.light ? Colors.black : Colors.white),
    ),
    primaryTextTheme: appBrightness == Brightness.light
        ? Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.black)
        : Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.white),
    brightness: appBrightness,
  );
}
