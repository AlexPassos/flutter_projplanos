import 'package:proj_planos/app/modules/pesquisarmesas/pesquisarmesas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proj_planos/app/modules/pesquisarmesas/pesquisarmesas_page.dart';

class PesquisarmesasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PesquisarmesasController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => PesquisarmesasPage()),
      ];

  static Inject get to => Inject<PesquisarmesasModule>.of();
}
