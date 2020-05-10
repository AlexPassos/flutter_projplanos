import 'package:flutter/material.dart';
import 'package:proj_planos/app/components/botao/botao_widget.dart';
import 'package:proj_planos/app/components/painel/slidepainel.dart';
import 'package:proj_planos/app/components/textoField/textoField_widget.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

import 'listarpendentes.dart';

class ComandasWidget extends StatefulWidget {
  @override
  _ComandasWidgetState createState() => _ComandasWidgetState();
}

class _ComandasWidgetState extends State<ComandasWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Cores.branco,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Cores.branco,
          elevation: 0,
          centerTitle: true,
          title: Container(
            height: 60,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextoFieldWidget(
                    text: "Número da mesa",
                    keyboardType: TextInputType.number,
                    cor: Cores.primeira,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                BotaoWidget(
                  width: 40,
                  height: 40,
                  visivelIcon: true,
                  icon: Icons.search,
                  sizeIcon: 3,
                  cor: Cores.primeira,
                  visivelText: false,
                  text: "",
                  click: () {},
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _listarMesas(),
              ],
            ),
          ),
        ));
  }

  Widget _listarMesas() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: cardMesas(),
        );
      },
    );
  }

  Widget cardMesas() {
    return InkWell(
      onTap: () {
        SlidePainel.showPainel(context, 'Pendentes', ListarPendentes(), scroll: false);
      },
      child: Card(
        margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        elevation: 2,
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Mesa 001',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: 2,
                  height: 40,
                  color: Cores.segunda,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Status',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Pendentes',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
