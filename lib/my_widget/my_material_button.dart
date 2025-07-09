import 'package:flutter/material.dart';

class MyMaterialButton extends StatefulWidget {
  MyMaterialButton({super.key, required this.text, required this.onPressed});
  String text;
  Function() onPressed;
  @override
  State<MyMaterialButton> createState() => _MyMaterialButtonState();
}

class _MyMaterialButtonState extends State<MyMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.black54,
      hoverColor: Colors.black,
      disabledTextColor: Colors.pinkAccent,

      textColor: Colors.blueAccent.shade400,
      splashColor: Colors.blueAccent.shade100,

      disabledElevation: 20,
      focusElevation: 10,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(widget.text, style: TextStyle(fontSize: 30)),
      ),
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}
