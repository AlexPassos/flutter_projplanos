import 'package:flutter/material.dart';
import 'package:proj_planos/app/animations/fadeAnimation.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  bool showLogo = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      setState(() {
        showLogo = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                curve: Curves.linear,
                left: showLogo == false ? 0 : -160,
                bottom: showLogo == false ? 0 : 310,
                right: showLogo == false ? 0 : 150,
                top: showLogo == false ? 0 : -170,
                child: Container(
                  child: SizedBox(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              FadeAnimation(
                3,
                Container(
                  padding: EdgeInsets.only(top: SizeConfig.sizeHeight * 60, left: 30, right: 30),
                  child: SizedBox(
                    child: Image.asset("assets/images/logoplanos.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
