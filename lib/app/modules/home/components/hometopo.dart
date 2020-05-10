import 'package:flutter/material.dart';
import 'package:proj_planos/app/components/clipPath/cliphome.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

import 'circlemenu.dart';

class HomeTopo extends StatefulWidget {
  @override
  _HomeTopoState createState() => _HomeTopoState();
}

class _HomeTopoState extends State<HomeTopo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: ClipHome(),
          child: Container(
            width: double.infinity,
            height: 280,
            color: Cores.primeira,
          ),
        ),

        Container(
          height: 150,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Garçom:',
                style: TextStyle(fontSize: 14, color: Cores.branco),
              ),
              Text(
                'Fulano da Silva',
                style: TextStyle(fontSize: 18, color: Cores.branco),
              ),
              Text(
                'Acesso: Data 11/02/2010 - Hora 20:23',
                style: TextStyle(fontSize: 14, color: Cores.branco),
              ),
            ],
          ),
        )

        //CircleMenu(),
      ],
    );
  }
}


