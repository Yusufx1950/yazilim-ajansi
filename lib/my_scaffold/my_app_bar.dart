import 'package:flutter/material.dart';

import '../my_widget/my_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  MyAppBar({Key? key})
    : preferredSize = const Size.fromHeight(kToolbarHeight),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MyText(text: "Okan Yazılım Ajansı"),
      centerTitle: true,
      // Diğer özelleştirmeler
    );
  }
}
