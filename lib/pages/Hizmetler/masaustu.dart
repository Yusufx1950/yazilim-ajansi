import 'package:flutter/material.dart';

class Masaustu extends StatefulWidget {
  const Masaustu({super.key});

  @override
  State<Masaustu> createState() => _MasaustuState();
}

class _MasaustuState extends State<Masaustu> with TickerProviderStateMixin {
  late AnimationController _controller;
  int _selectedTech = -1;
  int _expandedStep = -1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> surecAdimlari = [
    {
      'phase': '01',
      'title': 'Keşif & Analiz',
      'duration': '1-2 Hafta',
      'icon': Icons.search_outlined,
      'color': Colors.blue,
      'description':
          'Projenizin temelini atıyoruz. İhtiyaçlarınızı detaylı analiz ediyor, teknik gereksinimleri belirliyoruz.',
      'tasks': [
        'İhtiyaç Analizi',
        'Teknik Feasibility',
        'Risk Değerlendirme',
        'Proje Kapsamı',
      ],
      'deliverables': [
        'SRS Dokümanı',
        'Teknik Mimari Taslağı',
        'Zaman Çizelgesi',
      ],
    },
    {
      'phase': '02',
      'title': 'UX/UI Tasarım',
      'duration': '2-3 Hafta',
      'icon': Icons.design_services_outlined,
      'color': Colors.purple,
      'description':
          'Kullanıcı deneyimini ön planda tutarak, modern ve fonksiyonal arayüzler tasarlıyoruz.',
      'tasks': [
        'Wireframing',
        'Prototip Oluşturma',
        'Kullanıcı Testleri',
        'Tasarım Sistemleri',
      ],
      'deliverables': ['Figma Prototipi', 'UI Kit', 'Kullanım Kılavuzu'],
    },
    {
      'phase': '03',
      'title': 'Geliştirme',
      'duration': '4-8 Hafta',
      'icon': Icons.code_outlined,
      'color': Colors.orange,
      'description':
          'Agile metodoloji ile 2 haftalık sprintler halinde kodlama yapıyoruz. Sürekli geri bildirim döngüsü.',
      'tasks': [
        'Frontend Geliştirme',
        'Backend/API Entegrasyonu',
        'Veritabanı Tasarımı',
        'Sprint Review',
      ],
      'deliverables': ['Çalışan MVP', 'Kaynak Kodları', 'API Dokümantasyonu'],
    },
    {
      'phase': '04',
      'title': 'Test & QA',
      'duration': '2-3 Hafta',
      'icon': Icons.bug_report_outlined,
      'color': Colors.green,
      'description':
          'Kapsamlı test süreçleriyle yazılımınızı kusursuz hale getiriyoruz. Otomatik ve manuel testler.',
      'tasks': [
        'Unit Testing',
        'Entegrasyon Testleri',
        'UI Testleri',
        'Performans Testleri',
      ],
      'deliverables': ['Test Raporları', 'Bug Listesi', 'Performans Analizi'],
    },
    {
      'phase': '05',
      'title': 'Dağıtım & Destek',
      'duration': '1 Hafta + Sürekli',
      'icon': Icons.rocket_launch_outlined,
      'color': Colors.red,
      'description':
          'Windows/Mac/Linux için installer hazırlama, code signing ve otomatik güncelleme sistemleri.',
      'tasks': [
        'Installer Paketleme',
        'Code Signing',
        'Auto-Update Entegrasyonu',
        'Eğitim',
      ],
      'deliverables': [
        'Setup Dosyaları',
        'Kullanım Kılavuzu',
        'Bakım Sözleşmesi',
      ],
    },
  ];

