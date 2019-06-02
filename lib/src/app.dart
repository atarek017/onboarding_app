import 'package:flutter/material.dart';
import 'package:onboarding_app/src/home.dart';
import 'package:onboarding_app/themes/styles.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'onBoarding Demo',
      theme: appTheme(),
      home: Home(),
    );
  }
}
