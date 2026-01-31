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

  final Color _bgColor = const Color(0xFF000000);
  final Color _surfaceColor = const Color(0xFF121212);
  final Color _cardColor = const Color(0xFF1E1E1E);
  final Color _accentColor = const Color(0xFF00E5FF);
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
      'image':
          'https://images.unsplash.com/photo-1547658719-da2b51169166?w=800&q=80',
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
      'image':
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800&q=80',
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
      'image':
          'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&q=80',
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
      'image':
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&q=80',
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
      'image':
          'https://images.unsplash.com/photo-1496171367470-9ed9a91ea931?w=800&q=80',
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
      'image':
          'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=800&q=80',
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
          'Projenin kapsamına bağlı olarak 2-8 hafta arasında değişmektedir.',
    },
    {
      'soru': 'Web sitesi fiyatları nasıl belirleniyor?',
      'cevap':
          'Sayfa sayısı, özel fonksiyonlar ve tasarım karmaşıklığına göre fiyatlandırma yapıyoruz.',
    },
    {
      'soru': 'SEO çalışması yapıyor musunuz?',
      'cevap':
          'Evet! Tüm projelerimizde temel SEO optimizasyonu standart olarak yapılmaktadır.',
    },
    {
      'soru': 'Sonrasında destek alabilir miyim?',
      'cevap':
          'Kesinlikle! Yayın sonrası 1 yıl ücretsiz bakım garantisi veriyoruz.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
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

          // Hero Section
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

          // DEĞİŞİKLİK: SliverGrid yerine SliverToBoxAdapter + Wrap
          // Böylece kartlar bağımsız olarak büyüyebilir
          SliverLayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.crossAxisExtent;
              final isWide = maxWidth > 900;
              final isMedium = maxWidth > 600 && maxWidth <= 900;
              final crossAxisCount = isWide ? 3 : (isMedium ? 2 : 1);
              final horizontalPadding = isWide ? 48.0 : 24.0;

              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: LayoutBuilder(
                    builder: (context, boxConstraints) {
                      final spacing = 20.0;
                      final totalSpacing = spacing * (crossAxisCount - 1);
                      final cardWidth =
                          (boxConstraints.maxWidth - totalSpacing) /
                          crossAxisCount;

                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        alignment: WrapAlignment.start,
                        children: List.generate(
                          hizmetler.length,
                          (index) => SizedBox(
                            width: cardWidth,
                            child: _buildServiceCard(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
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
                gradient: const LinearGradient(
                  colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
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

  // GÜNCELLENMİŞ _buildServiceCard - Artık bağımsız olarak büyüyebilir
  Widget _buildServiceCard(int index) {
    final hizmet = hizmetler[index];
    final isSelected = _selectedService == index;

    return InkWell(
      onTap: () {
        // Mobil için: Tıklayınca aç/kapat
        setState(() {
          if (_selectedService == index) {
            _selectedService = -1; // Kapat
          } else {
            _selectedService = index; // Aç
          }
        });
      },
      onHover: (value) {
        // Desktop için: Üzerine gelince aç/kapat
        setState(() => _selectedService = value ? index : -1);
      },
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        // Şimdi bu height serbestçe çalışıyor çünkü parent Wrap (değil Grid)
        height: isSelected ? 380 : 260, // Hover'da 120px büyüme
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? hizmet['color']
                : Colors.white.withOpacity(0.05),
            width: isSelected ? 2 : 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: hizmet['color'].withOpacity(0.3),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // İkon ve Başlık Row'u
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: hizmet['color'].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      hizmet['icon'],
                      color: hizmet['color'],
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      hizmet['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Açıklama
              Text(
                hizmet['description'],
                style: TextStyle(
                  fontSize: 13,
                  color: _textSecondary,
                  height: 1.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 16),

              // ANİMASYONLU GÖRSEL - Kartla birlikte büyüyor
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                opacity: isSelected ? 1.0 : 0.0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutCubic,
                  height: isSelected ? 140 : 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      hizmet['image'] as String,
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 140,
                          color: Colors.white.withOpacity(0.05),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                              color: hizmet['color'],
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 140,
                          color: Colors.white.withOpacity(0.05),
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: _textSecondary,
                              size: 32,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const Spacer(), // Alt kısmı itmek için
              // Detaylar İncele
              Row(
                children: [
                  Text(
                    'Detayları İncele',
                    style: TextStyle(
                      color: isSelected ? hizmet['color'] : _textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  AnimatedRotation(
                    turns: isSelected ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: isSelected ? hizmet['color'] : _textSecondary,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
