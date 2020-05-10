import 'package:flutter/material.dart';

class ClsCores extends Color {

  ClsCores(final String code) : super(_hexColor(code));

  static _hexColor(String cod){
    return int.parse(cod.substring(1, 7), radix: 16) + 0xFF000000;
  }

  // static int _getColor(String hexColor) {
  //   hexColor = hexColor.toUpperCase().replaceAll("#", "");
  //   if (hexColor.length == 6) {
  //     hexColor = "FF" + hexColor;
  //   }
  //   return int.parse(hexColor, radix: 16);
  // }

  // Color color1 = HexColor("b74093");
  // Color color2 = HexColor("#b74093");
  // Color color3 = HexColor("#88b74093"); // if you wish to use ARGB format

}