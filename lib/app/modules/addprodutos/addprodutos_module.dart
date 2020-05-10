import 'package:proj_planos/app/modules/addprodutos/addprodutos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proj_planos/app/modules/addprodutos/addprodutos_page.dart';

class AddprodutosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddprodutosController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AddprodutosPage()),
      ];

  static Inject get to => Inject<AddprodutosModule>.of();
}
