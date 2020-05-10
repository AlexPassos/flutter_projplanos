import 'package:flutter/material.dart';
import 'package:proj_planos/app/modules/login/components/background.dart';
import 'package:proj_planos/app/modules/login/components/login_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        overflow: Overflow.clip,
        children: <Widget>[
          Background(),
          LoginWidget(),
        ],
      ),
    );
  }
}
