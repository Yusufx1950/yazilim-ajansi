import 'package:flutter/material.dart';

class BlogPost {
  final String id;
  final String title;
  final String summary;
  final String imageUrl;
  final String category;
  final String authorName;
  final String authorImage;
  final int readTime;
  final DateTime date;
  final bool isFeatured;

  BlogPost({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.category,
    required this.authorName,
    required this.authorImage,
    required this.readTime,
    required this.date,
    this.isFeatured = false,
  });
}

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isCollapsed = false;
  String _selectedCategory = 'Tümü';

  // Dark Theme Renkleri
  final Color _bgColor = const Color(0xFF0B0F19);
  final Color _cardColor = const Color(0xFF151B2B);
  final Color _accentColor = const Color(0xFF6C63FF);
  final Color _accentCyan = const Color(0xFF00D4FF);
  final Color _textPrimary = Colors.white;
  final Color _textSecondary = const Color(0xFF94A3B8);

  final List<String> categories = [
    'Tümü',
    'Teknoloji',
    'Tasarım',
    'Yaşam',
    'Seyahat',
    'Yemek',
  ];

  final List<BlogPost> posts = [
    BlogPost(
      id: '1',
      title: '2024\'te UI Tasarım Trendleri',
      summary:
          'Glassmorphism, 3D elementler ve mikro-interaksiyonlar hakkında her şey. Modern arayüz tasarımının geleceği.',
      imageUrl:
          'https://images.unsplash.com/photo-1561070791-2526d30994b5?w=800',
      category: 'Tasarım',
      authorName: 'Selin Yılmaz',
      authorImage: 'https://i.pravatar.cc/150?img=1',
      readTime: 5,
      date: DateTime.now().subtract(const Duration(days: 2)),
      isFeatured: true,
    ),
    BlogPost(
      id: '2',
      title: 'Flutter ile Performans Optimizasyonu',
      summary:
          'Uygulamanızı hızlandırmak için bilmeniz gereken 10 temel teknik.',
      imageUrl:
          'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=800',
      category: 'Teknoloji',
      authorName: 'Ahmet Kaya',
      authorImage: 'https://i.pravatar.cc/150?img=3',
      readTime: 8,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    BlogPost(
      id: '3',
      title: 'Minimalist Yaşam Rehberi',
      summary:
          'Daha az eşya, daha çok mutluluk. Minimalist yaşamın incelikleri.',
      imageUrl:
          'https://images.unsplash.com/photo-1494438639946-1ebd1d20bf85?w=800',
      category: 'Yaşam',
      authorName: 'Zeynep Demir',
      authorImage: 'https://i.pravatar.cc/150?img=5',
      readTime: 6,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    BlogPost(
      id: '4',
      title: 'Kyoto\'da Bir Hafta',
      summary:
          'Japonya\'nın geleneksel başkentinde geçirdiğim unutulmaz bir hafta.',
      imageUrl:
          'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
      category: 'Seyahat',
      authorName: 'Mehmet Yılmaz',
      authorImage: 'https://i.pravatar.cc/150?img=8',
      readTime: 12,
      date: DateTime.now().subtract(const Duration(days: 7)),
    ),
    BlogPost(
      id: '5',
      title: 'Ev Yapımı İtalyan Makarna',
      summary: 'Taze makarna yapmanın püf noktaları ve en iyi sos tarifleri.',
      imageUrl:
          'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=800',
      category: 'Yemek',
      authorName: 'Ayşe Kara',
      authorImage: 'https://i.pravatar.cc/150?img=9',
      readTime: 7,
      date: DateTime.now().subtract(const Duration(days: 8)),
    ),
    BlogPost(
      id: '6',
      title: 'Yapay Zeka ve Etik',
      summary:
          'Gelişen AI teknolojileri karşısında karşılaştığımız ahlaki ikilemler.',
      imageUrl:
          'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800',
      category: 'Teknoloji',
      authorName: 'Can Toprak',
      authorImage: 'https://i.pravatar.cc/150?img=11',
      readTime: 10,
      date: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _isCollapsed =
              _scrollController.hasClients &&
              _scrollController.offset > (300 - kToolbarHeight);
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<BlogPost> get filteredPosts {
    if (_selectedCategory == 'Tümü') return posts;
    return posts.where((post) => post.category == _selectedCategory).toList();
  }

  BlogPost? get featuredPost {
    try {
      return posts.firstWhere((post) => post.isFeatured);
    } catch (e) {
      return null;
    }
  }

  // Responsive helper
  int getCrossAxisCount(double width) {
    if (width < 600) return 1; // Mobile
    if (width < 1100) return 2; // Tablet
    return 3; // Desktop
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = getCrossAxisCount(constraints.maxWidth);
          final isMobile = constraints.maxWidth < 600;

          return CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Dark SliverAppBar
              SliverAppBar(
                expandedHeight: isMobile ? 280 : 320,
                pinned: true,
                floating: false,
                elevation: _isCollapsed ? 4 : 0,
                backgroundColor: _isCollapsed ? _cardColor : Colors.transparent,
                iconTheme: IconThemeData(color: _textPrimary),
                flexibleSpace: FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isCollapsed ? 1 : 0,
                    child: Text(
                      'Blog',
                      style: TextStyle(
                        color: _textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          _accentColor,
                          _accentColor.withBlue(200),
                          _bgColor,
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Decorative circles
                        Positioned(
                          top: -50,
                          right: -50,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          left: -30,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _accentCyan.withOpacity(0.2),
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.all(isMobile ? 20 : 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.edit_note_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Daily Blog',
                                            style: TextStyle(
                                              color: _textPrimary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.search_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  'Keşfet,\nÖğren,\nİlham Al',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isMobile ? 28 : 36,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                SizedBox(height: isMobile ? 8 : 12),
                                Text(
                                  'Teknoloji, tasarım ve yaşam üzerine düşünceler',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: isMobile ? 14 : 16,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Categories
              SliverToBoxAdapter(
                child: Container(
                  height: 70,
                  color: _bgColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 24,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = category == _selectedCategory;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
                              });
                            },
                            borderRadius: BorderRadius.circular(25),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? _accentColor : _cardColor,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: isSelected
                                      ? _accentColor
                                      : Colors.white.withOpacity(0.1),
                                ),
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(
                                      color: _accentColor.withOpacity(0.4),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                ],
                              ),
                              child: Text(
                                category,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : _textSecondary,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Featured Post
              if (featuredPost != null && _selectedCategory == 'Tümü')
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 16 : 24),
                    child: _buildFeaturedCard(featuredPost!, isMobile),
                  ),
                ),

              // Section Title
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Son Yazılar',
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 22,
                          fontWeight: FontWeight.bold,
                          color: _textPrimary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Tümünü Gör',
                          style: TextStyle(
                            color: _accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // Responsive Blog Grid
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: isMobile ? 12 : 16,
                    crossAxisSpacing: isMobile ? 12 : 16,
                    childAspectRatio: isMobile ? 0.85 : 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final post = filteredPosts[index];
                    return _buildBlogCard(post, isMobile);
                  }, childCount: filteredPosts.length),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          );
        },
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_accentColor, _accentColor.withOpacity(0.8)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _accentColor.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          icon: const Icon(Icons.add_rounded, color: Colors.white),
          label: const Text(
            'Yazı Ekle',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // BottomNavigationBar KALDIRILDI
    );
  }

  Widget _buildFeaturedCard(BlogPost post, bool isMobile) {
    return Hero(
      tag: 'featured-${post.id}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(24),
          child: Container(
            height: isMobile ? 350 : 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                children: [
                  Image.network(
                    post.imageUrl,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, _bgColor.withOpacity(0.9)],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(isMobile ? 20 : 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _accentColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            post.category,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: isMobile ? 8 : 12),
                        Text(
                          post.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 24,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: isMobile ? 8 : 12),
                        Text(
                          post.summary,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: isMobile ? 13 : 14,
                            height: 1.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: isMobile ? 12 : 16),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: isMobile ? 14 : 16,
                              backgroundImage: NetworkImage(post.authorImage),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              post.authorName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: isMobile ? 13 : 14,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.white.withOpacity(0.7),
                              size: isMobile ? 14 : 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${post.readTime} dk',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBlogCard(BlogPost post, bool isMobile) {
    return Hero(
      tag: 'post-${post.id}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(post.imageUrl, fit: BoxFit.cover),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: _accentColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              post.category,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 12 : 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: TextStyle(
                            fontSize: isMobile ? 15 : 16,
                            fontWeight: FontWeight.bold,
                            color: _textPrimary,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: isMobile ? 6 : 8),
                        Text(
                          post.summary,
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 13,
                            color: _textSecondary,
                            height: 1.4,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: isMobile ? 10 : 12,
                              backgroundImage: NetworkImage(post.authorImage),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                post.authorName,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: _textSecondary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              Icons.access_time_rounded,
                              size: 14,
                              color: _textSecondary.withOpacity(0.7),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${post.readTime} dk',
                              style: TextStyle(
                                fontSize: 11,
                                color: _textSecondary.withOpacity(0.7),
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
      ),
    );
  }
}
