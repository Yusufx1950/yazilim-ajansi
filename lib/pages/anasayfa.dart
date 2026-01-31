import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okanyazilim2/my_widget/my_text.dart';
import 'package:okanyazilim2/pages/Blog.dart';
import 'package:okanyazilim2/pages/Hizmetler/api.dart';
import 'package:okanyazilim2/pages/Hizmetler/masaustu.dart';
import 'package:okanyazilim2/pages/Hizmetler/siber_g%C3%BCvenlik.dart';
import 'package:okanyazilim2/pages/Trend.dart';
import 'package:okanyazilim2/pages/musteri_memnuniyeti.dart';

import '../generated/assets.dart';
import '../my_scaffold/my_app_bar.dart';
import '../my_scaffold/my_boottom_menu.dart';
import '../pages/Hizmetler/mobil.dart';
import '../pages/Hizmetler/web.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _pulseController;
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  // Renk Paleti
  final Color _bgColor = const Color(0xFF0B0F19);
  final Color _cardColor = const Color(0xFF151B2B);
  final Color _accentColor = const Color(0xFF00D4FF);
  final Color _accentPurple = const Color(0xFF8B5CF6);
  final Color _accentPink = const Color(0xFFEC4899);
  final Color _textPrimary = Colors.white;
  final Color _textSecondary = const Color(0xFF94A3B8);

  double _offset = 0;

  // Responsive helper
  bool get isMobile => Get.width < 600;
  bool get isTablet => Get.width >= 600 && Get.width < 1100;
  bool get isDesktop => Get.width >= 1100;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() => _offset = _scrollController.offset);
      });

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pageController = PageController(initialPage: 0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 6), (Timer timer) {
        if (_pageController.hasClients) {
          if (_currentPage < 4) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubic,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      drawer: _buildDrawer(),
      appBar: MyAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_bgColor, const Color(0xFF1E293B), _bgColor],
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeroSection(),
              _buildAnimatedSlider(),
              _buildGradientDivider(),
              _buildServicesSection(),
              _buildGradientDivider(),
              _buildWorkingMethodSection(),
              const SizedBox(height: 60),
              MyBoottomMenu(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    final Color _bgColor = const Color(0xFF0B0F19);
    final Color _cardColor = const Color(0xFF151B2B);
    final Color _accentColor = const Color(0xFF00D4FF);
    final Color _accentPurple = const Color(0xFF8B5CF6);
    final Color _textSecondary = const Color(0xFF94A3B8);

    return Drawer(
      backgroundColor: _bgColor,
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_bgColor, _cardColor, _bgColor],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Modern Drawer Header with Logo
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _accentPurple.withOpacity(0.3),
                    _accentColor.withOpacity(0.1),
                  ],
                ),
                border: Border(
                  bottom: BorderSide(
                    color: _accentColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _accentColor.withOpacity(0.3),
                        ),
                      ),
                      child: Image.asset(
                        Assets.assetsPnglogobeyaz,
                        width: 120,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Yusuf Okan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        shadows: [
                          Shadow(
                            color: _accentColor.withOpacity(0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Dijital Dönüşüm Ortağınız',
                      style: TextStyle(color: _textSecondary, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            // Ana Sayfa (Close Drawer)
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.home_rounded, color: _accentColor, size: 20),
              ),
              title: MyTextBeyaz(text: 'Ana Sayfa', FontSize: 16),
              onTap: () => Get.back(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            const SizedBox(height: 8),
            Divider(
              color: Colors.white.withOpacity(0.1),
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 8),

            // SAYFALAR Grubu
            _buildDrawerSectionTitle('SAYFALAR', _accentColor),

            _buildDrawerItem(
              icon: Icons.trending_up_rounded,
              title: 'Trend',
              onTap: () {
                Get.back();
                Get.to(() => Trend());
              },
              iconColor: Colors.purple,
            ),

            _buildDrawerItem(
              icon: Icons.article_rounded,
              title: 'Blog',
              onTap: () {
                Get.back();
                Get.to(() => Blog());
              },
              iconColor: Colors.blue,
            ),

            _buildDrawerItem(
              icon: Icons.favorite_rounded,
              title: 'Müşteri Memnuniyeti',
              onTap: () {
                Get.back();
                Get.to(() => MusteriMemnuniyeti());
              },
              iconColor: Colors.red,
            ),

            const SizedBox(height: 16),
            Divider(
              color: Colors.white.withOpacity(0.1),
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 8),

            // HİZMETLERİMİZ Grubu (Expansion Tile)
            Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                iconColor: _accentColor,
                collapsedIconColor: _textSecondary,
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _accentPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.work_rounded,
                    color: _accentPurple,
                    size: 20,
                  ),
                ),
                title: Text(
                  'HİZMETLERİMİZ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                children: [
                  _buildSubDrawerItem(
                    title: 'Web Geliştirme',
                    onTap: () {
                      Get.back();
                      Get.to(() => WebHizmetimiz());
                    },
                  ),
                  _buildSubDrawerItem(
                    title: 'Mobil Uygulama',
                    onTap: () {
                      Get.back();
                      Get.to(() => Mobil());
                    },
                  ),
                  _buildSubDrawerItem(
                    title: 'Masaüstü Uygulama',
                    onTap: () {
                      Get.back();
                      Get.to(() => Masaustu());
                    },
                  ),
                  _buildSubDrawerItem(
                    title: 'API & Microservice',
                    onTap: () {
                      Get.back();
                      Get.to(() => Api());
                    },
                  ),
                  _buildSubDrawerItem(
                    title: 'Siber Güvenlik',
                    onTap: () {
                      Get.back();
                      Get.to(() => SiberGuvenlik());
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),
            Divider(
              color: Colors.white.withOpacity(0.1),
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 8),

            // TEKLİF AL Grubu
            _buildDrawerSectionTitle('TEKLİF AL', _accentColor),

            _buildDrawerItem(
              icon: Icons.support_agent_rounded,
              title: 'Teknik Danışmanlık',
              onTap: () {
                Get.back();
                // Sayfa henüz yoksa Get.to(() => TeknikDanismanlik());
              },
              iconColor: Colors.orange,
            ),

            _buildDrawerItem(
              icon: Icons.calculate_rounded,
              title: 'Hızlı Fiyatlandırma',
              onTap: () {
                Get.back();
                // Sayfa henüz yoksa Get.to(() => Fiyatlandirma());
              },
              iconColor: Colors.green,
            ),

            const SizedBox(height: 16),
            Divider(
              color: Colors.white.withOpacity(0.1),
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 8),

            // İLETİŞİM Grubu
            _buildDrawerSectionTitle('İLETİŞİM', _accentColor),

            _buildDrawerItem(
              icon: Icons.email_outlined,
              title: 'yusufx9999@gmail.com',
              onTap: () {
                Get.back();
                // Email launcher eklenebilir
              },
              iconColor: Colors.teal,
              isEmail: true,
            ),

            _buildDrawerItem(
              icon: Icons.phone_outlined,
              title: '+90 534 717 85 35',
              onTap: () {
                Get.back();
                // Phone launcher eklenebilir
              },
              iconColor: Colors.cyan,
              isPhone: true,
            ),

            const SizedBox(height: 24),

            // Footer - Sosyal Medya
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, _accentColor.withOpacity(0.05)],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Bizi Takip Edin',
                    style: TextStyle(color: _textSecondary, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(Icons.facebook_outlined, () {}),
                      const SizedBox(width: 12),
                      _buildSocialIcon(Icons.alternate_email, () {}),
                      const SizedBox(width: 12),
                      _buildSocialIcon(Icons.camera_alt_outlined, () {}),
                      const SizedBox(width: 12),
                      _buildSocialIcon(Icons.business_center_outlined, () {}),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Yardımcı Widget'lar

  Widget _buildDrawerSectionTitle(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color iconColor,
    bool isEmail = false,
    bool isPhone = false,
  }) {
    final Color _cardColor = const Color(0xFF151B2B);
    final Color _textSecondary = const Color(0xFF94A3B8);

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: MyTextBeyaz(text: title, FontSize: 14),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: _textSecondary,
        size: 14,
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.transparent,
      hoverColor: _cardColor.withOpacity(0.5),
    );
  }

  Widget _buildSubDrawerItem({
    required String title,
    required VoidCallback onTap,
  }) {
    final Color _accentColor = const Color(0xFF00D4FF);
    final Color _textSecondary = const Color(0xFF94A3B8);

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 72, right: 16),
      leading: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: _accentColor.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: _textSecondary.withOpacity(0.5),
        size: 12,
      ),
      onTap: onTap,
      dense: true,
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    final Color _textSecondary = const Color(0xFF94A3B8);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Icon(icon, color: _textSecondary, size: 18),
      ),
    );
  }

  // ==================== HERO SECTION ====================
  Widget _buildHeroSection() {
    return AnimatedBuilder(
      animation: _fadeController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeController.value,
          child: Transform.translate(
            offset: Offset(0, (1 - _fadeController.value) * 50),
            child: child,
          ),
        );
      },
      child: Container(
        height: isMobile ? Get.height * 0.8 : Get.height - 200,
        width: Get.width,
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: Stack(
          children: [
            // Background glow effects
            Positioned(
              top: 100,
              left: -100,
              child: Container(
                width: isMobile ? 200 : 300,
                height: isMobile ? 200 : 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _accentPurple.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              right: -100,
              child: Container(
                width: isMobile ? 150 : 250,
                height: isMobile ? 150 : 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _accentColor.withOpacity(0.15),
                ),
              ),
            ),

            Center(
              child: SingleChildScrollView(
                // YENİ: Alt tarafta güvenli boşluk bırak (navigasyon çubuğu + ekstra)
                padding: EdgeInsets.only(
                  bottom:
                      MediaQuery.of(context).padding.bottom +
                      (isMobile ? 10 : 20),
                ),
                physics:
                    const BouncingScrollPhysics(), // iOS tarzı elastik scroll
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Ortalama için eklendi
                  children: [
                    SizedBox(height: isMobile ? 20 : 40),

                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [_accentColor, _accentPurple, _accentPink],
                      ).createShader(bounds),
                      child: Text(
                        'DİJİTAL DÖNÜŞÜM\nORTAĞINIZ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 32 : (isTablet ? 44 : 56),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                          letterSpacing: -1,
                        ),
                      ),
                    ),

                    SizedBox(height: isMobile ? 12 : 20),

                    Text(
                      'Fikirden fonksiyona, satır satır değer üretiyoruz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        color: _textSecondary,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    SizedBox(height: isMobile ? 30 : 60),

                    // Responsive Kartlar
                    if (isMobile)
                      Padding(
                        // YENİ: Mobil kartlara yatay padding (kenarlara yapışmasın)
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            _buildNeonCard(
                              'Mobil Uygulama',
                              'Zarif Tasarım\nVe Son Derece Hızlı',
                              Assets.assetsMobilUygulama,
                              _accentColor,
                              0,
                            ),
                            const SizedBox(
                              height: 16,
                            ), // 12'den 16'ya çıkarıldı
                            _buildNeonCard(
                              'Web Uygulama',
                              'Modern Tasarım\nve Ödeme Entegrasyonu',
                              Assets.assetsWebUygulama,
                              _accentPurple,
                              1,
                            ),
                            const SizedBox(height: 16),
                            _buildNeonCard(
                              'Masaüstü',
                              'Otomasyon Sistemleri',
                              Assets.assetsMasaustuUygulama,
                              _accentPink,
                              2,
                            ),
                            const SizedBox(height: 16),
                            _buildNeonCard(
                              'Siber Güvenlik',
                              'Uygulama Güvenliği',
                              Assets.assetsSiberGuvenlik,
                              const Color(0xFF10B981),
                              3,
                            ),
                          ],
                        ),
                      )
                    else
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildNeonCard(
                            'Mobil Uygulama',
                            'Zarif Tasarım\nVe Son Derece Hızlı',
                            Assets.assetsMobilUygulama,
                            _accentColor,
                            0,
                          ),
                          _buildNeonCard(
                            'Web Uygulama',
                            'Modern Tasarım\nve Ödeme Entegrasyonu',
                            Assets.assetsWebUygulama,
                            _accentPurple,
                            1,
                          ),
                          _buildNeonCard(
                            'Masaüstü Platformu',
                            'İhtiyacınız Olan Otomasyon\nSistemleri İçin İdeal',
                            Assets.assetsMasaustuUygulama,
                            _accentPink,
                            2,
                          ),
                          _buildNeonCard(
                            'Siber Güvenlik',
                            'Uygulama Güvenliği\nHer Zaman Ön Planda',
                            Assets.assetsSiberGuvenlik,
                            const Color(0xFF10B981),
                            3,
                          ),
                        ],
                      ),

                    SizedBox(
                      height: isMobile ? 30 : 50,
                    ), // 20'den 30'a çıkarıldı

                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildGlowButton('Şimdi Başla →', _accentColor, () {}),
                        _buildOutlineButton('Çalışma Düzeni', () {}),
                      ],
                    ),

                    // YENİ: Butonların altına ekstra boşluk (çok önemli!)
                    SizedBox(height: isMobile ? 50 : 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNeonCard(
    String title,
    String desc,
    String image,
    Color accent,
    int index,
  ) {
    final double width = isMobile ? Get.width - 32 : 280;
    final double height = isMobile ? 120 : 160;

    return AnimatedBuilder(
      animation: _slideController,
      builder: (context, child) {
        final delay = index * 0.1;
        final value = (_slideController.value - delay).clamp(0.0, 1.0);
        return Transform.translate(
          offset: Offset(0, (1 - value) * 50),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
          border: Border.all(color: accent.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: accent.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                bottom: -20,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accent.withOpacity(0.1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(isMobile ? 16 : 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: _textPrimary,
                              fontSize: isMobile ? 16 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            desc,
                            style: TextStyle(
                              color: _textSecondary,
                              fontSize: isMobile ? 11 : 13,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      image,
                      height: isMobile ? 60 : 80,
                      width: isMobile ? 60 : 80,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== SLIDER (ZATEN RESPONSIVE) ====================
  Widget _buildAnimatedSlider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobile = constraints.maxWidth < 600;
        final bool tablet =
            constraints.maxWidth < 1000 && constraints.maxWidth >= 600;

        final double sliderHeight = mobile
            ? Get.height * 0.6
            : (tablet ? Get.height * 0.5 : Get.height * 0.5);
        final double sliderWidth = mobile
            ? constraints.maxWidth - 40
            : (tablet
                  ? constraints.maxWidth * 0.8
                  : constraints.maxWidth * 0.7);
        final double buttonSize = mobile ? 40 : 50;

        return Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: mobile ? 500 : 600),
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: mobile ? 20 : 40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Neler Yapıyoruz?',
                style: TextStyle(
                  color: _accentColor,
                  fontSize: mobile ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Hizmetlerimiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              if (mobile)
                _buildMobileSlider(sliderHeight, sliderWidth)
              else
                _buildDesktopSlider(sliderHeight, sliderWidth, buttonSize),

              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                alignment: WrapAlignment.center,
                children: List.generate(5, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _currentPage == index ? 30 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _currentPage == index
                          ? _accentColor
                          : _textSecondary.withOpacity(0.3),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopSlider(double height, double width, double buttonSize) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavButton(Icons.arrow_back_ios_new_outlined, () {
            if (_pageController.hasClients) {
              setState(
                () => _currentPage = _currentPage > 0 ? _currentPage - 1 : 4,
              );
              _pageController.animateToPage(
                _currentPage,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
            }
          }, buttonSize),
          const SizedBox(width: 20),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: _accentPurple.withOpacity(0.2),
                  blurRadius: 40,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: 5,
                itemBuilder: (context, index) => _buildSlideItem(index),
              ),
            ),
          ),
          const SizedBox(width: 20),
          _buildNavButton(Icons.arrow_forward_ios_rounded, () {
            if (_pageController.hasClients) {
              setState(
                () => _currentPage = _currentPage < 4 ? _currentPage + 1 : 0,
              );
              _pageController.animateToPage(
                _currentPage,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
            }
          }, buttonSize),
        ],
      ),
    );
  }

  Widget _buildMobileSlider(double height, double width) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _accentPurple.withOpacity(0.2),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: 5,
              itemBuilder: (context, index) => _buildSlideItem(index),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavButton(Icons.arrow_back_ios_new_outlined, () {
              if (_pageController.hasClients) {
                setState(
                  () => _currentPage = _currentPage > 0 ? _currentPage - 1 : 4,
                );
                _pageController.animateToPage(
                  _currentPage,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              }
            }, 40),
            const SizedBox(width: 40),
            _buildNavButton(Icons.arrow_forward_ios_rounded, () {
              if (_pageController.hasClients) {
                setState(
                  () => _currentPage = _currentPage < 4 ? _currentPage + 1 : 0,
                );
                _pageController.animateToPage(
                  _currentPage,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              }
            }, 40),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.touch_app_outlined, size: 16, color: _textSecondary),
              const SizedBox(width: 8),
              Text(
                'Kaydırarak gezinebilirsiniz',
                style: TextStyle(color: _textSecondary, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onPressed, double size) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: _cardColor,
            shape: BoxShape.circle,
            border: Border.all(color: _accentColor.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: _accentColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: _accentColor, size: size * 0.4),
        ),
      ),
    );
  }

  // ==================== SLIDE ITEM (RESPONSIVE) ====================
  Widget _buildSlideItem(int index) {
    final slides = [
      {
        'title': 'Fikirden Fonksiyona,\nSatır Satır Değer Üretim',
        'desc':
            'Yazılım geliştirme, bir problemi çözmenin en somut yoludur. Kod yazmak; yalnızca teknolojik bir işlem değil, aynı zamanda fikirlerin işlevsel hâle getirildiği yaratıcı bir süreçtir.',
        'image': Assets.assetsGelistirme,
        'color': _accentColor,
      },
      {
        'title': 'Yazılımda Güvenlik:\nKoruma ve Güven İnşası',
        'desc':
            'Dijital çözümler geliştirmek, aynı zamanda sorumluluk almak demektir. Her kod satırı, sadece bir fonksiyon değil; aynı zamanda bir güvenlik testidir.',
        'image': Assets.assetsGuvenlik,
        'color': const Color(0xFF10B981),
      },
      {
        'title': 'Algının Kodlandığı,\nSanal Kimlik',
        'desc':
            'Dijital dünyada var olmak artık sadece teknik bir altyapıya sahip olmakla sınırlı değil—aynı zamanda bir karaktere, bir duruşa ve tanınabilir bir kimliğe sahip olmakla ilgili.',
        'image': Assets.assetsKimlik,
        'color': _accentPurple,
      },
      {
        'title': 'Kurumsal Yapılanma:\nÖlçeklenebilir Başarı',
        'desc':
            'Bir fikrin marka olabilmesi, bir hizmetin sürdürülebilir değer üretebilmesi için sağlam bir kurumsal iskelete ihtiyaç vardır.',
        'image': Assets.assetsKurumsal,
        'color': _accentPink,
      },
      {
        'title': 'Otomasyon ve İşlevsellik:\nZamanı Kodla Kontrol',
        'desc':
            'Günümüz dijital dünyasında hız, tutarlılık ve kullanıcı memnuniyeti; ancak akıllı sistemlerle mümkün olur.',
        'image': Assets.assetsSeyahat,
        'color': const Color(0xFFF59E0B),
      },
    ];

    final slide = slides[index];

    // Mobil görünümde dikey layout
    if (isMobile) {
      return Container(
        color: _cardColor,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _cardColor,
                      (slide['color'] as Color).withOpacity(0.2),
                    ],
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    slide['image'] as String,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: (slide['color'] as Color).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: (slide['color'] as Color).withOpacity(0.5),
                        ),
                      ),
                      child: Text(
                        '0${index + 1} / 05',
                        style: TextStyle(
                          color: slide['color'] as Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      slide['title'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          slide['desc'] as String,
                          style: TextStyle(
                            color: _textSecondary,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward,
                        color: slide['color'] as Color,
                      ),
                      label: Text(
                        'Detaylı Bilgi',
                        style: TextStyle(
                          color: slide['color'] as Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Desktop/Tablet görünümü
    return Container(
      color: _cardColor,
      child: Row(
        children: [
          Expanded(
            flex: isTablet ? 3 : 4,
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 24 : 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: (slide['color'] as Color).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: (slide['color'] as Color).withOpacity(0.5),
                      ),
                    ),
                    child: Text(
                      '0${index + 1} / 05',
                      style: TextStyle(
                        color: slide['color'] as Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    slide['title'] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isTablet ? 24 : 32,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    slide['desc'] as String,
                    style: TextStyle(
                      color: _textSecondary,
                      fontSize: isTablet ? 14 : 16,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: slide['color'] as Color,
                    ),
                    label: Text(
                      'Detaylı Bilgi',
                      style: TextStyle(
                        color: slide['color'] as Color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: isTablet ? 2 : 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    _cardColor,
                    (slide['color'] as Color).withOpacity(0.1),
                  ],
                ),
              ),
              child: Center(
                child: Image.asset(
                  slide['image'] as String,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== HİZMETLER (RESPONSIVE) ====================
  Widget _buildServicesSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [_accentColor, _accentPurple],
            ).createShader(bounds),
            child: Text(
              'HİZMETLERİMİZ',
              style: TextStyle(
                fontSize: isMobile ? 28 : 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: isMobile ? 2 : 4,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),

          _buildServicePankart(
            'WEB TASARIM',
            'Dijital Varlığınızın Temel Taşı',
            'Okan Yazılım Ajansı olarak, markanızın dijital yüzünü modern, kullanıcı dostu ve mobil uyumlu web tasarımlarla inşa ediyoruz...',
            Assets.assetsWebTasarim,
            true,
            _accentColor,
          ),
          _buildMetinPankart(
            'Dijital Dünyanın İlk İzlenimi',
            'saniyeler içinde şekillenir. Bu yüzden web siten sadece görsel olarak çarpıcı değil, aynı zamanda kullanıcıya sorunsuz ve sezgisel bir deneyim sunmalıdır.',
          ),

          _buildServicePankart(
            'MARKALAŞMA\nSTRATEJİSİ',
            'Fikrinizi Kimliğe Dönüştürün',
            'Markanızı sadece görünür değil, unutulmaz kılacak stratejiler geliştiriyoruz...',
            Assets.assetsMarkalasmaStratejisi,
            false,
            _accentPurple,
          ),
          _buildMetinPankart(
            'Teknolojiyle Şekillenen Kimlik',
            'Markalaşma, yalnızca bir logo veya slogan değil; bir hissin, güvenin ve vaadin dijital evrende temsilidir.',
          ),

          _buildServicePankart(
            'İÇERİK\nGELİŞTİRME',
            'Mesajınızı Güçlü Bir Hikâyeye Dönüştürün',
            'Markanızın dijital dünyada sesini duyuracak içerikler üretiyoruz...',
            Assets.assetsIcerikGelistirme,
            true,
            _accentPink,
          ),
          _buildMetinPankart(
            'Hikâyeyi Stratejiye Dönüştürmek',
            'Günümüzde içerik, sadece bilgilendirme aracı değil—dijital varlığın temel taşıdır.',
          ),

          _buildServicePankart(
            'ÜRÜN PAZARLAMA',
            'Fikri Değere, Değeri Kazanca Dönüştür',
            'Sadece ürünleri değil, onların arkasındaki vizyonu da pazarlıyoruz...',
            Assets.assetsUrunPazarlama,
            false,
            const Color(0xFFF59E0B),
          ),
          _buildMetinPankart(
            'Koddan Hikâyeye, Hikâyeden Etkiye',
            'Bir ürün geliştirildiğinde yalnızca teknik bir başarı değil, aynı zamanda potansiyel bir çözüm doğar.',
          ),

          _buildServicePankart(
            'GRAFİK TASARIM',
            'Markanızı Görselleştirin',
            'Grafik tasarımı, markanızın ruhunu yansıtan görsel çözümlere dönüştürüyoruz...',
            Assets.assetsGrafikTasarim,
            true,
            const Color(0xFF10B981),
          ),
          _buildMetinPankart(
            'Görselliğin Gücüyle Marka Hikâyesi',
            'Her çizgi bir mesaj taşır, her renk bir duyguyu yansıtır...',
          ),
        ],
      ),
    );
  }

  Widget _buildServicePankart(
    String title,
    String subtitle,
    String description,
    String image,
    bool imageLeft,
    Color accentColor,
  ) {
    // Mobil görünümde her zaman üstte resim altta metin (daha okunaklı)
    if (isMobile) {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: accentColor.withOpacity(0.2), width: 1),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [accentColor.withOpacity(0.3), _cardColor],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Center(child: Image.asset(image, height: 150)),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      subtitle.toUpperCase(),
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: TextStyle(
                      color: _textSecondary,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Desktop/Tablet Row layout
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accentColor.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: isTablet
            ? Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: imageLeft
                            ? [accentColor.withOpacity(0.2), Colors.transparent]
                            : [
                                Colors.transparent,
                                accentColor.withOpacity(0.2),
                              ],
                      ),
                    ),
                    child: Center(child: Image.asset(image, height: 250)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            subtitle.toUpperCase(),
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _textSecondary,
                            fontSize: 15,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  if (imageLeft)
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              accentColor.withOpacity(0.2),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Center(child: Image.asset(image, height: 300)),
                      ),
                    ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: accentColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              subtitle.toUpperCase(),
                              style: TextStyle(
                                color: accentColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            description,
                            style: TextStyle(
                              color: _textSecondary,
                              fontSize: 16,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!imageLeft)
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              accentColor.withOpacity(0.2),
                            ],
                          ),
                        ),
                        child: Center(child: Image.asset(image, height: 300)),
                      ),
                    ),
                ],
              ),
      ),
    );
  }

  Widget _buildMetinPankart(String title, String content) {
    return Container(
      width: isMobile ? Get.width * 0.9 : 800,
      margin: EdgeInsets.only(bottom: isMobile ? 40 : 60, top: 20),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _accentColor,
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _textSecondary,
              fontSize: isMobile ? 14 : 16,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingMethodSection() {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        children: [
          Text(
            'ÇALIŞMA ŞEKLİMİZ',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: isMobile ? 24 : 40),
          Wrap(
            spacing: isMobile ? 12 : 16,
            runSpacing: isMobile ? 12 : 16,
            alignment: WrapAlignment.center,
            children: [
              _buildMethodCard('Keşif', Icons.search, _accentColor),
              _buildMethodCard('Strateji', Icons.lightbulb, _accentPurple),
              _buildMethodCard('Tasarım', Icons.brush, _accentPink),
              _buildMethodCard(
                'Geliştirme',
                Icons.code,
                const Color(0xFF10B981),
              ),
              _buildMethodCard(
                'Test',
                Icons.bug_report,
                const Color(0xFFF59E0B),
              ),
              _buildMethodCard('Lansman', Icons.rocket, Colors.redAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMethodCard(String title, IconData icon, Color color) {
    final size = isMobile ? 140.0 : 180.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: isMobile ? 24 : 32),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 14 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isMobile ? 24 : 40),
      height: 1,
      width: Get.width * (isMobile ? 0.9 : 0.8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            _accentColor.withOpacity(0.5),
            _accentPurple.withOpacity(0.5),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildGlowButton(String text, Color color, VoidCallback onTap) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3 + (_pulseController.value * 0.2)),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 32,
                  vertical: isMobile ? 12 : 16,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.8)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOutlineButton(String text, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 32,
            vertical: isMobile ? 12 : 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: _textSecondary.withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: _textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
