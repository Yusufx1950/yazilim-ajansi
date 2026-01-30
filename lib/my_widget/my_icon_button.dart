import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  MyIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.onFocus = Colors.white70,
    this.onHover = Colors.blueAccent,
    this.bgColor = Colors.black26,
    this.iconColor = Colors.white,
    this.boyut = 30,
  });
  Color bgColor;
  Color iconColor;
  IconData icon;
  double boyut;
  Color onFocus;
  Color onHover;
  Function() onPressed;
  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  bool suan = false;
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onPressed();
      },
      hoverColor: Colors.pinkAccent,
      onHover: (value) {
        setState(() {
          suan = value;
        });
      },
      icon: Icon(
        widget.icon,
        color: suan ? widget.onFocus : widget.onHover,
        size: widget.boyut,
      ),
    );
  }
}
