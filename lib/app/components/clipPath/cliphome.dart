import 'package:flutter/material.dart';

class ClipHome extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    //home
    path.lineTo(0.0, size.height - 120);
    path.quadraticBezierTo(
        size.width / 2, size.height - 80, size.width, size.height - 150);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    //Paginas internas
    // path.lineTo(0, size.height - 50);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height - 180, size.width, size.height - 120);
    // path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}