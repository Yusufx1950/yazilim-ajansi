import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ApiService {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> features;

  ApiService({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.features,
  });
}

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> with TickerProviderStateMixin {
  late AnimationController _particlesController;
  late AnimationController _typingController;
  late AnimationController _pulseController;
  late ScrollController _scrollController;
  Timer? _typingTimer;

  String _displayedCode = '';
  final String _fullCode = '''{
  "status": "success",
  "data": {
    "user": {
      "id": 12345,
      "name": "Admin",
      "role": "admin"
    },
    "token": "eyJhbGciOiJIUzI1...",
    "expires_at": "2024-12-31T23:59:59Z"
  }
}''';

  final List<ApiService> services = [
    ApiService(
      title: 'REST API',
      description:
          'HTTP standartlarına tam uyumlu, ölçeklenebilir ve güvenli RESTful API hizmetleri.',
      icon: Icons.api_rounded,
      color: const Color(0xFF3B82F6),
      features: ['CRUD Operations', 'JWT Auth', 'Rate Limiting', 'Versioning'],
    ),
    ApiService(
      title: 'GraphQL',
      description:
          'Esnek sorgulama yapısı ile istemci odaklı, tek endpoint üzerinden veri yönetimi.',
      icon: Icons.account_tree_rounded,
      color: const Color(0xFFEC4899),
      features: [
        'Type System',
        'Real-time Subs',
        'Query Optimization',
        'Schema Stitching',
      ],
    ),
    ApiService(
      title: 'WebSocket',
      description:
          'Gerçek zamanlı, çift yönlü iletişim altyapısı ile anlık veri senkronizasyonu.',
      icon: Icons.sync_alt_rounded,
      color: const Color(0xFF10B981),
      features: [
        'Real-time Data',
        'Low Latency',
        'Auto Reconnect',
        'Room Management',
      ],
    ),
    ApiService(
      title: 'Microservices',
      description:
          'Modüler mimari ile bağımsız deploy edilebilir, yüksek erişilebilirlikli servisler.',
      icon: Icons.apps_rounded,
      color: const Color(0xFFF59E0B),
      features: [
        'Service Mesh',
        'Load Balancing',
        'Circuit Breaker',
        'Docker Support',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _particlesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _typingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _scrollController = ScrollController();

    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    if (_typingTimer?.isActive ?? false) return;

    _typingTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_displayedCode.length < _fullCode.length) {
        setState(() {
          _displayedCode = _fullCode.substring(0, _displayedCode.length + 1);
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              _displayedCode = '';
            });
            _startTypingAnimation();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _particlesController.dispose();
    _typingController.dispose();
    _pulseController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Hero SliverAppBar with Particles
          SliverAppBar(
            expandedHeight: 450,
            pinned: true,
            floating: false,
            backgroundColor: const Color(0xFF0F172A),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Gradient Background
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF0F172A),
                          Color(0xFF1E293B),
                          Color(0xFF0F172A),
                        ],
                      ),
                    ),
                  ),

                  // Animated Particles
                  AnimatedBuilder(
                    animation: _particlesController,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 450),
                        painter: ParticlesPainter(
                          progress: _particlesController.value,
                        ),
                      );
                    },
                  ),

                  // Content
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFF3B82F6).withOpacity(0.5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF10B981),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'API Gateway Active',
                                  style: TextStyle(
                                    color: Color(0xFF3B82F6),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Modern API\nAltyapı Çözümleri',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'REST, GraphQL ve WebSocket protokolleriyle ölçeklenebilir, güvenli ve yüksek performanslı API hizmetleri geliştiriyoruz.',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3B82F6),
                                      Color(0xFF8B5CF6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF3B82F6,
                                      ).withOpacity(0.5),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Dokümantasyon',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.code_rounded,
                                  color: Colors.white70,
                                ),
                                label: const Text(
                                  'Swagger UI',
                                  style: TextStyle(color: Colors.white70),
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
            ),
          ),

          // Stats Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('99.9%', 'Uptime', const Color(0xFF10B981)),
                  _buildDivider(),
                  _buildStat('<50ms', 'Response', const Color(0xFF3B82F6)),
                  _buildDivider(),
                  _buildStat('10M+', 'Requests/Day', const Color(0xFFF59E0B)),
                ],
              ),
            ),
          ),

          // Services Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return _buildServiceCard(services[index]);
              }, childCount: services.length),
            ),
          ),

          // Code Preview Section
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
                    color: const Color(0xFF3B82F6).withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B82F6).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.terminal_rounded,
                          color: Color(0xFF3B82F6),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'API Response Preview',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'POST /api/v1/auth/login',
                              style: TextStyle(
                                color: Color(0xFF64748B),
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, child) {
                          return Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF10B981,
                                  ).withOpacity(0.5 * _pulseController.value),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF334155)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: const BoxDecoration(
                                color: Color(0xFFEF4444),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF59E0B),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Color(0xFF10B981),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _displayedCode,
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontFamily: 'Courier',
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),
                        if (_displayedCode.length < _fullCode.length)
                          Container(
                            width: 8,
                            height: 18,
                            color: const Color(0xFF3B82F6),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Features List
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Teknik Özellikler',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildFeatureChip('JWT Authentication', Icons.security),
                      _buildFeatureChip('Rate Limiting', Icons.speed),
                      _buildFeatureChip('API Versioning', Icons.folder_copy),
                      _buildFeatureChip('Swagger Docs', Icons.description),
                      _buildFeatureChip('Caching', Icons.storage),
                      _buildFeatureChip('Monitoring', Icons.analytics),
                      _buildFeatureChip('Load Balancing', Icons.network_check),
                      _buildFeatureChip('SSL/TLS', Icons.https),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3B82F6).withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
          label: const Text(
            'API Test Et',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(height: 40, width: 1, color: const Color(0xFF334155));
  }

  Widget _buildServiceCard(ApiService service) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 300; // Dar kart kontrolü

        return Container(
          padding: EdgeInsets.all(
            isNarrow ? 16 : 20,
          ), // Dar ekranda küçük padding
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF334155)),
            boxShadow: [
              BoxShadow(
                color: service.color.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // ÖNEMLİ: İçerik kadar yer kapla
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // İkon ve Başlık Row (Yan yana gelebilir)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: service.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(service.icon, color: service.color, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    // Başlık taşarsa kırpılacak
                    child: Text(
                      service.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
                service.description,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                  height: 1.4,
                ),
                maxLines: 3, // Maksimum 3 satır
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),

              const SizedBox(height: 16), // Spacer() yerine sabit boşluk
              // Özellikler - Dar alanda daha kompakt
              Wrap(
                spacing: 6,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children: service.features.map((feature) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: service.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: service.color.withOpacity(0.3),
                        width: 0.5,
                      ),
                    ),
                    child: Text(
                      feature,
                      style: TextStyle(
                        color: service.color,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeatureChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF64748B)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for floating particles
class ParticlesPainter extends CustomPainter {
  final double progress;

  ParticlesPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3B82F6).withOpacity(0.3)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final random = math.Random(42);

    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final baseY = random.nextDouble() * size.height;
      final y = (baseY + progress * 100) % size.height;
      final radius = random.nextDouble() * 3 + 1;

      // Draw connection lines to nearby particles
      for (int j = i + 1; j < 30; j++) {
        final x2 = random.nextDouble() * size.width;
        final baseY2 = random.nextDouble() * size.height;
        final y2 = (baseY2 + progress * 100) % size.height;

        final distance = math.sqrt(math.pow(x - x2, 2) + math.pow(y - y2, 2));
        if (distance < 100) {
          canvas.drawLine(
            Offset(x, y),
            Offset(x2, y2),
            paint
              ..color = const Color(
                0xFF3B82F6,
              ).withOpacity(0.1 * (1 - distance / 100)),
          );
        }
      }

      canvas.drawCircle(
        Offset(x, y),
        radius,
        paint..color = const Color(0xFF3B82F6).withOpacity(0.5),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
