import 'package:flutter/material.dart';

import '../my_widget/my_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool transparent;
  final List<Widget>? actions;

  MyAppBar({Key? key, this.transparent = false, this.actions})
    : preferredSize = const Size.fromHeight(kToolbarHeight),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Koyu tema arka plan
      backgroundColor: transparent
          ? Colors.transparent
          : const Color(0xFF0A0F1C),
      elevation: 0,

      // Modern bottom border
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
      ),

      // İkon renkleri (beyaz/parlak)
      iconTheme: const IconThemeData(color: Colors.white, size: 24),

      // Başlık stilleri
      title: MyText(
        text: "Okan Yazılım Ajansı",
        // Eğer MyText style parametresi alıyorsa:
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          shadows: [
            Shadow(
              color: Color(0xFF3B82F6),
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        // Veya MyText'iniz farklı parametreler alıyorsa:
        // color: Colors.white,
        // fontSize: 22,
        // fontWeight: FontWeight.bold,
      ),

      centerTitle: true,

      // Sağ taraf aksiyonları (Opsiyonel)
      actions:
          actions ??
          [
            IconButton(
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white70,
              ),
              onPressed: () {
                // Bildirimler
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings_outlined, color: Colors.white70),
              onPressed: () {
                // Ayarlar
              },
            ),
            const SizedBox(width: 8),
          ],

      // Alt gölge (koyu tema için soft glow)
      flexibleSpace: transparent
          ? null
          : Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0A0F1C),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
    );
  }
}
