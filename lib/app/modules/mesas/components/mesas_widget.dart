import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:proj_planos/app/components/botao/botao_widget.dart';
import 'package:proj_planos/app/components/clipPath/cliptopo.dart';
import 'package:proj_planos/app/components/painel/slidepainel.dart';
import 'package:proj_planos/app/components/textoField/textoField_widget.dart';
import 'package:proj_planos/app/modules/addprodutos/addprodutos_page.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class MesasWidget extends StatefulWidget {
  @override
  _MesasWidgetState createState() => _MesasWidgetState();
}

class _MesasWidgetState extends State<MesasWidget>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  TextEditingController contNome;
  TextEditingController contPessoas;
  TextEditingController contConsumo;
  TextEditingController contParcial;
  TextEditingController contTotal;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    contNome = TextEditingController(text: "Marcos Santos");
    contPessoas = TextEditingController(text: "02");
    contConsumo = TextEditingController(text: "R\$ 48,00");
    contParcial = TextEditingController(text: "R\$ 20,00");
    contTotal = TextEditingController(text: "R\$ 28,00");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: ClipTopo(),
          child: Container(
            width: double.infinity,
            height: 260,
            color: Cores.primeira,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _numeroMesa(1),
                      _tab(),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _numeroMesa(int numero) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Mesa: $numero',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Cores.branco),
        ),
        Text(
          'Status: Livre',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Cores.branco),
        ),
      ],
    );
  }

  Widget _abrirMesa() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          BotaoWidget(
            width: 250,
            height: SizeConfig.sizeHeight * 8,
            visivelIcon: false,
            cor: Cores.primeira,
            text: "ABRIR MESA",
            click: () {},
          ),
        ],
      ),
    );
  }

  Widget _liberarMesa() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          BotaoWidget(
            width: 250,
            height: SizeConfig.sizeHeight * 8,
            visivelIcon: false,
            cor: Cores.primeira,
            text: "LIBERAR MESA",
            click: () {},
          ),
        ],
      ),
    );
  }

  Widget _tab() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BotaoWidget(
                  width: 70,
                  height: 70,
                  visivelIcon: true,
                  icon: Icons.add_circle,
                  sizeIcon: 7,
                  cor: Cores.primeira,
                  visivelText: false,
                  text: "",
                  click: () {
                    SlidePainel.showPainel(context, 'Adicionar produtos', AddprodutosPage(), scroll: false);
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                BotaoWidget(
                  width: 70,
                  height: 70,
                  visivelIcon: true,
                  icon: Icons.monetization_on,
                  sizeIcon: 7,
                  cor: Cores.primeira,
                  visivelText: false,
                  text: "",
                  click: () {
                    SlidePainel.showPainel(context, 'Fechar mesa', Text('Fechar mesa'));
                  },
                ),
              ],
            ),
          ),
          TabBar(
            controller: tabController,
            indicatorColor: Cores.segunda,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.5,
            labelColor: Cores.segunda,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Dados da mesa',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Comanda',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Container(
            
            height: SizeConfig.sizeHeight * 60,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: <Widget>[
                _dadosMesa(),
                _listarComanda(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dadosMesa() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextoFieldWidget(
            controller: contNome,
            readOnly: true,
            border: false,
            icon: Icon(
              Icons.edit,
              size: 18,
            ),
            text: "Cliente",
            cor: Cores.primeira,
            onChanged: (value) {},
            onTap: () {},
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          TextoFieldWidget(
            controller: contPessoas,
            readOnly: true,
            border: false,
            icon: Icon(
              Icons.edit,
              size: 18,
            ),
            text: "Nº de pessoas",
            cor: Cores.primeira,
            onChanged: (value) {},
            onTap: () {},
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          TextoFieldWidget(
            controller: contConsumo,
            readOnly: true,
            border: false,
            text: "Total do consumo",
            cor: Cores.primeira,
            onChanged: (value) {},
            onTap: () {},
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          TextoFieldWidget(
            controller: contParcial,
            readOnly: true,
            border: false,
            text: "Pagamento parcial",
            cor: Cores.primeira,
            onChanged: (value) {},
            onTap: () {},
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          TextoFieldWidget(
            controller: contTotal,
            readOnly: true,
            border: false,
            text: "Totalização",
            cor: Cores.primeira,
            onChanged: (value) {},
            onTap: () {},
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _listarComanda() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: 10,
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
                child: Text(
                  'R\$ 100,00',
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
