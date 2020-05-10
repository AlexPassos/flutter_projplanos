import 'package:mobx/mobx.dart';

part 'comandas_controller.g.dart';

class ComandasController = _ComandasBase with _$ComandasController;

abstract class _ComandasBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
