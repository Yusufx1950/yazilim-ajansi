import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okanyazilim2/my_widget/my_text.dart';

class MyCalismaSeklimiz extends StatefulWidget {
  const MyCalismaSeklimiz({super.key});

  @override
  State<MyCalismaSeklimiz> createState() => _MyCalismaSeklimizState();
}

class _MyCalismaSeklimizState extends State<MyCalismaSeklimiz> {
  bool isHovered = false;
  Color Cardcolor = Color.fromRGBO(245, 245, 247, 0.96);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedPhysicalModel(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        elevation: isHovered ? 12 : 5,
        shape: BoxShape.rectangle,
        shadowColor: isHovered ? Colors.blue : Colors.black,
        color: isHovered ? Colors.white : Cardcolor,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 300,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(CupertinoIcons.arrow_swap, size: 242),
                MyTextBaslik(
                  text: "hello",
                  renk: Colors.teal.shade600,
                  FontSize: 20,
                  Font: FontWeight.bold,
                ),
                MyText(
                  text:
                      "loreasdasdmapsdmapmsdpamsdmasdpmasdmaspdmasdmapsdmapsdmaspdmapsdmpasdm",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
