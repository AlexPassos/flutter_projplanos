import 'package:flutter/material.dart';
import 'package:proj_planos/app/components/painel/slidepainel.dart';
import 'package:proj_planos/app/modules/comandas/comandas_page.dart';

import 'package:proj_planos/app/modules/home/components/home_widget.dart';
import 'package:proj_planos/app/modules/pesquisarmesas/pesquisarmesas_page.dart';
import 'package:proj_planos/app/modules/produtos/produtos_page.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

import 'components/bottomnavigation/fab_bottom_app_bar.dart';
import 'components/bottomnavigation/fab_with_icons.dart';
import 'components/bottomnavigation/layout.dart';
import 'components/menuesquerdo.dart';
import 'components/menudireito.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Cores.primeira,
          elevation: 0,
          actions: [
            // IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            // Builder(
            //   builder: (context) => IconButton(
            //     icon: Icon(Icons.settings),
            //     onPressed: () => Scaffold.of(context).openEndDrawer(),
            //     tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            //   ),
            // ),
          ],
          bottom: PreferredSize(
            child: Container(
              padding: EdgeInsets.all(5),
            ),
            preferredSize: Size.fromHeight(0),
          ),
        ),
        drawer: MenuDireito(),
        //endDrawer: MenuEsquerdo(),
        body: HomeWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FABBottomAppBar(
          backgroundColor: Cores.primeira,
          centerItemText: 'Mesa',
          color: Cores.branco,
          selectedColor: Cores.branco,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: (v) {
            if (v == 0) {
              SlidePainel.showPainel(context, 'Consultar produtos', ProdutosPage(), scroll: false);
            } else {
              SlidePainel.showPainel(context, 'Comandas', ComandasPage(), scroll: false);
            }
          },
          items: [
            FABBottomAppBarItem(iconData: Icons.fastfood, text: 'Consultar produtos'),
            FABBottomAppBarItem(
                iconData: Icons.description, text: 'Comandas'),
          ],
        ),
        floatingActionButton: _buildFab(context), // This traili
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: false,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: (v) {
            },
          ),
        );
      },
      child: FloatingActionButton(
        backgroundColor: Cores.segunda,
        onPressed: () {
          SlidePainel.showPainel(context, 'Consultar mesas', PesquisarmesasPage(), scroll: false);
        },
        tooltip: 'Mesa',
        child: Icon(Icons.search),
        elevation: 0,
      ),
    );
  }
}
