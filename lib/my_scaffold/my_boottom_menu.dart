import 'package:flutter/material.dart';
import 'package:okanyazilim2/generated/assets.dart';
import 'package:okanyazilim2/my_widget/my_text.dart';

class MyBoottomMenu extends StatelessWidget {
  const MyBoottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black, Colors.blue.shade900, Colors.black],
        ),
      ),
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      MyTextBeyaz(text: "Sayfalar"),
                      MyTextBeyaz(text: "Blog", FontSize: 14),
                      MyTextBeyaz(text: "Trend", FontSize: 14),
                      MyTextBeyaz(text: "Müşteri Memnuniyeti", FontSize: 14),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      MyTextBeyaz(text: "Hizmetlerimiz", Font: FontWeight.bold),
                      MyTextBeyaz(text: "Web", FontSize: 14),
                      MyTextBeyaz(text: "Mobil", FontSize: 14),
                      MyTextBeyaz(text: "Masaüstü", FontSize: 14),
                      MyTextBeyaz(text: "Api", FontSize: 14),
                      MyTextBeyaz(text: "Siber Güvenlik", FontSize: 14),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextBeyaz(text: "Teklif Al", Font: FontWeight.bold),
                      MyTextBeyaz(text: "Teknik Danışmanlık", FontSize: 14),
                      MyTextBeyaz(text: "Hızlı Fiyatlandırma", FontSize: 14),

                      MyTextBeyaz(text: "Masaüstü Uygulaması", FontSize: 14),
                      MyTextBeyaz(
                        text: "Web Sitesi / Web Uygulaması",
                        FontSize: 14,
                      ),
                      MyTextBeyaz(
                        text: "Mobil Uygulama Geliştirme",
                        FontSize: 14,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      MyTextBeyaz(text: "Projelerimiz", Font: FontWeight.bold),
                      MyTextBeyaz(
                        text: "Lokanta Yönetim Sistemi",
                        FontSize: 14,
                      ),
                      MyTextBeyaz(text: "Market Yönetim Sistemi", FontSize: 14),
                      MyTextBeyaz(
                        text: "Otel Rezervasyon Sistemi",
                        FontSize: 14,
                      ),
                      MyTextBeyaz(text: "Devam Eden Projeler", FontSize: 14),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextBeyaz(text: "İletişim", Font: FontWeight.bold),
                      MyTextBeyaz(text: "yusufx9999@gmail.com", FontSize: 14),
                      MyTextBeyaz(text: "+90 534 717 85 35", FontSize: 14),
                      MyTextBeyaz(text: "0212 212 717 99", FontSize: 14),
                      MyTextBeyaz(
                        text: "4272 SK. Aydın Mahallesi.\nKarabağlar/izmir",
                        FontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(width: 150, Assets.assetsPnglogobeyaz),
                  SizedBox(width: 20),
                  MySlogan(Siyah: false, FontSize: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
