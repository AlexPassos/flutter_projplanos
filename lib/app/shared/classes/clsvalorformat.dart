import 'package:intl/intl.dart';

class ValorFormatado {
  static String valorFormatado(num valor) {
    final formatCurrency = new NumberFormat("#,##0.00", "pt_BR");
    String formato = 'R\$ ${formatCurrency.format(valor)}';

    return formato;
  }
} //fim classe
