import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';


class ConfirmacaoPainel {
  mainBottomSheet(BuildContext context, String topoTitulo, String textoPergunta,
      Function fnConfirmacao) {
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _topoTitulo(context, topoTitulo),
                  linhaDividir,
                  _textoPergunta(textoPergunta),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _botaoConfirmacao(context, fnConfirmacao, 'Sim',
                            icon: Icon(
                              Icons.check,
                              color: Cores.branco,
                            )),
                        SizedBox(width: 10),
                        _botaoNegacao(context, 'Não',
                            icon: Icon(
                              Icons.close,
                              color: Cores.branco,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  final linhaDividir = Container(
    height: 1,
    color: Colors.grey.shade300,
  );

  Widget _topoTitulo(BuildContext context, String titulo) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context, "");
          },
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Text(titulo,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        )
      ],
    );
  }

  Widget _textoPergunta(String texto) {
    return Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          texto,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ));
  }

  Widget _botaoConfirmacao(BuildContext context, Function onTap, String texto,
      {Icon icon}) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
    );

    final vIcon = icon == null ? Container() : icon;

    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        vIcon,
        SizedBox(width: 10),
        Text(
          texto,
          style: textStyle,
        ),
      ],
    );

    return Container(
        width: 130,
        height: 40,
        alignment: Alignment.center,
        child: SizedBox.expand(
          child: RaisedButton(
            color: Cores.segunda,
            onPressed: () {
              onTap();

              Fluttertoast.showToast(
                  msg: "Operação realizada com sucesso!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 2,
                  backgroundColor: Cores.cinzaescuro,
                  textColor: Colors.white,
                  fontSize: 16.0);

              Navigator.pop(context, "");
            },
            elevation: 2,
            child: child,
            shape: shape,
          ),
        ));
  }

  Widget _botaoNegacao(BuildContext context, String texto, {Icon icon}) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
    );

    final vIcon = icon == null ? Container() : icon;

    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        vIcon,
        SizedBox(width: 10),
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
        height: 40,
        alignment: Alignment.center,
        child: SizedBox.expand(
          child: RaisedButton(
            color: Cores.segunda,
            onPressed: _onTap,
            elevation: 2,
            child: child,
            shape: shape,
          ),
        ));
  }
} //fim classe