  final List<Map<String, dynamic>> teknolojiler = [
    {
      'name': 'Flutter Desktop',
      'platforms': ['Windows', 'Mac', 'Linux'],
      'icon': Icons.flutter_dash,
      'color': Colors.blue,
      'bestFor': 'Cross-platform, hızlı geliştirme',
    },
    {
      'name': 'Electron.js',
      'platforms': ['Windows', 'Mac', 'Linux'],
      'icon': Icons.javascript_outlined,
      'color': Colors.teal,
      'bestFor': 'Web teknolojileri ile masaüstü',
    },
    {
      'name': '.NET MAUI',
      'platforms': ['Windows', 'Mac', 'iOS', 'Android'],
      'icon': Icons.window,
      'color': Colors.purple,
      'bestFor': 'Windows ekosistemi entegrasyonu',
    },
    {
      'name': 'Tauri',
      'platforms': ['Windows', 'Mac', 'Linux'],
      'icon': Icons.speed,
      'color': Colors.orange,
      'bestFor': 'Hafif, güvenli Rust tabanlı',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: CustomScrollView(
        slivers: [
          // Hero Header
          SliverAppBar(
            expandedHeight: 220,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF0F172A),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF0F172A),
                      Colors.blue.shade900.withOpacity(0.3),
                      Colors.purple.shade900.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.3),
                          ),
                        ),
                        child: const Text(
                          'MASAÜSTÜ YAZILIM',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Geliştirme Sürecimiz',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Fikirden hazır ürüne: Şeffaf, sistematik ve profesyonel yaklaşım',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // İstatistikler
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade900.withOpacity(0.3),
                      Colors.purple.shade900.withOpacity(0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('8-16', 'Hafta\nOrtalama Süre'),
                    _buildDivider(),
                    _buildStatItem('5', 'Faz\nProses'),
                    _buildDivider(),
                    _buildStatItem('2', 'Yıl\nGaranti'),
                  ],
                ),
              ),
            ),
          ),

          // Süreç Timeline
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final adim = surecAdimlari[index];
                final isLast = index == surecAdimlari.length - 1;
                final isExpanded = _expandedStep == index;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _expandedStep = isExpanded ? -1 : index;
                            });
                          },
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: adim['color'].withOpacity(0.2),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: adim['color'],
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: adim['color'].withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Icon(
                              adim['icon'],
                              color: adim['color'],
                              size: 28,
                            ),
                          ),
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: isExpanded ? 400 : 100,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  adim['color'],
                                  surecAdimlari[index + 1]['color'].withOpacity(
                                    0.3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 20),

                    // İçerik
                    Expanded(
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          final delay = index * 0.2;
                          final animation = CurvedAnimation(
                            parent: _controller,
                            curve: Interval(
                              delay,
                              delay + 0.5,
                              curve: Curves.easeOut,
                            ),
                          );

                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.3, 0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: _buildStepCard(adim, isExpanded),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }, childCount: surecAdimlari.length),
            ),
          ),

          // Teknoloji Stack
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    'Teknoloji Stack\'i',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Projenize en uygun teknolojiyi birlikte seçiyoruz',
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: teknolojiler.length,
                      itemBuilder: (context, index) {
                        final tech = teknolojiler[index];
                        final isSelected = _selectedTech == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTech = isSelected ? -1 : index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 170,
                            margin: const EdgeInsets.only(right: 16),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? tech['color'].withOpacity(0.15)
                                  : const Color(0xFF1E293B),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? tech['color']
                                    : Colors.white.withOpacity(0.1),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      tech['icon'],
                                      color: tech['color'],
                                      size: 32,
                                    ),
                                    if (isSelected)
                                      Icon(
                                        Icons.check_circle,
                                        color: tech['color'],
                                        size: 20,
                                      ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  tech['name'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  tech['bestFor'],
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 4,
                                  children: (tech['platforms'] as List<String>)
                                      .map(
                                        (p) => Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(
                                              0.3,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            p,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // İletişim Protokolü
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.sync_alt, color: Colors.green),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Şeffaf İletişim',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Proje boyunca sürekli iletişimde kalıyoruz',
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildCommItem(
                    icon: Icons.videocam_outlined,
                    title: 'Haftalık Sprint Toplantıları',
                    desc:
                        'Zoom/Google Meet ile proje durum değerlendirmesi ve demo',
                  ),
                  _buildCommItem(
                    icon: Icons.task_alt,
                    title: 'Proje Yönetimi',
                    desc:
                        'Jira/Trello üzerinden task takibi ve zaman çizelgesi',
                  ),
                  _buildCommItem(
                    icon: Icons.folder_shared_outlined,
                    title: 'Dokümantasyon',
                    desc: 'Confluence/Notion ile wiki ve teknik dokümantasyon',
                  ),
                  _buildCommItem(
                    icon: Icons.chat_bubble_outline,
                    title: 'Anlık İletişim',
                    desc:
                        'Slack/Discord üzerinden 7/24 erişim ve hızlı geri dönüş',
                  ),
                ],
              ),
            ),
          ),

          // CTA
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(24, 0, 24, 40),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade600, Colors.purple.shade600],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.computer,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Projenizi Hayata Geçirelim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Ücretsiz keşif toplantısı için hemen iletişime geçin. Fikrinizi 30 dakikada değerlendirelim.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_today),
                        label: const Text('Toplantı Planla'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Teklif Al'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white70),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.white.withOpacity(0.2),
    );
  }

  Widget _buildStepCard(Map<String, dynamic> adim, bool isExpanded) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isExpanded ? adim['color'] : adim['color'].withOpacity(0.3),
          width: isExpanded ? 2 : 1,
        ),
        boxShadow: [
          if (isExpanded)
            BoxShadow(
              color: adim['color'].withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: adim['color'].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'FAZ ${adim['phase']}',
                  style: TextStyle(
                    color: adim['color'],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.schedule, size: 14, color: Colors.grey.shade400),
                    const SizedBox(width: 4),
                    Text(
                      adim['duration'],
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            adim['title'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            adim['description'],
            style: TextStyle(
              color: Colors.grey.shade400,
              height: 1.6,
              fontSize: 15,
            ),
          ),

          // Genişletilebilir içerik
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Divider(color: Colors.white.withOpacity(0.1)),
                const SizedBox(height: 20),

                // Aktiviteler
                Text(
                  'Yapılanlar:',
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                ...adim['tasks'].map<Widget>((task) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: adim['color'],
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          task,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),

                const SizedBox(height: 20),

                // Teslimatlar
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.folder_outlined,
                        size: 20,
                        color: adim['color'],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Teslimatlar',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              adim['deliverables'].join(' • '),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),

          const SizedBox(height: 16),
          Center(
            child: AnimatedRotation(
              turns: isExpanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: Icon(Icons.keyboard_arrow_down, color: adim['color']),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommItem({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.grey.shade400, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
