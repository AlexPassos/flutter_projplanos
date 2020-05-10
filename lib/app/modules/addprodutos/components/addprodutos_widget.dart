import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj_planos/app/components/botao/botao_widget.dart';
import 'package:proj_planos/app/components/textoField/textoField_widget.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class AddProdutosWidget extends StatefulWidget {
  @override
  _AddProdutosWidgetState createState() => _AddProdutosWidgetState();
}

class _AddProdutosWidgetState extends State<AddProdutosWidget> {
  PageController pController = PageController(initialPage: 0);
  TextEditingController _contText;

  bool _botaoVoltar = false;

  @override
  void initState() {
    super.initState();
    _contText = new TextEditingController(text: '1');
  }

  _fnToPage(int pagina, int duracao) {
    pController.animateToPage(pagina,
        duration: Duration(milliseconds: duracao), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Cores.branco,
        appBar: AppBar(
          backgroundColor: Cores.branco,
          elevation: 3,
          leading: Visibility(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Cores.cinzaescuro,
              onPressed: () {
                _fnToPage(0, 400);
                setState(() {
                  _botaoVoltar = false;
                });
              },
            ),
            visible: _botaoVoltar,
          ),
          title: _tituloAppBar(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Cores.cinzaclaro, Cores.branco])),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: _pageView(),
        ));
  }

  Widget _tituloAppBar() {
    return Text(
      'Mesa: 00 - Marcos Santos',
      style: TextStyle(
          color: Cores.preto, fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _pageView() {
    return new PageView(
      physics: new NeverScrollableScrollPhysics(),
      controller: pController,
      children: <Widget>[
        _produtos(),
        _quantidadeProdutos(),
      ],
      onPageChanged: (value) {
        //print(value);
        switch (value) {
          case 0:
            setState(() {
              _botaoVoltar = false;
            });

            break;
          case 1:
            setState(() {
              _botaoVoltar = true;
            });

            break;

          default:
            setState(() {
              _botaoVoltar = false;
            });
        }
      },
    );
  }

  Widget _produtos() {
    return ListView(
      children: <Widget>[_pesquisarProdutos(), _listarProdutos()],
    );
  }

  Widget _pesquisarProdutos() {
    return Container(
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
    );
  }

  Widget _listarProdutos() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: cardProdutos(),
        );
      },
    );
  }

  Widget cardProdutos() {
    return InkWell(
      onTap: () {
        _fnToPage(1, 400);
      },
      child: Card(
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Refrigerante',
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
                  child: Text(
                    'R\$ 5,00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _quantidadeProdutos() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Produto selecionado:',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Refrigerante',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 1],
                  colors: [Cores.cinzaclaro1, Cores.branco]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Text(
              'Valor: R\$ 5,00',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Quantidade:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              children: <Widget>[
                BotaoWidget(
                  width: 70,
                  height: 70,
                  visivelIcon: true,
                  icon: Icons.remove_circle,
                  sizeIcon: 5,
                  cor: Cores.primeira,
                  visivelText: false,
                  text: "",
                  click: () {},
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: TextField(
                  controller: _contText,                  
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Cores.primeira)),
                    hintText: '1',
                    labelStyle:
                        TextStyle(fontSize: SizeConfig.sizeHeight * 2.5),
                  ),
                )),
                SizedBox(
                  width: 5,
                ),
                BotaoWidget(
                  width: 70,
                  height: 70,
                  visivelIcon: true,
                  icon: Icons.add_circle,
                  sizeIcon: 5,
                  cor: Cores.primeira,
                  visivelText: false,
                  text: "",
                  click: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 1],
                  colors: [Cores.cinzaclaro1, Cores.branco]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Text(
              'Total: R\$ 5,00',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          BotaoWidget(
            width: SizeConfig.screenWidth,
            height: SizeConfig.sizeHeight * 8,
            visivelIcon: false,
            cor: Cores.primeira,
            text: "OK",
            click: () {},
          ),
          SizedBox(
            height: 10,
          ),
          BotaoWidget(
            width: SizeConfig.screenWidth,
            height: SizeConfig.sizeHeight * 8,
            visivelIcon: false,
            cor: Cores.primeira,
            text: "Enviar para cozinha",
            click: () {},
          ),
        ],
      ),
    );
  }
}
