import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double width;

  Line({this.width = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: width,
      color: Colors.black87,
    );
  }
}
