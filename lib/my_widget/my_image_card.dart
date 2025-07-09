import 'package:flutter/material.dart';

class MyImageCard extends StatefulWidget {
  MyImageCard({
    super.key,
    required this.asset,
    this.yukseklik = 500,
    this.genislik = 500,
  });
  double? yukseklik;
  double? genislik;
  String asset;

  @override
  State<MyImageCard> createState() => _MyImageCardState();
}

class _MyImageCardState extends State<MyImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        widget.asset,
        height: widget.yukseklik,
        width: widget.genislik,
        fit: BoxFit.fill,
      ),
    );
  }
}
