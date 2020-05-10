import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class SlidePainel {
  static showPainel(BuildContext context, String topoTitulo, Widget conteudo,
      {bool scroll = true, double altura = 70}) {
    SizeConfig().init(context);
    showModalBottomSheet(
        context: context,
        elevation: 0,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              height: MediaQuery.of(context).size.height - altura,
              decoration: BoxDecoration(
                  color: Cores.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: _topoTitulo(context, topoTitulo),
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: Icon(Icons.close),
                    iconSize: SizeConfig.sizeHeight * 2.5,
                    color: Cores.cinzaescuro,
                    onPressed: () {
                      Navigator.pop(context, "");
                    },
                  ),
                  backgroundColor: Cores.branco,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                ),
                body: Container(
                  color: Cores.branco,
                  height: double.infinity,
                  width: double.infinity,
                  child: scroll == true
                      ? SingleChildScrollView(
                          child: conteudo,
                        )
                      : conteudo,
                ),
                bottomNavigationBar: BottomAppBar(
                  elevation: 0,
                  child: Container(
                    color: Cores.branco,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[_base(context)],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  // static final _linhaDividir = Container(
  //   height: 1,
  //   color: Colors.grey.shade300,
  // );

  static Widget _topoTitulo(BuildContext context, String titulo) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Text(titulo,
                style: TextStyle(
                    fontSize: SizeConfig.sizeHeight * 2.5,
                    color: Cores.cinzaescuro,
                    fontWeight: FontWeight.w500)),
          ),
        )
      ],
    );
  }

  static Widget _base(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _botaoNegacao(
            context,
            'Fechar',
          ),
        ],
      ),
    );
  }

  static Widget _botaoNegacao(BuildContext context, String texto, {Icon icon}) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
    );

    final vIcon = icon == null
        ? Container(
            width: 0,
          )
        : icon;
    final vEspaco = icon == null
        ? Container(
            width: 0,
          )
        : SizedBox(width: 10);

    final textStyle = TextStyle(
      color: Cores.cinzaescuro,
      fontSize: SizeConfig.sizeHeight * 2.5,
    );

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        vIcon,
        vEspaco,
        Text(
          texto,
          style: textStyle,
        ),
      ],
    );

    _onTap() {
      Navigator.pop(context, "");
    }

    return Container(
        width: 130,
        height: 30,
        alignment: Alignment.center,
        child: SizedBox.expand(
          child: RaisedButton(
            color: Cores.branco,
            onPressed: _onTap,
            elevation: 0,
            child: child,
            shape: shape,
          ),
        ));
  }
} //fim classe
