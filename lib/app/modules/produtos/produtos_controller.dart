import 'package:mobx/mobx.dart';

part 'produtos_controller.g.dart';

class ProdutosController = _ProdutosBase with _$ProdutosController;

abstract class _ProdutosBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
