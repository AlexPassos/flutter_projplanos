import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class MenuDireito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: SizedBox(
                        width: SizeConfig.sizeHeight * 55,
                        child: Image.asset("assets/images/logoplanos.png"),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Cores.segunda,
                  ),
                ),
                ListTile(
                  title: Text('Dados de configuração'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Configurar IP'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Sincronizar banco de dados'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Limpar banco de dados'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Container(
              // This align moves the children to the bottom
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Sair'),
                        onTap: () {
                          Modular.to.pushReplacementNamed('/');
                        },
                      ),
                    ],
                  ))))
        ],
      ),
    );
  }
}
