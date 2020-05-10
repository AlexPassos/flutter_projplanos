import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class CircleMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-70.0, -40.0),
      child: Material(
        color: Cores.primeira.withOpacity(0.3),
        child: Padding(padding: EdgeInsets.all(80)),
        shape: CircleBorder(side: BorderSide(color:Cores.primeira, width: 0.0)),
      ),
    );
  }
}