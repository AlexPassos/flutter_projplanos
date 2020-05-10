import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:proj_planos/app/components/painel/slidepainel.dart';
import 'package:proj_planos/app/modules/addprodutos/addprodutos_page.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'hometopo.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      children: <Widget>[
        Scaffold(
          body: AnimationLimiter(
            child: ListView.builder(
              padding:
                  EdgeInsets.only(top: 180, bottom: 30, left: 5, right: 5),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Slidable(
                        key: ValueKey(index),
                        actionPane: SlidableDrawerActionPane(),
                        
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Fechar',
                            color: Cores.primeira,
                            icon: Icons.attach_money,
                            onTap: (){
                              SlidePainel.showPainel(context, 'Fechar mesa', Text('Fechar mesa'));
                            },
                          ),
                          IconSlideAction(
                            caption: 'Mais',
                            color: Colors.grey.shade200,
                            icon: Icons.more_horiz,
                            onTap: () {
                              SlidePainel.showPainel(context, 'Opções', Text('Opções mesa'));
                            },
                          ),
                        ],
                        // secondaryActions: <Widget>[
                        //   IconSlideAction(
                        //     caption: 'Mais',
                        //     color: Colors.grey.shade200,
                        //     icon: Icons.more_horiz,
                        //      onTap: (){
                        //       SlidePainel.showPainel(context, 'Opções', Text('Opções mesa'));
                        //     },
                        //   ),
                        //   IconSlideAction(
                        //     caption: 'Fechar',
                        //     color: Cores.primeira,
                        //     icon: Icons.attach_money,
                        //      onTap: () {
                              
                        //       SlidePainel.showPainel(context, 'Fechar mesa', Text('Fechar mesa'));
                        //     },
                        //   ),
                        // ],
                        dismissal: SlidableDismissal(
                          child: SlidableDrawerDismissal(),
                       
                        ),
                        child: ListTile(
                          title: cardItem(index + 1),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        HomeTopo(),
      ],
    );
  }

  Widget cardItem(int mesa) {
    return InkWell(
          onTap: (){
            Modular.to.pushNamed('/mesas');
          },
          child: Card(
            margin: EdgeInsets.only(top: 0, bottom: 0),
          elevation: 2,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                width: 50,
                height: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.2, 1],
                      colors: _degradeMesa(mesa.toString())),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Center(
                    child: Text(
                  '${mesa.toString().padLeft(3, '0')}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Cliente: Marcos Santos',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Total: R\$ 1.250,00',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 20,
                      onPressed: () {
                        SlidePainel.showPainel(context, 'Adicionar produtos', AddprodutosPage(), scroll: false);
                      },
                    ),
                    Container(
                      child: Text("G: 1,2", 
                      style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  List<Color> _degradeMesa(String opcao) {
    List<Color> lista = List();

    switch (opcao) {
      case "1":
        lista = [Cores.verdeclaro, Cores.verdeescuro];
        break;
      case "2":
        lista = [Cores.azulclaro, Cores.azulmarinho];
        break;
      case "3":
        lista = [Cores.vermelho, Cores.vermelhoescuro];
        break;
      default:
        //lista = [Cores.branco, Cores.cinzaclaro];
        lista = [Cores.verdeclaro, Cores.verdeescuro];
    }

    return lista;
  }
}
