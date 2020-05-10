import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

import 'components/mesas_widget.dart';

class MesasPage extends StatefulWidget {

  @override
  _MesasPageState createState() => _MesasPageState();
}

class _MesasPageState extends State<MesasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
         backgroundColor: Cores.primeira,
          elevation: 0,
            bottom: PreferredSize(
            child: Container(
              padding: EdgeInsets.all(5),
            ),
            preferredSize: Size.fromHeight(0),
          ),
      ),
      body: MesasWidget()
    );
  }
}
