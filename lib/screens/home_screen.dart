import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../services/data_service.dart';
import 'auth_screen.dart'; // To access ProfilePage if needed or Logout
import 'selection_screens.dart';

class HomeScreen extends StatefulWidget {
  final int standard;
  final String avatar;

  const HomeScreen({super.key, required this.standard, required this.avatar});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  Map<String, dynamic>? _userData;
  late int _currentStandard;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    DataService.syncOfflineData(); // Auto-sync on home load
  }

  void _loadUserData() {
    final box = Hive.box('studentBox');
    final settingsBox = Hive.box('settingsBox');
    final email = settingsBox.get('last_user_email');

    final rawData = box.get(email);

    if (rawData is Map) {
      _userData = Map<String, dynamic>.from(rawData);
      String std = _userData?['standard'] ?? 'Class 1';
      _currentStandard = int.tryParse(std.replaceAll('Class ', '')) ?? 1;
    } else {
      // Fallback
      _userData = {};
      _currentStandard = widget.standard;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF), // Soft lavender background
      body: _buildBody(),
      bottomNavigationBar: _buildFloatingBottomNav(),
      extendBody: true, // Allows content to flow behind the bottom nav
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildSubjectSelectionTab('lessons');
      case 2:
        return _buildSubjectSelectionTab('games');
      case 3:
        return ProfilePage(
          userData: _userData ?? {},
          onUpdate: () => setState(() => _loadUserData()),
        );
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          _buildHeader(),
          const SizedBox(height: 25),
          _buildLevelCard(),
          const SizedBox(height: 30),
          _buildCategoryNav(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildDashboardByStandard(),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Container(
                color: const Color(0xFFFFC6A5),
                child: Icon(
                  _getAvatarIcon(widget.avatar),
                  color: const Color(0xFF1E293B),
                  size: 35,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${_userData?['name'] ?? 'Marion'}',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.av_timer_rounded,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Progress 10%',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: Color(0xFF1E293B),
                  size: 26,
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8B80F8), Color(0xFF6B58F2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B80F8).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Level $_currentStandard',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'This is your first step to greatness!',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 25),
              _buildProgressBar(),
            ],
          ),
          Positioned(
            right: -10,
            top: -45,
            child: Icon(
              Icons.emoji_events_rounded,
              size: 100,
              color: Colors.amber[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      height: 12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          FractionallySizedBox(
            widthFactor: 0.1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - 90) * 0.1,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC6A5),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryNav() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildCategoryItem(
            'Lessons',
            Icons.menu_book_rounded,
            const Color(0xFFC7D2FE),
          ),
          _buildCategoryItem(
            'Games',
            Icons.videogame_asset_rounded,
            const Color(0xFFFED7AA),
          ),
          _buildCategoryItem(
            'Stories',
            Icons.auto_stories_rounded,
            const Color(0xFFBCF0DA),
          ),
          _buildCategoryItem(
            'Activities',
            Icons.brush_rounded,
            const Color(0xFFFBCFE8),
          ),
          _buildCategoryItem(
            'Discover',
            Icons.travel_explore_rounded,
            const Color(0xFFFDE68A),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectSelectionTab(String mode) {
    return SubjectSelectionScreen(standard: _currentStandard, mode: mode);
  }

  Widget _buildDashboardByStandard() {
    return Column(
      children: [
        _buildSectionCard(
          'Lessons',
          'Fun learning lessons that help kids grow smarter daily.',
          Icons.menu_book_outlined,
          const Color(0xFFF1F5F9),
          () => setState(() => _currentIndex = 1),
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          'Games',
          'Interactive games designed to make education exciting.',
          Icons.videogame_asset_outlined,
          const Color(0xFFF1F5F9),
          () => setState(() => _currentIndex = 2),
        ),
      ],
    );
  }

  Widget _buildSectionCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B80F8).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          color: const Color(0xFF8B80F8),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: GoogleFonts.outfit(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    subtitle,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF1E293B),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.north_east_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingBottomNav() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.home_rounded),
          _buildNavItem(1, Icons.menu_book_rounded),
          _buildNavItem(2, Icons.hourglass_empty_rounded),
          _buildNavItem(3, Icons.person_outline_rounded),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFFFC6A5) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          icon,
          color: isActive ? const Color(0xFF1E293B) : Colors.white60,
          size: 28,
        ),
      ),
    );
  }

  IconData _getAvatarIcon(String avatar) {
    switch (avatar) {
      case 'husky':
        return Icons.pets;
      case 'dog':
        return Icons.cruelty_free;
      case 'penguin':
        return Icons.ice_skating;
      case 'chick':
        return Icons.egg;
      default:
        return Icons.face;
    }
  }
}
