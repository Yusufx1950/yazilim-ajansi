import 'package:flutter/material.dart';

class WebHizmetimiz extends StatefulWidget {
  const WebHizmetimiz({super.key});

  @override
  State<WebHizmetimiz> createState() => _WebHizmetimizState();
}

class _WebHizmetimizState extends State<WebHizmetimiz>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _selectedService = -1;
  final ScrollController _scrollController = ScrollController();

  // Premium Dark Theme Palette
  final Color _bgColor = const Color(0xFF000000);
  final Color _surfaceColor = const Color(0xFF121212);
  final Color _cardColor = const Color(0xFF1E1E1E);
  final Color _accentColor = const Color(0xFF00E5FF); // Vibrant Cyan
  final Color _textPrimary = Colors.white;
  final Color _textSecondary = Colors.white70;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> hizmetler = [
    {
      'icon': Icons.design_services_outlined,
      'title': 'Özel Web Tasarım',
      'description':
          'Markanızı yansıtan, modern ve kullanıcı dostu arayüzler tasarlıyoruz.',
      'features': [
        'Responsive Tasarım',
        'UI/UX Optimizasyonu',
        'Figma/Adobe XD Prototipleri',
        'Marka Kimliği Entegrasyonu',
      ],
      'color': Colors.blue,
    },
    {
      'icon': Icons.code_outlined,
      'title': 'Web Geliştirme',
      'description':
          'Son teknolojilerle hızlı, güvenli ve ölçeklenebilir web uygulamaları.',
      'features': [
        'React / Next.js / Flutter Web',
        'Node.js / Python Backend',
        'API Entegrasyonları',
        'CMS Çözümleri',
      ],
      'color': Colors.purple,
    },
    {
      'icon': Icons.shopping_bag_outlined,
      'title': 'E-Ticaret Çözümleri',
      'description':
          'Satışlarınızı artıracak, güvenli ödeme sistemli online mağazalar.',
      'features': [
        'WooCommerce / Shopify',
        'Ödeme Sistemi Entegrasyonu',
        'Stok Yönetimi',
        'Mobil Uyumlu Mağaza',
      ],
      'color': Colors.orange,
    },
    {
      'icon': Icons.trending_up_outlined,
      'title': 'SEO & Performans',
      'description':
          'Google sıralamalarında üst sıralara çıkmanızı sağlıyoruz.',
      'features': [
        'Teknik SEO Analizi',
        'Hız Optimizasyonu',
        'İçerik Stratejisi',
        'Analytics Raporlama',
      ],
      'color': Colors.green,
    },
    {
      'icon': Icons.build_outlined,
      'title': 'Bakım & Destek',
      'description':
          '7/24 teknik destek ve düzenli güncellemelerle sitenizi güvende tutuyoruz.',
      'features': [
        'Güvenlik Güncellemeleri',
        'Yedekleme Sistemleri',
        'Performans İzleme',
        'Acil Müdahale',
      ],
      'color': Colors.red,
    },
    {
      'icon': Icons.phone_iphone_outlined,
      'title': 'Mobil Uyumluluk',
      'description': 'Tüm cihazlarda kusursuz çalışan responsive web deneyimi.',
      'features': [
        'PWA (Progressive Web App)',
        'Mobil Öncelikli Tasarım',
        'Cross-platform Test',
        'Touch Optimizasyonu',
      ],
      'color': Colors.teal,
    },
  ];

  final List<Map<String, String>> surec = [
    {
      'baslik': 'Keşif',
      'aciklama': 'İhtiyaçlarınızı analiz ediyor, hedef kitlenizi tanıyoruz.',
    },
    {
      'baslik': 'Tasarım',
      'aciklama': 'Wireframe ve prototip oluşturuyor, onayınıza sunuyoruz.',
    },
    {
      'baslik': 'Geliştirme',
      'aciklama': 'Kodlama aşamasında sürekli geri bildirim alıyoruz.',
    },
    {
      'baslik': 'Test & Yayın',
      'aciklama': 'Kapsamlı testler sonrası yayına alıyoruz.',
    },
  ];

  final List<Map<String, String>> sss = [
    {
      'soru': 'Bir web sitesi ne kadar sürede hazır olur?',
      'cevap':
          'Projenin kapsamına bağlı olarak 2-8 hafta arasında değişmektedir. Basit kurumsal siteler 2-3 hafta, e-ticaret projeleri ise 4-8 hafta sürmektedir.',
    },
    {
      'soru': 'Web sitesi fiyatları nasıl belirleniyor?',
      'cevap':
          'Sayfa sayısı, özel fonksiyonlar, entegrasyonlar ve tasarım karmaşıklığına göre fiyatlandırma yapıyoruz. Ücretsiz teklif almak için bizimle iletişime geçebilirsiniz.',
    },
    {
      'soru': 'SEO çalışması yapıyor musunuz?',
      'cevap':
          'Evet! Tüm projelerimizde temel SEO optimizasyonu standart olarak yapılmaktadır. İleri düzey SEO paketlerimiz için de destek sağlıyoruz.',
    },
    {
      'soru': 'Sonrasında destek alabilir miyim?',
      'cevap':
          'Kesinlikle! Yayın sonrası 1 yıl ücretsiz bakım garantisi veriyoruz. Ayrıca aylık bakım paketlerimizle sürekli destek sağlıyoruz.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Siyah Tema AppBar
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            elevation: 0,
            backgroundColor: _bgColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Web Hizmetlerimiz',
                style: TextStyle(
                  color: _textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.2,
                ),
              ),
              background: Container(color: _bgColor),
            ),
          ),

          // Hero Section (Premium Dark)
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: _surfaceColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(_controller),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Dijital Dünyada\n',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: _textPrimary,
                              height: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'İzinizi Bırakın',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: _accentColor,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Modern, hızlı ve SEO dostu web çözümleri ile işletmenizi geleceğe taşıyoruz.',
                    style: TextStyle(
                      fontSize: 16,
                      color: _textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _accentColor,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Teklif Al',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _textPrimary,
                          side: BorderSide(
                            color: _textPrimary.withOpacity(0.3),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Portfolyo'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStat('50+', 'PROJE'),
                      _buildStat('5+', 'DENEYİM'),
                      _buildStat('%100', 'MUTLU'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Hizmetler Başlığı
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: _accentColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Hizmetlerimiz',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: _textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'İhtiyaçlarınıza özel profesyonel web çözümleri.',
                    style: TextStyle(fontSize: 16, color: _textSecondary),
                  ),
                ],
              ),
            ),
          ),

          // Hizmetler Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.4,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final hizmet = hizmetler[index];
                final isSelected = _selectedService == index;

                return InkWell(
                  onTap: () {},
                  onHover: (value) =>
                      setState(() => _selectedService = value ? index : -1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: _cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? hizmet['color']
                            : Colors.white.withOpacity(0.05),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            hizmet['icon'],
                            color: hizmet['color'],
                            size: 36,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            hizmet['title'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            hizmet['description'],
                            style: TextStyle(
                              fontSize: 14,
                              color: _textSecondary,
                              height: 1.5,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                'Detayları İncele',
                                style: TextStyle(
                                  color: hizmet['color'],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: hizmet['color'],
                                size: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }, childCount: hizmetler.length),
            ),
          ),

          // Çalışma Süreci
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 64),
              padding: const EdgeInsets.all(24),
              color: _surfaceColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Çalışma Sürecimiz',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: _textPrimary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...surec.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: _accentColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                              border: Border.all(color: _accentColor, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: _accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['baslik']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['aciklama']!,
                                  style: TextStyle(color: _textSecondary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),

          // SSS Bölümü
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sıkça Sorulan Sorular',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: _textPrimary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...sss.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: _cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                      child: ExpansionTile(
                        iconColor: _accentColor,
                        collapsedIconColor: _textSecondary,
                        title: Text(
                          item['soru']!,
                          style: TextStyle(
                            color: _textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Text(
                              item['cevap']!,
                              style: TextStyle(
                                color: _textSecondary,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),

          // CTA Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF00C6FF), const Color(0xFF0072FF)],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Text(
                    'Hazır mısınız?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Projenizi hayata geçirelim. Ücretsiz danışmanlık için hemen iletişime geçin.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'İletişime Geç',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: _textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _accentColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
