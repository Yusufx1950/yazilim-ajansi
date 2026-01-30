import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const MyText({
    Key? key,
    required this.text,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          style ??
          TextStyle(
            color: color ?? Colors.white, // Varsayılan beyaz (koyu tema)
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
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
