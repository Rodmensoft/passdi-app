import 'package:flutter/material.dart';

class CustomClipBottomNavBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //! ME COSTÓ HACER ESTO JAJAJA
    var width = size.width;
    var height = size.height;
    Path path = Path();
    path.lineTo(0, height * 0.05);
    path.lineTo(0, height);
    path.lineTo(width, height);

    // path.cubicTo(
    //   size.width * 0.6,
    //   size.height * 0.45,
    //   size.width * 0.95,
    //   size.height * 0.45,
    //   size.width,
    //   size.height * 0.58,
    // );

    path.lineTo(width, height * 0.05);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
