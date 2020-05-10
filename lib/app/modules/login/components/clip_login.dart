import 'package:flutter/material.dart';

class ClipLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    //https://www.youtube.com/watch?v=xv3aXittcLg&list=LLsvTSCC_wC3RYDMx9iULFBw&index=8&t=0s

    //path.lineTo(0.0, 0.0); Não precisa desse ponto inicial
    //path.lineTo(size.width, size.height);
    //path.lineTo(size.width /2, size.height *2);
    //path.lineTo(0.0, 0.0); Não precisa desse ponto final

     path.lineTo(100, 100);
      path.lineTo(size.width * 0.45, size.height );
      path.lineTo(0.0, size.height *0.9);
      path.lineTo(100, size.height *0.4);
      path.lineTo(50, size.height *0.4);
    
    //path.quadraticBezierTo(size.width /2, size.height -100, size.width -100, size.height-100);
    //path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    // path.quadraticBezierTo(size.width - (size.width /2), size.height - 150,
    //     size.width, size.height);
    // //path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
