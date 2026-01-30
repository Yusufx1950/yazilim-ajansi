import 'dart:math' as math;

import 'package:flutter/material.dart';

class SiberGuvenlik extends StatefulWidget {
  const SiberGuvenlik({super.key});

  @override
  State<SiberGuvenlik> createState() => _SiberGuvenlikState();
}

class _SiberGuvenlikState extends State<SiberGuvenlik>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _pulseController;
  int _selectedService = -1;
  bool _showEmergency = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> hizmetler = [
    {
      'icon': Icons.security_outlined,
      'title': 'Penetrasyon Testi',
      'subtitle': 'Etik Hackerlık',
      'description':
          'Sistemlerinizi gerçek hackerların gözüyle test ediyoruz. OWASP Top 10 standartlarında kapsamlı güvenlik açığı analizi.',
      'features': [
        'Network Pentest',
        'Web Uygulama Testi',
        'Mobile App Test',
        'Sosyal Mühendislik',
      ],
      'color': Colors.green,
      'severity': 'Yüksek Öncelik',
    },
    {
      'icon': Icons.verified_user_outlined,
      'title': 'Güvenlik Danışmanlığı',
      'subtitle': 'ISO 27001 & GDPR',
      'description':
          'Kurumsal güvenlik politikalarınızı oluşturuyor, uyumluluk süreçlerinizi yönetiyoruz.',
      'features': [
        'Risk Analizi',
        'Uyumluluk Denetimi',
        'Güvenlik Politikaları',
        'Farkındalık Eğitimi',
      ],
      'color': Colors.blue,
      'severity': 'Standart',
    },
    {
      'icon': Icons.monitor_heart_outlined,
      'title': '7/24 SOC Hizmeti',
      'subtitle': 'Güvenlik Operasyon Merkezi',
      'description':
          'Sürekli izleme ve anlık müdahale. SIEM entegrasyonu ile tehditleri gerçek zamanlı tespit ediyoruz.',
      'features': [
        'SIEM/SOC Analizi',
        'Log Yönetimi',
        'Tehdit İstihbaratı',
        'IOC Tarama',
      ],
      'color': Colors.orange,
      'severity': 'Kritik',
    },
    {
      'icon': Icons.bug_report_outlined,
      'title': 'Kod Güvenliği',
      'subtitle': 'Secure Development',
      'description':
          'Yazılım geliştirme yaşam döngüsünüzde (SDLC) güvenliği en baştan entegre ediyoruz.',
      'features': [
        'Statik Kod Analizi',
        'Güvenli Kod İncelemesi',
        'Dependency Check',
        'DevSecOps',
      ],
      'color': Colors.purple,
      'severity': 'Geliştirme',
    },
    {
      'icon': Icons.warning_amber_outlined,
      'title': 'Olay Müdahale',
      'subtitle': 'Incident Response',
      'description':
          'Siber saldırı anında 7/24 müdahale ekibimizle yanınızdayız. Digital forensics ve kurtarma operasyonları.',
      'features': [
        'Acil Müdahale',
        'Digital Forensics',
        'Malware Analizi',
        'Ransomware Kurtarma',
      ],
      'color': Colors.red,
      'severity': 'Acil',
    },
    {
      'icon': Icons.school_outlined,
      'title': 'Siber Farkındalık',
      'subtitle': 'Eğitim & Simülasyon',
      'description':
          'Çalışanlarınızı sosyal mühendislik ve phishing saldırılarına karşı eğitiyoruz.',
      'features': [
        'Phishing Simülasyonu',
        'Farkındalık Eğitimi',
        'Tabletop Exercises',
        'Sertifikasyon',
      ],
      'color': Colors.teal,
      'severity': 'Önleyici',
    },
  ];

  final List<String> araclar = [
    'Metasploit',
    'Burp Suite',
    'Wireshark',
    'Nmap',
    'Splunk',
    'CrowdStrike',
    'Qualys',
    'Rapid7',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1C),
      body: Stack(
        children: [
          // Background Effect
          Positioned.fill(
            child: CustomPaint(painter: _MatrixBackgroundPainter()),
          ),

          CustomScrollView(
            slivers: [
              // AppBar
              SliverAppBar(
                expandedHeight: 180,
                floating: true,
                pinned: true,
                backgroundColor: const Color(0xFF0A0F1C).withOpacity(0.95),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF0A0F1C),
                          Colors.green.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                  title: const Text(
                    'SİBER GÜVENLİK',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                  centerTitle: true,
                ),
              ),

              // Hero Section
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shield Animation
                      Center(
                        child: AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            return Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.greenAccent.withOpacity(
                                    0.5 + (_pulseController.value * 0.5),
                                  ),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.greenAccent.withOpacity(
                                      _pulseController.value * 0.3,
                                    ),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.shield_outlined,
                                size: 60,
                                color: Colors.greenAccent,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 32),

                      Text(
                        'Dijital Varlıklarınız\nGüvende mi?',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                          shadows: [
                            Shadow(
                              color: Colors.greenAccent.withOpacity(0.5),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Siber tehditlere karşı proaktif savunma. Penetrasyon testinden olay müdahaleye, kurumsal güvenliğinizi sağlıyoruz.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade400,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Güvenlik Durumu Kartı
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1F2E),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.greenAccent.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.greenAccent.withOpacity(0.5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Güvenlik Durumu',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Son kontrol: ${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'KORUNUYOR',
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // İstatistikler
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF1A1F2E),
                        const Color(0xFF1A1F2E).withOpacity(0.5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStat('500+', 'Test', 'Gerçekleştirildi'),
                      _buildDivider(),
                      _buildStat('0', 'Güvenlik\nİhlali', 'Son 365 Gün'),
                      _buildDivider(),
                      _buildStat('<15 dk', 'Müdahale', 'Ortalama Süre'),
                    ],
                  ),
                ),
              ),

              // Hizmetler Başlık
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.shield_moon_outlined,
                            color: Colors.greenAccent,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'GÜVENLİK HİZMETLERİ',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Kapsamlı Güvenlik Çözümleri',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Hizmetler Listesi
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final hizmet = hizmetler[index];
                    final isSelected = _selectedService == index;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1F2E),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? hizmet['color']
                              : Colors.white.withOpacity(0.1),
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: hizmet['color'].withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            _selectedService = isSelected ? -1 : index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: hizmet['color'].withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: hizmet['color'].withOpacity(0.3),
                                      ),
                                    ),
                                    child: Icon(
                                      hizmet['icon'],
                                      color: hizmet['color'],
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: hizmet['color']
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                hizmet['severity'],
                                                style: TextStyle(
                                                  color: hizmet['color'],
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            AnimatedRotation(
                                              turns: isSelected ? 0.5 : 0,
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              child: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          hizmet['title'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          hizmet['subtitle'],
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                hizmet['description'],
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  height: 1.6,
                                ),
                              ),

                              // Genişletilmiş içerik
                              AnimatedCrossFade(
                                firstChild: Container(),
                                secondChild: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                        color: Colors.white.withOpacity(0.1),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Hizmet Kapsamı:',
                                        style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: hizmet['features']
                                            .map<Widget>((feature) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: hizmet['color']
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                                child: Text(
                                                  feature,
                                                  style: TextStyle(
                                                    color: Colors.grey.shade300,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              );
                                            })
                                            .toList(),
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        width: double.infinity,
                                        child: OutlinedButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: hizmet['color'],
                                            size: 18,
                                          ),
                                          label: Text(
                                            'Detaylı Bilgi Al',
                                            style: TextStyle(
                                              color: hizmet['color'],
                                            ),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: hizmet['color'],
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                crossFadeState: isSelected
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 300),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: hizmetler.length),
                ),
              ),

              // Kullanılan Araçlar
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1F2E),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Endüstri Standardı Araçlar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: araclar.map((arac) {
                          return Chip(
                            label: Text(arac),
                            backgroundColor: const Color(0xFF0A0F1C),
                            side: BorderSide(color: Colors.grey.shade800),
                            labelStyle: const TextStyle(color: Colors.grey),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),

              // Acil Müdahale CTA
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 0, 24, 40),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red.shade900.withOpacity(0.8),
                        Colors.red.shade800.withOpacity(0.6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.redAccent.withOpacity(0.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.emergency_outlined,
                        size: 48,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Siber Saldırı mı Geçiriyorsunuz?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '7/24 Acil Müdahale Hattı: 30 dakika içinde yanıt garantisi',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.phone),
                        label: const Text(
                          'Acil Destek Çağrısı',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red.shade900,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Acil Buton (Floating)
          Positioned(
            bottom: 24,
            right: 24,
            child: AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1 + (_pulseController.value * 0.1),
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: Colors.redAccent,
                    icon: const Icon(Icons.emergency),
                    label: const Text('ACİL'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, String subtext) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Text(
          subtext,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.white.withOpacity(0.1),
    );
  }
}

// Matrix arka plan efekti
class _MatrixBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent.withOpacity(0.03)
      ..strokeWidth = 1;

    final random = math.Random();

    for (var i = 0; i < 50; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final length = random.nextDouble() * 20 + 5;

      canvas.drawLine(Offset(x, y), Offset(x, y + length), paint);

      // Karakter efekti
      final charPaint = Paint()..color = Colors.greenAccent.withOpacity(0.05);

      final rect = Rect.fromLTWH(x - 1, y, 3, length);
      canvas.drawRect(rect, charPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
