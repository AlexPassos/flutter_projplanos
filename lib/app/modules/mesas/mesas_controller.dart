import 'package:mobx/mobx.dart';

part 'mesas_controller.g.dart';

class MesasController = _MesasBase with _$MesasController;

abstract class _MesasBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
