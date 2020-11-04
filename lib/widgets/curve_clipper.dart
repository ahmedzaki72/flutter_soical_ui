import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset curvePointer1 = Offset(size.width / 4, size.height);
    Offset centerPointer = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePointer1.dx,
      curvePointer1.dy,
      centerPointer.dx,
      centerPointer.dy,
    );
    Offset curvePointer2 = Offset(3 * size.width / 4, 3 * size.height / 5);
    Offset endPointer = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePointer2.dx,
      curvePointer2.dy,
      endPointer.dx,
      endPointer.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
