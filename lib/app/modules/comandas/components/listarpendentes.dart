import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class ListarPendentes extends StatefulWidget {
  @override
  _ListarPendentesState createState() => _ListarPendentesState();
}

class _ListarPendentesState extends State<ListarPendentes> {
  @override
  Widget build(BuildContext context) {
    return _listarComanda();
  }

  Widget _listarComanda() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: _cardProdutos(),
          );
        },
      ),
    );
  }

  Widget _cardProdutos() {
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
                      'Refrigerante',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Quant.: 20',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Valor: R\$ 5,00',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
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
                child: IconButton(icon: Icon(Icons.send), onPressed: (){}, color: Cores.segunda,)
              ),
            )
          ],
        ),
      ),
    );
  }
}
