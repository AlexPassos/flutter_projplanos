import 'package:mobx/mobx.dart';

part 'admin_controller.g.dart';

class AdminController = _AdminBase with _$AdminController;

abstract class _AdminBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
