import 'package:dio/dio.dart';
import 'package:proj_planos/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:proj_planos/app/app_widget.dart';
import 'package:proj_planos/app/modules/home/home_module.dart';
import 'package:proj_planos/app/shared/constant/api.dart';

import 'modules/admin/admin_module.dart';
import 'modules/login/login_module.dart';
import 'modules/mesas/mesas_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        //Router('/', child: (_, args) => SplashPage()),
        Router('/', module: LoginModule()),
        Router('/home', module: HomeModule(), transition: TransitionType.rightToLeftWithFade),
        Router('/admin', module: AdminModule(), transition: TransitionType.rightToLeftWithFade),
        Router('/mesas', module: MesasModule(), transition: TransitionType.rightToLeftWithFade),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
