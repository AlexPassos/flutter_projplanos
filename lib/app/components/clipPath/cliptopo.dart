import 'package:flutter/material.dart';

class ClipTopo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    //Paginas internas
    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
        size.width / 2, size.height - 180, size.width, size.height - 130);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}