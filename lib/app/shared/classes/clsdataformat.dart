class DataFormatada {
  static String dataFormatada(String data) {
    List<String> dt = data.split(" ");

    String dia = dt[1].replaceAll(",", "").toString().padLeft(2, '0');
    String mes = _fnmes(dt[0]);
    String ano = dt[2];

    String resultado = "$dia/$mes/$ano";

    return resultado;
  }

  static String dataValidade(String data) {
    List<String> dt = data.split(" ");

    String mes = _fnmes(dt[0]);
    String ano = dt[2];

    String resultado = "$mes/$ano";

    return resultado;
  }

  static String diaSemana(String data) {
    String vData = dataFormatada(data);
    List<String> dt = vData.split("/");

    String dia = dt[0].toString().padLeft(2, '0');
    String mes = dt[1].toString().padLeft(2, '0');
    String ano = dt[2];

    String formato = "$ano-$mes-$dia";
    var numDia = DateTime.parse(formato);

    //print(moonLanding.weekday);

    return _fndia(numDia.weekday);
  }

  static String diaNumero(String data) {
    String vData = dataFormatada(data);
    List<String> dt = vData.split("/");

    String dia = dt[0].toString().padLeft(2, '0');
    //String mes = dt[1].toString().padLeft(2, '0');
    //String ano = dt[2];

    //print(moonLanding.weekday);

    return dia;
  }

  static String nomeMes(String data) {
    String vData = dataFormatada(data);
    List<String> dt = vData.split("/");

    //String dia = dt[0].toString().padLeft(2, '0');
    String mes = dt[1].toString().padLeft(2, '0');
    //String ano = dt[2];

    //print(mes);

    return _nomemes(mes);
  }

  static String diaAtual(String data) {
    List<String> atual = data.split(" ");
    List<String> mAtual = atual[0].toString().split("-");

    //print(mAtual[1].toString());

    return mAtual[2].toString();
  }

  static String mesAtual(String data) {
    List<String> atual = data.split(" ");
    List<String> mAtual = atual[0].toString().split("-");

    //print(mAtual[1].toString());

    return mAtual[1].toString();
  }

  static String anoAtual(String data) {
    List<String> atual = data.split(" ");
    List<String> mAtual = atual[0].toString().split("-");

    //print(mAtual[1].toString());

    return mAtual[0].toString();
  }

  static _fndia(int dia) {
    switch (dia) {
      case 1:
        return 'Segunda';
        break;
      case 2:
        return 'Terça';
        break;
      case 3:
        return 'Quarta';
        break;
      case 4:
        return 'Quinta';
        break;
      case 5:
        return 'Sexta';
        break;
      case 6:
        return 'Sábado';
        break;
      case 7:
        return 'Domingo';
        break;
      default:
        return '';
    }
  }

  static _nomemes(String mes) {
    switch (mes) {
      case "01":
        return "Janeiro";
      case "02":
        return "Fevereiro";
      case "03":
        return "Março";
      case "04":
        return "Abril";
      case "05":
        return "Maio";
      case "06":
        return "Junho";
      case "07":
        return "Julho";
      case "08":
        return "Agosto";
      case "09":
        return "Setembro";
      case "10":
        return "Outubro";
      case "11":
        return "Novembro";
      case "12":
        return "Dezembro";

      default:
        return "";
    }
  }

  static _fnmes(String mes) {
    switch (mes) {
      case "jan":
        return "01";
      case "fev":
        return "02";
      case "mar":
        return "03";
      case "abr":
        return "04";
      case "mai":
        return "05";
      case "jun":
        return "06";
      case "jul":
        return "07";
      case "ago":
        return "08";
      case "set":
        return "09";
      case "out":
        return "10";
      case "nov":
        return "11";
      case "dez":
        return "12";

      default:
        return "";
    }
  }
} //fim classe
