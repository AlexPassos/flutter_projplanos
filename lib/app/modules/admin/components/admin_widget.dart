import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:proj_planos/app/components/botao/botao_widget.dart';
import 'package:proj_planos/app/components/clipPath/cliptopo.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class AdminWidget extends StatefulWidget {
  @override
  _AdminWidgetState createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: ClipTopo(),
          child: Container(
            width: double.infinity,
            height: 230,
            color: Cores.segunda,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 200, left: 30, right: 30),
          child: Center(
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(seconds: 1),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [_botoes()],
                ),
              ),
            ),
          ),
        )

        
      ],
    );
  }

  Widget _botoes() {
    return Column(
      children: <Widget>[
        BotaoWidget(
          width: double.infinity,
          height: SizeConfig.sizeHeight * 10,
          visivelIcon: false,
          cor: Cores.primeira,
          text: "Dados de configuração",
          click: () {},
        ),
        SizedBox(
          height: 20,
        ),
        BotaoWidget(
          width: double.infinity,
          height: SizeConfig.sizeHeight * 10,
          visivelIcon: false,
          cor: Cores.primeira,
          text: "Configurar IP",
          click: () {},
        ),
        SizedBox(
          height: 20,
        ),
        BotaoWidget(
          width: double.infinity,
          height: SizeConfig.sizeHeight * 10,
          visivelIcon: false,
          cor: Cores.primeira,
          text: "Sincronizar banco de dados",
          click: () {},
        ),
        SizedBox(
          height: 20,
        ),
        BotaoWidget(
          width: double.infinity,
          height: SizeConfig.sizeHeight * 10,
          visivelIcon: false,
          cor: Cores.primeira,
          text: "Limpar banco de dados",
          click: () {},
        ),
      ],
    );
  }
}
