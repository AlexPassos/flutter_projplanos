import 'package:proj_planos/app/modules/comandas/comandas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proj_planos/app/modules/comandas/comandas_page.dart';

class ComandasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ComandasController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ComandasPage()),
      ];

  static Inject get to => Inject<ComandasModule>.of();
}
