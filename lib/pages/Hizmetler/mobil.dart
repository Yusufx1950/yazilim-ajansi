import 'package:flutter/material.dart';

class ProcessStep {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final int duration;
  final List<String> tasks;
  final bool isLeft;

  ProcessStep({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    required this.duration,
    required this.tasks,
    this.isLeft = true,
  });
}

class Mobil extends StatefulWidget {
  const Mobil({super.key});

  @override
  State<Mobil> createState() => _MobilState();
}

class _MobilState extends State<Mobil> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _heroController;
  late Animation<double> _heroAnimation;

  int _currentStep = 0;

  final List<ProcessStep> steps = [
    ProcessStep(
      id: '1',
      title: 'Keşif & Analiz',
      subtitle: 'Fikri Anlama',
      description:
          'Projenizin kapsamını belirliyoruz. Hedef kitle analizi, rakip araştırması ve teknik gereksinimleri belgelendiriyoruz.',
      icon: Icons.search_rounded,
      color: const Color(0xFF3B82F6), // Neon Blue
      duration: 1,
      isLeft: true,
      tasks: [
        'İhtiyaç Analizi',
        'Rakip Araştırması',
        'User Personas',
        'Tech Stack',
      ],
    ),
    ProcessStep(
      id: '2',
      title: 'UI/UX Tasarım',
      subtitle: 'Tasarım Süreci',
      description:
          'Modern, kullanıcı dostu ve markanıza özel arayüzler tasarlıyoruz. Wireframe ve prototip aşamaları.',
      icon: Icons.design_services_rounded,
      color: const Color(0xFFEC4899), // Neon Pink
      duration: 2,
      isLeft: false,
      tasks: ['Wireframing', 'UI Design', 'Prototipleme', 'User Testing'],
    ),
    ProcessStep(
      id: '3',
      title: 'Geliştirme',
      subtitle: 'Kodlama Aşaması',
      description:
          'Flutter ile tek kod tabanında, performanslı ve ölçeklenebilir iOS/Android uygulamaları geliştiriyoruz.',
      icon: Icons.code_rounded,
      color: const Color(0xFF10B981), // Neon Green
      duration: 4,
      isLeft: true,
      tasks: [
        'Architecture',
        'API Integration',
        'State Management',
        'Features',
      ],
    ),
    ProcessStep(
      id: '4',
      title: 'Test & QA',
      subtitle: 'Kalite Kontrol',
      description:
          'Otomasyon ve manuel testlerle uygulamanızı kusursuz hale getiriyoruz. Performans optimizasyonu.',
      icon: Icons.bug_report_rounded,
      color: const Color(0xFFF59E0B), // Neon Orange
      duration: 2,
      isLeft: false,
      tasks: ['Unit Testing', 'Integration', 'Performance', 'Beta Testing'],
    ),
    ProcessStep(
      id: '5',
      title: 'Yayınlama',
      subtitle: 'Go Live',
      description:
          'App Store ve Google Play optimizasyonu, ASO stratejileri ve yayın süreci yönetimi.',
      icon: Icons.rocket_launch_rounded,
      color: const Color(0xFF8B5CF6), // Neon Purple
      duration: 1,
      isLeft: true,
      tasks: ['Store Optimize', 'Metadata', 'Review', 'Launch'],
    ),
    ProcessStep(
      id: '6',
      title: 'Destek & İterasyon',
      subtitle: 'Sürekli İyileştirme',
      description:
          'Yayın sonrası analiz, kullanıcı geri bildirimleri ve sürekli güncellemeler.',
      icon: Icons.support_agent_rounded,
      color: const Color(0xFF06B6D4), // Neon Cyan
      duration: 999,
      isLeft: false,
      tasks: ['Analytics', 'Monitoring', 'Updates', 'New Features'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _heroController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _heroAnimation = CurvedAnimation(
      parent: _heroController,
      curve: Curves.easeOutQuart,
    );
    _heroController.forward();

    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      final stepHeight = 400.0;
      final newStep = (offset / stepHeight).clamp(0, steps.length - 1).toInt();

      if (newStep != _currentStep) {
        setState(() {
          _currentStep = newStep;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1C), // Deep dark background
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Hero SliverAppBar - Dark Theme
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: const Color(0xFF0A0F1C),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Geliştirme Sürecimiz',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF0A0F1C),
                      Color(0xFF1E293B),
                      Color(0xFF0F172A),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Animated Gradient Orbs
                    ...List.generate(5, (index) {
                      return AnimatedBuilder(
                        animation: _heroAnimation,
                        builder: (context, child) {
                          return Positioned(
                            top: 50 + (index * 60),
                            left: (index % 2 == 0) ? -20 : null,
                            right: (index % 2 == 1) ? -20 : null,
                            child: Transform.translate(
                              offset: Offset(
                                0,
                                (1 - _heroAnimation.value) * 100 * (index + 1),
                              ),
                              child: Container(
                                width: 100 + (index * 30),
                                height: 100 + (index * 30),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      index % 2 == 0
                                          ? const Color(
                                              0xFF3B82F6,
                                            ).withOpacity(0.15)
                                          : const Color(
                                              0xFF8B5CF6,
                                            ).withOpacity(0.15),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    // Content
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60),
                            FadeTransition(
                              opacity: _heroAnimation,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: const Color(
                                      0xFF3B82F6,
                                    ).withOpacity(0.5),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF3B82F6,
                                      ).withOpacity(0.2),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.auto_fix_high_rounded,
                                      color: Color(0xFF3B82F6),
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Agile Process',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            FadeTransition(
                              opacity: _heroAnimation,
                              child: const Text(
                                'Fikirden\nUygulamaya',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            FadeTransition(
                              opacity: _heroAnimation,
                              child: Text(
                                '6 aşamalı profesyonel geliştirme sürecimizle hayalinizdeki mobil uygulamayı hayata geçiriyoruz.',
                                style: TextStyle(
                                  color: const Color(0xFF94A3B8),
                                  fontSize: 16,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Stats Section - Dark Cards
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('10+', 'Yıllık\nTecrübe', const Color(0xFF3B82F6)),
                  Container(
                    height: 50,
                    width: 1,
                    color: const Color(0xFF334155),
                  ),
                  _buildStat(
                    '50+',
                    'Tamamlanan\nProje',
                    const Color(0xFF10B981),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: const Color(0xFF334155),
                  ),
                  _buildStat(
                    '%98',
                    'Müşteri\nMemnuniyeti',
                    const Color(0xFFF59E0B),
                  ),
                ],
              ),
            ),
          ),

          // Timeline Section - Dark Theme
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final step = steps[index];
                final isActive = index <= _currentStep;
                return _buildTimelineItem(step, index, isActive);
              }, childCount: steps.length),
            ),
          ),

          // CTA Section - Dark Gradient
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFF3B82F6).withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF3B82F6).withOpacity(0.5),
                      ),
                    ),
                    child: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Color(0xFF3B82F6),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Projenizi Başlatalım',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ücretsiz keşif toplantısı ile fikrinizi değerlendirelim.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF94A3B8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
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
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: const Center(
                          child: Text(
                            'Toplantı Planla',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF94A3B8),
            height: 1.3,
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineItem(ProcessStep step, int index, bool isActive) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: isActive ? 1.0 : 0.5,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline Line & Dot
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: isActive ? step.color : const Color(0xFF334155),
                      shape: BoxShape.circle,
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: step.color.withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ]
                          : [],
                    ),
                    child: Icon(step.icon, color: Colors.white, size: 28),
                  ),
                  if (index != steps.length - 1)
                    Expanded(
                      child: Container(
                        width: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              isActive ? step.color : const Color(0xFF334155),
                              index < _currentStep
                                  ? steps[index + 1].color
                                  : const Color(0xFF334155),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 20),
              // Content Card - Dark
              Expanded(
                child: Transform.translate(
                  offset: Offset(isActive ? 0 : 20, 0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isActive
                            ? step.color.withOpacity(0.5)
                            : const Color(0xFF334155),
                        width: isActive ? 2 : 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isActive
                              ? step.color.withOpacity(0.15)
                              : Colors.black.withOpacity(0.2),
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
                                color: step.color.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: step.color.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                'Aşama ${index + 1}',
                                style: TextStyle(
                                  color: step.color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.schedule_rounded,
                                  size: 16,
                                  color: const Color(0xFF64748B),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  step.duration == 999
                                      ? 'Sürekli'
                                      : '${step.duration} Hafta',
                                  style: const TextStyle(
                                    color: Color(0xFF94A3B8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          step.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step.subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: step.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          step.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF94A3B8),
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: step.tasks.map((task) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0F172A),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFF334155),
                                ),
                              ),
                              child: Text(
                                task,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFCBD5E1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
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
}
