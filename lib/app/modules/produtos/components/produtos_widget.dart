import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj_planos/app/components/textoField/textoField_widget.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class ProdutosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  flex: 1,
                  child: TextoFieldWidget(
                    text: "Código",
                    keyboardType: TextInputType.number,
                    cor: Cores.primeira,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: TextoFieldWidget(
                    text: "Descrição",
                    cor: Cores.primeira,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: _listarProdutos(),
        ));
  }

  Widget _listarProdutos() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: cardProdutos(),
        );
      },
    );
  }

  Widget cardProdutos() {
    return Card(
      margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
      elevation: 2,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cód.: 000',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Refrigerante',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                child: Text(
                  'R\$ 5,00',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
