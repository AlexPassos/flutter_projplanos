import 'package:mobx/mobx.dart';

part 'pesquisarmesas_controller.g.dart';

class PesquisarmesasController = _PesquisarmesasBase
    with _$PesquisarmesasController;

abstract class _PesquisarmesasBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
