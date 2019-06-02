import 'package:flutter/material.dart';
import 'package:onboarding_app/src/provider/color_provider.dart';
import 'package:onboarding_app/src/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      builder: (context) => ColorProvider(),
      child: OnBoarding(),
    ));
  }
}
