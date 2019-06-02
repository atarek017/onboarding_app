import 'package:flutter/material.dart';
import 'package:onboarding_app/src/widgets/onboard_page.dart';
import 'package:onboarding_app/src/data/onboard_page_data.dart';
import 'package:provider/provider.dart';
import 'package:onboarding_app/src/provider/color_provider.dart';

class OnBoarding extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context);

    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: pageController,
//          physics: NeverScrollableScrollPhysics(),
          itemCount: onboardData.length,
          itemBuilder: (context, index) {
            return OnboardPage(
              pageController: pageController,
              pageModel: onboardData[index],
            );
          },
        ),
        Container(
          width: double.infinity,
          height: 70,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text('fun with',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: colorProvider.color)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Text('skip',
                      style: TextStyle(color: colorProvider.color)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
