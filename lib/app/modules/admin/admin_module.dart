import 'package:proj_planos/app/modules/admin/admin_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proj_planos/app/modules/admin/admin_page.dart';

class AdminModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AdminController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AdminPage()),
      ];

  static Inject get to => Inject<AdminModule>.of();
}
