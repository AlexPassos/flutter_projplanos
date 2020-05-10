import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proj_planos/app/animations/fadeAnimation.dart';
import 'package:proj_planos/app/components/botao/botao_widget.dart';
import 'package:proj_planos/app/components/textoField/textoField_widget.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNodeSenha = FocusNode();
  String op = "user";

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print("focu");
      } else {
        print("perdeu");
      }
    });

    _focusNodeSenha.addListener(() {
      if (_focusNodeSenha.hasFocus) {
        print("focu senha");
      } else {
        print("perdeu senha");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.sizeHeight * 12,
          ),
          FadeAnimation(
            2.4,
            Container(
              child: SizedBox(
                width: SizeConfig.sizeHeight * 55,
                child: Image.asset("assets/images/logoplanos.png"),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.sizeHeight * 8,
          ),
          TextoFieldWidget(
            focusNode: _focusNode,
            text: "Usuário",
            cor: Cores.primeira,
            onChanged: (value) {
              setState(() {
                op = value;
              });
            },
          ),
          SizedBox(
            height: SizeConfig.sizeHeight * 3,
          ),
          TextoFieldWidget(
            focusNode: _focusNodeSenha,
            text: "Senha",
            cor: Cores.primeira,
            obscureText: true,
          ),
          SizedBox(
            height: SizeConfig.sizeHeight * 3,
          ),
          BotaoWidget(
            width: double.infinity,
            height: SizeConfig.sizeHeight * 10,
            visivelIcon: true,
            icon: Icons.arrow_forward,
            cor: Cores.primeira,
            text: "ENTRAR",
            click: () {
              if (op == 'user') {
                Modular.to.pushReplacementNamed('/home');
              } else if (op == 'admin') {
                Modular.to.pushNamed('/admin');
              }
            
            },
          ),
        ],
      ),
    );
  }
}
