import 'dart:ui';

import 'package:flutter/material.dart';

class MusteriMemnuniyeti extends StatefulWidget {
  const MusteriMemnuniyeti({super.key});

  @override
  State<MusteriMemnuniyeti> createState() => _MusteriMemnuniyetiState();
}

class _MusteriMemnuniyetiState extends State<MusteriMemnuniyeti>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> yorumlar = [
    {
      'isim': 'Ayşe Yılmaz',
      'yorum':
          'Mükemmel hizmet! Ekip çok profesyonel ve ilgiliydi. Kesinlikle tavsiye ederim.',
      'puan': 5.0,
      'foto': 'https://i.pravatar.cc/150?img=1',
    },
    {
      'isim': 'Mehmet Kaya',
      'yorum':
          '5 yıldır müşterileriyim, hiçbir sorun yaşamadım. Kalite standartlarınız çok yüksek.',
      'puan': 5.0,
      'foto': 'https://i.pravatar.cc/150?img=3',
    },
    {
      'isim': 'Zeynep Demir',
      'yorum': 'Hızlı teslimat ve mükemmel müşteri desteği. Teşekkürler!',
      'puan': 4.5,
      'foto': 'https://i.pravatar.cc/150?img=5',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive hesaplamalar
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 1024;
    final bool isTablet = screenSize.width > 600 && screenSize.width <= 1024;
    final double horizontalPadding = isDesktop ? 120 : (isTablet ? 60 : 24);
    final double maxContentWidth = isDesktop ? 1000 : double.infinity;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0A0F1C),
        title: const Text(
          'Müşteri Memnuniyeti',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFF0A0F1C), // Deep dark background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0A0F1C),
              const Color(0xFF1E293B),
              const Color(0xFF0F172A),
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxContentWidth),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: isDesktop ? 60 : 40),

                              // Başlık Bölümü - Dark Glassmorphism
                              Container(
                                padding: EdgeInsets.all(isDesktop ? 32 : 24),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF1E293B,
                                  ).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: const Color(
                                      0xFF3B82F6,
                                    ).withOpacity(0.3),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: const Color(
                                              0xFF3B82F6,
                                            ).withOpacity(0.2),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(
                                                0xFF3B82F6,
                                              ).withOpacity(0.5),
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.favorite_rounded,
                                            color: Color(0xFF3B82F6),
                                            size: 40,
                                          ),
                                        ),
                                        SizedBox(height: isDesktop ? 24 : 20),
                                        Text(
                                          'Müşteri Memnuniyeti',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isDesktop ? 36 : 32,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: -0.5,
                                          ),
                                        ),
                                        SizedBox(height: isDesktop ? 12 : 8),
                                        Text(
                                          'Sizin mutluluğunuz bizim önceliğimizdir',
                                          style: TextStyle(
                                            color: const Color(0xFF94A3B8),
                                            fontSize: isDesktop ? 18 : 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: isDesktop ? 48 : 40),

                              // İstatistikler - Dark Cards
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  // Mobile'da diğer (wrap), Desktop'ta yan yana
                                  if (constraints.maxWidth < 600) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: _buildStatCard(
                                                '98%',
                                                'Memnuniyet',
                                                Icons.sentiment_very_satisfied,
                                                const Color(0xFF10B981),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: _buildStatCard(
                                                '15K+',
                                                'Müşteri',
                                                Icons.people_alt,
                                                const Color(0xFF3B82F6),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        _buildStatCard(
                                          '4.9',
                                          'Ortalama',
                                          Icons.star_rate,
                                          const Color(0xFFF59E0B),
                                        ),
                                      ],
                                    );
                                  }

                                  return Row(
                                    children: [
                                      Expanded(
                                        child: _buildStatCard(
                                          '98%',
                                          'Memnuniyet',
                                          Icons.sentiment_very_satisfied,
                                          const Color(0xFF10B981),
                                        ),
                                      ),
                                      SizedBox(width: isDesktop ? 24 : 16),
                                      Expanded(
                                        child: _buildStatCard(
                                          '15K+',
                                          'Mutlu Müşteri',
                                          Icons.people_alt,
                                          const Color(0xFF3B82F6),
                                        ),
                                      ),
                                      SizedBox(width: isDesktop ? 24 : 16),
                                      Expanded(
                                        child: _buildStatCard(
                                          '4.9',
                                          'Ortalama Puan',
                                          Icons.star_rate,
                                          const Color(0xFFF59E0B),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),

                              SizedBox(height: isDesktop ? 48 : 40),

                              // Müşteri Yorumları Başlık
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Müşteri Yorumları',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isDesktop ? 28 : 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Tümünü Gör',
                                      style: TextStyle(
                                        color: Color(0xFF3B82F6),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: isDesktop ? 28 : 20),

                              // Yorumlar Carousel - Dark Theme
                              SizedBox(
                                height: isDesktop ? 320 : 280,
                                child: PageView.builder(
                                  controller: _pageController,
                                  onPageChanged: (index) {
                                    setState(() {
                                      _currentPage = index;
                                    });
                                  },
                                  itemCount: yorumlar.length,
                                  itemBuilder: (context, index) {
                                    return AnimatedBuilder(
                                      animation: _pageController,
                                      builder: (context, child) {
                                        double value = 1.0;
                                        if (_pageController
                                            .position
                                            .haveDimensions) {
                                          value = _pageController.page! - index;
                                          value = (1 - (value.abs() * 0.3))
                                              .clamp(0.0, 1.0);
                                        }
                                        return SizedBox(
                                          height:
                                              Curves.easeOut.transform(value) *
                                              (isDesktop ? 320 : 280),
                                          child: child,
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 10,
                                        ),
                                        child: _buildYorumCard(
                                          yorumlar[index],
                                          isDesktop,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Page Indicator
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  yorumlar.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: _currentPage == index ? 24 : 8,
                                    height: 8,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _currentPage == index
                                          ? const Color(0xFF3B82F6)
                                          : const Color(0xFF334155),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: isDesktop ? 48 : 40),

                              // NPS Skoru - Dark Theme
                              Container(
                                padding: EdgeInsets.all(isDesktop ? 32 : 24),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: const Color(0xFF334155),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Net Promoter Score',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: isDesktop ? 24 : 16),
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        if (constraints.maxWidth < 500) {
                                          // Mobile: Diğer gösterim
                                          return Column(
                                            children: [
                                              _buildNPSIndicator(
                                                'Promoters',
                                                80,
                                                const Color(0xFF10B981),
                                              ),
                                              const SizedBox(height: 16),
                                              _buildNPSIndicator(
                                                'Passive',
                                                15,
                                                const Color(0xFFF59E0B),
                                              ),
                                              const SizedBox(height: 16),
                                              _buildNPSIndicator(
                                                'Detractors',
                                                5,
                                                const Color(0xFFEF4444),
                                              ),
                                            ],
                                          );
                                        }

                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            _buildNPSIndicator(
                                              'Detractors',
                                              5,
                                              const Color(0xFFEF4444),
                                            ),
                                            SizedBox(
                                              width: isDesktop ? 32 : 16,
                                            ),
                                            _buildNPSIndicator(
                                              'Passive',
                                              15,
                                              const Color(0xFFF59E0B),
                                            ),
                                            SizedBox(
                                              width: isDesktop ? 32 : 16,
                                            ),
                                            _buildNPSIndicator(
                                              'Promoters',
                                              80,
                                              const Color(0xFF10B981),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(height: isDesktop ? 24 : 16),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF3B82F6),
                                            Color(0xFF8B5CF6),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(
                                              0xFF3B82F6,
                                            ).withOpacity(0.4),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        'NPS Skoru: 75',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: isDesktop ? 48 : 40),

                              // Geri Bildirim Butonu - Neon Style
                              Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3B82F6),
                                      Color(0xFF8B5CF6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF3B82F6,
                                      ).withOpacity(0.4),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () {
                                      _showFeedbackDialog(context);
                                    },
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.rate_review_rounded,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            'Geri Bildirim Gönder',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: isDesktop ? 60 : 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String value,
    String label,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF334155)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildYorumCard(Map<String, dynamic> yorum, bool isDesktop) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF334155)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(isDesktop ? 32 : 24),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B).withOpacity(0.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: isDesktop ? 32 : 28,
                      backgroundImage: NetworkImage(yorum['foto']),
                      backgroundColor: const Color(0xFF334155),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            yorum['isim'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < yorum['puan'].floor()
                                    ? Icons.star_rounded
                                    : index < yorum['puan']
                                    ? Icons.star_half_rounded
                                    : Icons.star_border_rounded,
                                color: const Color(0xFFFFD700),
                                size: 18,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.format_quote_rounded,
                        color: Color(0xFF3B82F6),
                        size: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isDesktop ? 20 : 16),
                Text(
                  yorum['yorum'],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFCBD5E1),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNPSIndicator(String label, int percentage, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color.withOpacity(0.3), width: 8),
          ),
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 8,
            backgroundColor: const Color(0xFF334155),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '$percentage%',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
        ),
      ],
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFF1E293B),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Görüşlerinizi Bildirin',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Deneyiminizi değerlendirin',
                  style: TextStyle(fontSize: 16, color: Color(0xFF94A3B8)),
                ),
                const SizedBox(height: 24),

                // Star Rating - Dark
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border_rounded,
                        color: const Color(0xFFFFD700),
                        size: 40,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 24),

                // TextField - Dark
                TextField(
                  maxLines: 4,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Yorumunuzu buraya yazın...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    filled: true,
                    fillColor: const Color(0xFF0F172A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Color(0xFF334155)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Color(0xFF334155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Color(0xFF3B82F6)),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 24),

                // Submit Button - Neon
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3B82F6).withOpacity(0.4),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Teşekkürler! Geri bildiriminiz alındı.',
                            ),
                            backgroundColor: const Color(0xFF10B981),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                      child: const Center(
                        child: Text(
                          'Gönder',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
