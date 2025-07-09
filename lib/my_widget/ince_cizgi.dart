import 'package:flutter/material.dart';

class InceCizgi extends StatelessWidget {
  InceCizgi({super.key, this.yanapad = 10, this.yukaripad = 15});
  double yukaripad;
  double yanapad;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: yanapad,
        vertical: yukaripad,
      ),
      child: Container(height: 2, color: Colors.black26),
    );
  }
}

class InceGradiantCizgi extends StatelessWidget {
  InceGradiantCizgi({super.key, this.yanapad = 10, this.yukaripad = 15});
  double yukaripad;
  double yanapad;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: yanapad,
        vertical: yukaripad,
      ),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.white, Colors.blueAccent.shade400, Colors.white],
          ),
        ),
      ),
    );
  }
}
