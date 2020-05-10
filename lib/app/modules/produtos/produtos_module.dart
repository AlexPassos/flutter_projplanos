import 'package:proj_planos/app/modules/produtos/produtos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proj_planos/app/modules/produtos/produtos_page.dart';

class ProdutosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProdutosController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ProdutosPage()),
      ];

  static Inject get to => Inject<ProdutosModule>.of();
}
