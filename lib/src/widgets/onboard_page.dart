import 'package:flutter/material.dart';
import '../model/onboard_page_model.dart';
import 'drawer_paint.dart';
import 'package:onboarding_app/src/provider/color_provider.dart';
import 'package:provider/provider.dart';

class OnboardPage extends StatefulWidget {
  final OnboardPageModel pageModel;
  final PageController pageController;

  const OnboardPage({Key key, this.pageController, this.pageModel});

  @override
  State<StatefulWidget> createState() {
    return _OnboardPageState();
  }
}

class _OnboardPageState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> heroAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    heroAnimation = Tween<double>(begin: -40, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));

    animationController.forward(from: 0);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: widget.pageModel.primaryColor,
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                  animation: heroAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(heroAnimation.value, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Image.asset(widget.pageModel.imagePath),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          widget.pageModel.caption,
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  widget.pageModel.accentColor.withOpacity(.8),
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          widget.pageModel.subhead,
                          style: TextStyle(
                              fontSize: 40,
                              color:
                                  widget.pageModel.accentColor.withOpacity(.9),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          widget.pageModel.description,
                          style: TextStyle(
                            fontSize: 18,
                            color: widget.pageModel.accentColor.withOpacity(.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Align(
                alignment: Alignment.centerRight,
                child: CustomPaint(
                  painter: DrawerPaint(
                    curveColor: widget.pageModel.accentColor,
                  ),
                  child: Container(
                    width: heroAnimation.value + 50,
                    height: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: widget.pageModel.primaryColor,
                              size: 32,
                            ),
                            onPressed: _nextButton),
                      ),
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }

  _nextButton() {
    Provider.of<ColorProvider>(context).color =
        widget.pageModel.nextAccentColor;
    widget.pageController.nextPage(
        duration: Duration(
          milliseconds: 500,
        ),
        curve: Curves.fastLinearToSlowEaseIn);
  }
}
