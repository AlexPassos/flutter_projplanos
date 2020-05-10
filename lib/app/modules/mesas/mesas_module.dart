import 'package:proj_planos/app/modules/mesas/mesas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proj_planos/app/modules/mesas/mesas_page.dart';

class MesasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MesasController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MesasPage()),
      ];

  static Inject get to => Inject<MesasModule>.of();
}
