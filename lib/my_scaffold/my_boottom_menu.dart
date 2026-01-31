import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okanyazilim2/generated/assets.dart';
import 'package:okanyazilim2/my_widget/my_text.dart';
import 'package:okanyazilim2/pages/Blog.dart';
import 'package:okanyazilim2/pages/Hizmetler/api.dart';
import 'package:okanyazilim2/pages/Hizmetler/masaustu.dart';
import 'package:okanyazilim2/pages/Hizmetler/siber_g%C3%BCvenlik.dart';
import 'package:okanyazilim2/pages/Trend.dart';
import 'package:okanyazilim2/pages/musteri_memnuniyeti.dart';

import '../pages/Hizmetler/mobil.dart';
import '../pages/Hizmetler/web.dart';

class MyBoottomMenu extends StatelessWidget {
  const MyBoottomMenu({super.key});

  final Color _bgColor = const Color(0xFF0B0F19);
  final Color _cardColor = const Color(0xFF151B2B);
  final Color _accentColor = const Color(0xFF00D4FF);
  final Color _accentPurple = const Color(0xFF8B5CF6);
  final Color _textSecondary = const Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min, // ÖNEMLİ: Constraints için
        children: [
          // Gradient Border Top
          Container(
            height: 2,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _accentPurple.withOpacity(0.0),
                  _accentColor,
                  _accentPurple.withOpacity(0.0),
                ],
              ),
            ),
          ),

          // Main Content
          Container(
            width: double.infinity,
            color: _cardColor.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 800) {
                  return _buildMobileLayout();
                }
                return _buildDesktopLayout();
              },
            ),
          ),

          // Bottom Bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
              color: _bgColor,
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.1)),
              ),
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Assets.assetsPnglogobeyaz, width: 120),
                    const SizedBox(width: 20),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    const SizedBox(width: 20),
                    Flexible(child: MySlogan(Siyah: false, FontSize: 16)),
                  ],
                ),
                Text(
                  '© 2024 Yusuf Okan. Tüm hakları saklıdır.',
                  style: TextStyle(color: _textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return IntrinsicHeight(
      // ÖNEMLİ: Row için height sınırlaması
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Sol Kısım (Logo)
          Flexible(
            flex: 2,
            fit: FlexFit.loose, // ÖNEMLİ: Expanded yerine Flexible
            child: Column(
              mainAxisSize: MainAxisSize.min, // ÖNEMLİ
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _accentColor.withOpacity(0.3)),
                  ),
                  child: Image.asset(Assets.assetsPnglogobeyaz, width: 150),
                ),
                const SizedBox(height: 20),
                Text(
                  'Dijital dönüşüm ortağınız.\nİnovatif çözümlerle geleceği kodluyoruz.',
                  style: TextStyle(
                    color: _textSecondary,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24),
                _buildSocialIcons(),
              ],
            ),
          ),

          const SizedBox(width: 60),

          // Sağ Kısım (Linkler)
          Flexible(
            flex: 4,
            fit: FlexFit.loose, // ÖNEMLİ
            child: Wrap(
              spacing: 40,
              runSpacing: 30,
              alignment: WrapAlignment.spaceBetween,
              children: [
                _buildLinkColumn('Sayfalar', [
                  _LinkItem('Trend', () => Get.to(() => Trend())),
                  _LinkItem('Blog', () => Get.to(() => Blog())),
                  _LinkItem(
                    'Müşteri Memnuniyeti',
                    () => Get.to(() => MusteriMemnuniyeti()),
                  ),
                ]),
                _buildLinkColumn('Hizmetlerimiz', [
                  _LinkItem(
                    'Web Geliştirme',
                    () => Get.to(() => WebHizmetimiz()),
                  ),
                  _LinkItem('Mobil Uygulama', () => Get.to(() => Mobil())),
                  _LinkItem(
                    'Masaüstü Uygulama',
                    () => Get.to(() => Masaustu()),
                  ),
                  _LinkItem('API & Microservice', () => Get.to(() => Api())),
                  _LinkItem(
                    'Siber Güvenlik',
                    () => Get.to(() => SiberGuvenlik()),
                  ),
                ]),
                _buildLinkColumn('Teklif Al', [
                  _LinkItem('Teknik Danışmanlık', null),
                  _LinkItem('Hızlı Fiyatlandırma', null),
                ]),
                _buildLinkColumn('İletişim', [
                  _LinkItem('yusufx9999@gmail.com', null, isEmail: true),
                  _LinkItem('+90 534 717 85 35', null, isPhone: true),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    // SingleChildScrollView eklendi - taşmayı önler
    return SingleChildScrollView(
      physics:
          const NeverScrollableScrollPhysics(), // Ana scroll dışında scroll olmaması için
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, // Sola yasla
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: _accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _accentColor.withOpacity(0.3)),
              ),
              child: Image.asset(Assets.assetsPnglogobeyaz, width: 120),
            ),
          ),

          // ExpansionTile'ları saran liste - shrinkWrap önemli
          _buildMobileExpansionTile('Sayfalar', [
            _LinkItem('Trend', () => Get.to(() => Trend())),
            _LinkItem('Blog', () => Get.to(() => Blog())),
            _LinkItem(
              'Müşteri Memnuniyeti',
              () => Get.to(() => MusteriMemnuniyeti()),
            ),
          ]),

          _buildMobileExpansionTile('Hizmetlerimiz', [
            _LinkItem('Web Geliştirme', () => Get.to(() => WebHizmetimiz())),
            _LinkItem('Mobil Uygulama', () => Get.to(() => Mobil())),
            _LinkItem('Masaüstü Uygulama', () => Get.to(() => Masaustu())),
            _LinkItem('API & Microservice', () => Get.to(() => Api())),
            _LinkItem('Siber Güvenlik', () => Get.to(() => SiberGuvenlik())),
          ]),

          _buildMobileExpansionTile('Teklif Al', [
            _LinkItem('Teknik Danışmanlık', null),
            _LinkItem('Hızlı Fiyatlandırma', null),
          ]),

          _buildMobileExpansionTile('İletişim', [
            _LinkItem('yusufx9999@gmail.com', null, isEmail: true),
            _LinkItem('+90 534 717 85 35', null, isPhone: true),
          ]),

          const SizedBox(height: 30),
          Center(child: _buildSocialIcons()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLinkColumn(String title, List<_LinkItem> links) {
    return Column(
      mainAxisSize: MainAxisSize.min, // ÖNEMLİ
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            color: _accentColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map((link) => _buildLink(link)),
      ],
    );
  }

  Widget _buildLink(_LinkItem link) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: link.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (link.isEmail || link.isPhone)
              Icon(
                link.isEmail ? Icons.email_outlined : Icons.phone_outlined,
                size: 14,
                color: _textSecondary,
              )
            else
              Container(
                width: 4,
                height: 4,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: _accentPurple,
                  shape: BoxShape.circle,
                ),
              ),
            const SizedBox(width: 8),
            MyTextBeyaz(text: link.title, FontSize: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileExpansionTile(String title, List<_LinkItem> links) {
    return Theme(
      data: ThemeData.dark().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 0,
        ), // Yatay padding'i kaldır
        title: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: _accentColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        iconColor: _accentColor,
        collapsedIconColor: _textSecondary,
        // childrenPadding ekleyerek içerik boşluğu ayarla
        childrenPadding: const EdgeInsets.only(left: 16, bottom: 8),
        children: links.map((link) {
          return ListTile(
            contentPadding: EdgeInsets.zero, // Gereksiz padding'i kaldır
            onTap: link.onTap,
            leading: link.isEmail
                ? Icon(Icons.email_outlined, color: _textSecondary, size: 18)
                : link.isPhone
                ? Icon(Icons.phone_outlined, color: _textSecondary, size: 18)
                : Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: _accentPurple,
                      shape: BoxShape.circle,
                    ),
                  ),
            title: MyTextBeyaz(text: link.title, FontSize: 14),
            minLeadingWidth: 20, // Leading genişliğini ayarla
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSocialIcons() {
    final icons = [
      Icons.facebook_outlined,
      Icons.alternate_email,
      Icons.camera_alt_outlined,
      Icons.business_center_outlined,
    ];

    return Wrap(
      spacing: 12,
      children: icons.map((icon) {
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Icon(icon, color: _textSecondary, size: 20),
          ),
        );
      }).toList(),
    );
  }
}

class _LinkItem {
  final String title;
  final VoidCallback? onTap;
  final bool isEmail;
  final bool isPhone;

  _LinkItem(
    this.title,
    this.onTap, {
    this.isEmail = false,
    this.isPhone = false,
  });
}
