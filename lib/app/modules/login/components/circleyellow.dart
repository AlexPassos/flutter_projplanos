import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class CircleYellow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, 210.0),
      child: Material(
        color: Cores.vermelhoescuro,
        child: Padding(padding: EdgeInsets.all(140)),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 5.0)),
      ),
    );
  }
}