import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({
    super.key,
    required this.text,
    this.Font = FontWeight.normal,
    this.FontSize = 16,
    this.renk = Colors.black87,
  });
  String text;
  double FontSize;
  FontWeight Font;
  Color renk;
  @override
  Widget build(BuildContext context) {
    return Text(
      style: TextStyle(fontSize: FontSize, fontWeight: Font, color: renk),
      text,
      softWrap: true, // Satır sonuna gelince aşağı inmesini sağlar
      maxLines: null, // Satır sayısını sınırsız yapar
      overflow: TextOverflow.visible,
    );
  }
}

class MyTextBeyaz extends StatelessWidget {
  MyTextBeyaz({
    super.key,
    required this.text,
    this.Font = FontWeight.normal,
    this.FontSize = 16,
    this.renk = Colors.white70,
  });
  Color renk;
  String text;
  double FontSize;
  FontWeight Font;
  @override
  Widget build(BuildContext context) {
    return Text(
      style: TextStyle(color: renk, fontSize: FontSize, fontWeight: Font),
      text,
      softWrap: true, // Satır sonuna gelince aşağı inmesini sağlar
      maxLines: null, // Satır sayısını sınırsız yapar
      overflow: TextOverflow.visible,
    );
  }
}

class MyTextBaslik extends StatelessWidget {
  MyTextBaslik({
    super.key,
    required this.text,
    this.Font = FontWeight.normal,
    this.FontSize = 30,
    this.renk = Colors.black,
  });
  Color renk;
  String text;
  FontWeight Font;
  double FontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      strutStyle: StrutStyle(),
      softWrap: true, // Satır sonuna gelince aşağı inmesini sağlar
      maxLines: null, // Satır sayısını sınırsız yapar
      overflow: TextOverflow.visible,
      text,

      style: TextStyle(fontSize: FontSize, fontWeight: Font, color: renk),
    );
  }
}

class MySlogan extends StatelessWidget {
  MySlogan({
    super.key,
    this.Siyah = true,
    this.Font = FontWeight.normal,
    this.FontSize = 30,
  });
  List<Color> _renk = [Colors.black, Colors.white];
  FontWeight Font;
  double FontSize;
  bool Siyah;
  @override
  Widget build(BuildContext context) {
    return Text(
      strutStyle: StrutStyle(),
      softWrap: true, // Satır sonuna gelince aşağı inmesini sağlar
      maxLines: null, // Satır sayısını sınırsız yapar
      overflow: TextOverflow.visible,
      "Yazılımda Hikayenizi Yazıyoruz.",

      style: TextStyle(
        color: Siyah ? _renk[0] : _renk[1],
        fontSize: FontSize,
        fontWeight: Font,
      ),
    );
  }
}
