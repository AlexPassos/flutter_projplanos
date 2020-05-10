import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class CirclePink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-70.0, 90.0),
      child: Material(
        color: Cores.primeira,
        child: Padding(padding: EdgeInsets.all(100)),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 5.0)),
      ),
    );
  }
}