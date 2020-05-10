import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';

import 'circlepink.dart';
import 'circleyellow.dart';
import 'wavyfooter.dart';
import 'wavyheader.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              
              WavyHeader(),
              Positioned(
                left: SizeConfig.sizeHeight * 38.5,
                bottom: 0,
                right: -SizeConfig.sizeHeight * 52,
                top: -SizeConfig.sizeHeight * 38.5,
                child: Container(
                  child: SizedBox(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),

          Expanded(
            flex: 2,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  WavyFooter(),
                  CirclePink(),
                  CircleYellow(),
                ],
              ),
            ),
          ),

       
        ],
      ),
    );
  }
}
