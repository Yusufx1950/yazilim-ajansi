import 'package:flutter/material.dart';

class TrendItem {
  final int rank;
  final String title;
  final String category;
  final String postCount;
  final String description;
  final bool isPopular;

  TrendItem({
    required this.rank,
    required this.title,
    required this.category,
    required this.postCount,
    required this.description,
    this.isPopular = false,
  });
}

class Trend extends StatefulWidget {
  const Trend({super.key});

  @override
  State<Trend> createState() => _TrendState();
}

class _TrendState extends State<Trend> with SingleTickerProviderStateMixin {
  int _selectedIndex = -1;
  late AnimationController _animationController;

  final List<TrendItem> trends = [
    TrendItem(
      rank: 1,
      title: "#Flutter",
      category: "Teknoloji",
      postCount: "125B gönderi",
      isPopular: true,
      description:
          "Flutter, Google tarafından geliştirilen açık kaynaklı bir UI yazılım geliştirme kitidir. Tek kod tabanıyla Android, iOS, Web ve Masaüstü uygulamaları geliştirmenizi sağlar.",
    ),
    TrendItem(
      rank: 2,
      title: "Dart 3.5",
      category: "Yazılım",
      postCount: "89B gönderi",
      description:
          "Dart programlama dilinin son sürümü, WASM desteği ve gelişmiş performans optimizasyonları ile geliyor.",
    ),
    TrendItem(
      rank: 3,
      title: "#MobileDev",
      category: "Teknoloji",
      postCount: "67B gönderi",
      description:
          "Mobil uygulama geliştirme dünyasındaki son trendler, cross-platform çözümler ve native performans karşılaştırmaları.",
    ),
    TrendItem(
      rank: 4,
      title: "OpenAI",
      category: "Yapay Zeka",
      postCount: "54B gönderi",
      description:
          "ChatGPT, GPT-4 ve diğer yapay zeka modelleriyle ilgili son gelişmeler, API entegrasyonları ve AI destekli uygulamalar.",
    ),
    TrendItem(
      rank: 5,
      title: "#Türkiye",
      category: "Gündem",
      postCount: "342B gönderi",
      isPopular: true,
      description:
          "Türkiye gündeminden son haberler, popüler konular ve sosyal medyada en çok konuşulan başlıklar.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700); // Altın (Gold)
      case 2:
        return const Color(0xFFC0C0C0); // Gümüş (Silver)
      case 3:
        return const Color(0xFFCD7F32); // Bronz (Bronze)
      default:
        return const Color(0xFF64748B); // Slate
    }
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Responsive değerler
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 1024;
    final bool isTablet = screenSize.width > 600 && screenSize.width <= 1024;
    final double horizontalPadding = isDesktop ? 120 : (isTablet ? 60 : 16);
    final double maxContentWidth = isDesktop ? 800 : double.infinity;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1C), // Derin koyu arka plan
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0A0F1C),
        title: const Text(
          'Trendler',
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
      body: RefreshIndicator(
        onRefresh: _refreshData,
        color: const Color(0xFF3B82F6),
        backgroundColor: const Color(0xFF1E293B),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Section
                        _buildHeader(isDesktop),
                        const SizedBox(height: 24),

                        // Trend List
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: trends.length,
                          itemBuilder: (context, index) {
                            return _buildTrendCard(
                              context: context,
                              trend: trends[index],
                              index: index,
                              isDesktop: isDesktop,
                            );
                          },
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDesktop) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1E293B),
            const Color(0xFF1E293B).withOpacity(0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: Color(0xFF3B82F6),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Günün Trendleri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Teknoloji ve yazılım dünyasındaki en popüler konuları keşfedin.',
            style: TextStyle(
              color: const Color(0xFF94A3B8),
              fontSize: isDesktop ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendCard({
    required BuildContext context,
    required TrendItem trend,
    required int index,
    required bool isDesktop,
  }) {
    final isExpanded = _selectedIndex == index;
    final rankColor = _getRankColor(trend.rank);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isExpanded
              ? const Color(0xFF3B82F6).withOpacity(0.5)
              : const Color(0xFF334155),
          width: isExpanded ? 2 : 1,
        ),
        boxShadow: [
          if (isExpanded)
            BoxShadow(
              color: const Color(0xFF3B82F6).withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              setState(() {
                _selectedIndex = isExpanded ? -1 : index;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(isDesktop ? 24 : 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rank Badge
                  Container(
                    width: isDesktop ? 48 : 40,
                    height: isDesktop ? 48 : 40,
                    decoration: BoxDecoration(
                      color: rankColor.withOpacity(0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: rankColor.withOpacity(0.5),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: rankColor.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${trend.rank}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: rankColor,
                          fontSize: isDesktop ? 18 : 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: isDesktop ? 20 : 16),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0F172A),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFF334155),
                                ),
                              ),
                              child: Text(
                                trend.category,
                                style: const TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (trend.isPopular) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFFEF4444,
                                  ).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(
                                      0xFFEF4444,
                                    ).withOpacity(0.3),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.local_fire_department,
                                      color: Color(0xFFEF4444),
                                      size: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Popüler',
                                      style: TextStyle(
                                        color: const Color(0xFFEF4444),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            const Spacer(),
                            AnimatedRotation(
                              turns: isExpanded ? 0.5 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: isExpanded
                                    ? const Color(0xFF3B82F6)
                                    : const Color(0xFF64748B),
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isDesktop ? 12 : 8),
                        Text(
                          trend.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isDesktop ? 20 : 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: isDesktop ? 8 : 4),
                        Text(
                          trend.postCount,
                          style: TextStyle(
                            color: const Color(0xFF64748B),
                            fontSize: isDesktop ? 14 : 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Expanded Content
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                isDesktop ? 24 : 16,
                0,
                isDesktop ? 24 : 16,
                24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 1,
                    color: const Color(0xFF334155),
                    indent: isDesktop ? 68 : 56,
                  ),
                  SizedBox(height: isDesktop ? 20 : 16),
                  Padding(
                    padding: EdgeInsets.only(left: isDesktop ? 68 : 56),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trend.description,
                          style: const TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                        SizedBox(height: isDesktop ? 24 : 20),

                        // Responsive Action Buttons
                        LayoutBuilder(
                          builder: (context, constraints) {
                            // Dar ekranlarda dikey, genişte yatay
                            if (constraints.maxWidth < 400) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildActionButton(
                                    icon: Icons.share_outlined,
                                    label: 'Paylaş',
                                    onTap: () {},
                                  ),
                                  const SizedBox(height: 8),
                                  _buildActionButton(
                                    icon: Icons.bookmark_border,
                                    label: 'Kaydet',
                                    onTap: () {},
                                  ),
                                  const SizedBox(height: 8),
                                  _buildActionButton(
                                    icon: Icons.open_in_new,
                                    label: 'Keşfet',
                                    onTap: () {},
                                    isPrimary: true,
                                  ),
                                ],
                              );
                            }

                            return Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                _buildActionButton(
                                  icon: Icons.share_outlined,
                                  label: 'Paylaş',
                                  onTap: () {},
                                ),
                                _buildActionButton(
                                  icon: Icons.bookmark_border,
                                  label: 'Kaydet',
                                  onTap: () {},
                                ),
                                _buildActionButton(
                                  icon: Icons.open_in_new,
                                  label: 'Keşfet',
                                  onTap: () {},
                                  isPrimary: true,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF3B82F6) : const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isPrimary
                ? const Color(0xFF3B82F6)
                : const Color(0xFF334155),
          ),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isPrimary ? Colors.white : const Color(0xFF94A3B8),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isPrimary ? Colors.white : const Color(0xFFCBD5E1),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
