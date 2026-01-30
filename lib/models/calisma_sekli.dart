import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalismaSekli {
  final IconData icon;
  final String baslik;
  final String aciklama;
  final Color renk;

  CalismaSekli({
    required this.icon,
    required this.baslik,
    required this.aciklama,
    required this.renk,
  });
}

final List<CalismaSekli> calismaSekilleri = [
  CalismaSekli(
    icon: CupertinoIcons.arrow_swap,
    baslik: "Takım Çalışması",
    aciklama: "Projelerde ekip uyumuna önem veriyoruz.",
    renk: Colors.teal.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.cloud,
    baslik: "Bulut Teknolojileri",
    aciklama: "Azure ve Firebase üzerinde deneyimliyiz.",
    renk: Colors.blue.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.device_phone_portrait,
    baslik: "Mobil Geliştirme",
    aciklama: "Flutter ile iOS ve Android uygulamaları geliştiriyoruz.",
    renk: Colors.orange.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.desktopcomputer,
    baslik: "Web Geliştirme",
    aciklama:
        "ASP.NET Core ve Laravel ile modern web uygulamaları geliştiriyoruz.",
    renk: Colors.purple.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.lock_shield,
    baslik: "Güvenlik",
    aciklama:
        "Projelerde veri güvenliği ve kullanıcı gizliliğine önem veriyoruz.",
    renk: Colors.red.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.graph_square,
    baslik: "Analitik Düşünme",
    aciklama: "Veri analizi ve problem çözmede analitik yaklaşım kullanıyoruz.",
    renk: Colors.indigo.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.person_2,
    baslik: "Müşteri Odaklılık",
    aciklama: "Çözümlerimizi kullanıcı ihtiyaçlarına göre tasarlıyoruz.",
    renk: Colors.green.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.paintbrush,
    baslik: "UI / UX Tasarım",
    aciklama: "Modern ve kullanıcı dostu arayüzler tasarlıyoruz.",
    renk: Colors.pink.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.gear,
    baslik: "DevOps",
    aciklama: "CI/CD süreçleri ve otomasyon ile hızlı teslimat sağlıyoruz.",
    renk: Colors.cyan.shade600,
  ),
  CalismaSekli(
    icon: CupertinoIcons.book,
    baslik: "Sürekli Öğrenme",
    aciklama:
        "Yeni teknolojileri takip ediyor ve projelerimize entegre ediyoruz.",
    renk: Colors.brown.shade600,
  ),
];
