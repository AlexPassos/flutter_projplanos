import 'package:mobx/mobx.dart';

part 'addprodutos_controller.g.dart';

class AddprodutosController = _AddprodutosBase with _$AddprodutosController;

abstract class _AddprodutosBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
