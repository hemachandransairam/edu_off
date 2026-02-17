import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/responsive.dart';

class LevelMapScreen extends StatefulWidget {
  final String topicName;
  final List<Map<String, dynamic>> levels;
  final String subject;
  final int currentUnlockedLevel;

  const LevelMapScreen({
    super.key,
    required this.topicName,
    required this.levels,
    required this.subject,
    this.currentUnlockedLevel = 1,
  });

  @override
  State<LevelMapScreen> createState() => _LevelMapScreenState();
}

class _LevelMapScreenState extends State<LevelMapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int unlockedLevel = 1;

  @override
  void initState() {
    super.initState();
    unlockedLevel = widget.currentUnlockedLevel;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = _getSubjectTheme(widget.subject);
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          widget.topicName,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: responsive.sp(20),
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: Stack(
        children: [
          // Background decorations
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: responsive.value(
                mobile: 200.0,
                tablet: 250.0,
                desktop: 300.0,
              ),
              height: responsive.value(
                mobile: 200.0,
                tablet: 250.0,
                desktop: 300.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme['color'].withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: responsive.value(
                mobile: 250.0,
                tablet: 300.0,
                desktop: 350.0,
              ),
              height: responsive.value(
                mobile: 250.0,
                tablet: 300.0,
                desktop: 350.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme['color'].withOpacity(0.05),
              ),
            ),
          ),
          // Level map
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: responsive.padding(all: 20.0),
                  child: Column(
                    children: [
                      // Topic header
                      Container(
                        padding: responsive.padding(all: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: responsive.borderRadius(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: responsive.padding(all: 15),
                              decoration: BoxDecoration(
                                color: theme['color'].withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                theme['icon'],
                                color: theme['color'],
                                size: responsive.iconSize(30),
                              ),
                            ),
                            SizedBox(width: responsive.gap(15)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.topicName,
                                    style: GoogleFonts.outfit(
                                      fontSize: responsive.sp(20),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1E293B),
                                    ),
                                  ),
                                  SizedBox(height: responsive.gap(5)),
                                  Text(
                                    'Level $unlockedLevel of ${widget.levels.length}',
                                    style: GoogleFonts.outfit(
                                      fontSize: responsive.sp(14),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CircularProgressIndicator(
                              value: unlockedLevel / widget.levels.length,
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                theme['color'],
                              ),
                              strokeWidth: 6,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsive.gap(40)),
                      // Level path
                      _buildLevelPath(theme),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLevelPath(Map<String, dynamic> theme) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: CustomPaint(
        painter: PathPainter(
          levelCount: widget.levels.length,
          pathColor: theme['color'].withOpacity(0.3),
        ),
        child: Stack(
          children: List.generate(
            widget.levels.length,
            (index) => _buildLevelNode(index, theme),
          ),
        ),
      ),
    );
  }

  Widget _buildLevelNode(int index, Map<String, dynamic> theme) {
    final responsive = Responsive(context);
    final levelNumber = index + 1;
    final isUnlocked = levelNumber <= unlockedLevel;
    final isCurrent = levelNumber == unlockedLevel;
    final isCompleted = levelNumber < unlockedLevel;

    // Calculate position in a winding path - improved spacing
    final double progress = index / (widget.levels.length - 1);
    final double verticalPosition = progress * 0.8 + 0.05; // Add top padding

    // Create a more dramatic winding horizontal offset (zigzag pattern)
    final double horizontalOffset = math.sin(index * 1.2) * 0.3;
    final double leftPosition = 0.5 + horizontalOffset;

    final nodeSize = responsive.value(
      mobile: 85.0,
      tablet: 100.0,
      desktop: 115.0,
    );
    final currentNodeSize = responsive.value(
      mobile: 95.0,
      tablet: 110.0,
      desktop: 125.0,
    );

    return Positioned(
      left: MediaQuery.of(context).size.width * leftPosition - (nodeSize / 2),
      top: MediaQuery.of(context).size.height * 0.65 * verticalPosition,
      child: GestureDetector(
        onTap:
            isUnlocked
                ? () => _onLevelTap(index, theme)
                : () => _showLockedMessage(),
        child: Column(
          children: [
            // Level circle - larger and more prominent
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isCurrent ? currentNodeSize : nodeSize,
              height: isCurrent ? currentNodeSize : nodeSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                    isUnlocked
                        ? LinearGradient(
                          colors: [
                            theme['color'],
                            (theme['color'] as Color).withOpacity(0.7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                        : null,
                color: isUnlocked ? null : Colors.grey[300],
                boxShadow: [
                  if (isUnlocked)
                    BoxShadow(
                      color: theme['color'].withOpacity(0.5),
                      blurRadius: isCurrent ? 25 : 15,
                      spreadRadius: isCurrent ? 8 : 3,
                    ),
                ],
                border: Border.all(color: Colors.white, width: 5),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Pulsing animation for current level
                  if (isCurrent)
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Container(
                          width:
                              currentNodeSize +
                              (_animationController.value * 25),
                          height:
                              currentNodeSize +
                              (_animationController.value * 25),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme['color'].withOpacity(
                                0.8 - (_animationController.value * 0.8),
                              ),
                              width: 4,
                            ),
                          ),
                        );
                      },
                    ),
                  // Level content
                  if (isCompleted)
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: responsive.iconSize(45),
                    )
                  else if (isUnlocked)
                    Text(
                      '$levelNumber',
                      style: GoogleFonts.outfit(
                        fontSize: responsive.sp(36),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  else
                    Icon(
                      Icons.lock,
                      color: Colors.grey[500],
                      size: responsive.iconSize(38),
                    ),
                ],
              ),
            ),
            SizedBox(height: responsive.gap(12)),
            // Level label
            Container(
              padding: responsive.padding(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: responsive.borderRadius(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'Level $levelNumber',
                style: GoogleFonts.outfit(
                  fontSize: responsive.sp(13),
                  fontWeight: FontWeight.bold,
                  color: isUnlocked ? theme['color'] : Colors.grey[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLevelTap(int index, Map<String, dynamic> theme) async {
    final level = widget.levels[index];
    final type = level['type'];

    // Navigate to the appropriate game screen and wait for result
    bool? completed;

    if (type == 'match') {
      completed =
          await Navigator.pushNamed(
                context,
                '/game_match',
                arguments: level['data'],
              )
              as bool?;
    } else if (type == 'fill_blanks') {
      completed =
          await Navigator.pushNamed(
                context,
                '/game_fill_blanks',
                arguments: level['data'],
              )
              as bool?;
    } else if (type == 'compare') {
      completed =
          await Navigator.pushNamed(
                context,
                '/game_compare',
                arguments: level['data'],
              )
              as bool?;
    } else if (type == 'drag_drop') {
      completed =
          await Navigator.pushNamed(
                context,
                '/game_drag_drop',
                arguments: level['data'],
              )
              as bool?;
    }

    // Only unlock next level if the game was actually completed
    if (completed == true) {
      _onLevelComplete(index);
    }
  }

  void _onLevelComplete(int index) {
    // Unlock next level if current level was just completed
    if (index + 1 == unlockedLevel && unlockedLevel < widget.levels.length) {
      setState(() {
        unlockedLevel++;
      });
      _showLevelUnlockedDialog();
    }
  }

  void _showLevelUnlockedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Row(
              children: [
                const Icon(
                  Icons.celebration,
                  color: Color(0xFF8B80F8),
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  'Level Unlocked!',
                  style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: Text(
              'Great job! Level $unlockedLevel is now unlocked!',
              style: GoogleFonts.outfit(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Continue',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B80F8),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  void _showLockedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Complete previous levels to unlock this one!',
          style: GoogleFonts.outfit(),
        ),
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Map<String, dynamic> _getSubjectTheme(String subject) {
    switch (subject) {
      case 'Tamil':
        return {'icon': Icons.language_rounded, 'color': Colors.orange[400]!};
      case 'English':
        return {'icon': Icons.abc_rounded, 'color': Colors.blue[400]!};
      case 'Maths':
        return {'icon': Icons.calculate_rounded, 'color': Colors.green[400]!};
      case 'EVS':
        return {
          'icon': Icons.nature_people_rounded,
          'color': Colors.orangeAccent,
        };
      case 'Art & Craft':
        return {'icon': Icons.palette_rounded, 'color': Colors.pink[400]!};
      case 'Music':
        return {'icon': Icons.music_note_rounded, 'color': Colors.purple[400]!};
      case 'PE':
        return {
          'icon': Icons.fitness_center_rounded,
          'color': Colors.teal[400]!,
        };
      default:
        return {'icon': Icons.book_rounded, 'color': Colors.grey[400]!};
    }
  }
}

// Custom painter for the winding path between levels
class PathPainter extends CustomPainter {
  final int levelCount;
  final Color pathColor;

  PathPainter({required this.levelCount, required this.pathColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = pathColor
          ..strokeWidth = 6
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final path = Path();

    for (int i = 0; i < levelCount - 1; i++) {
      final double progress1 = i / (levelCount - 1);
      final double progress2 = (i + 1) / (levelCount - 1);

      final double horizontalOffset1 = math.sin(i * 1.2) * 0.3;
      final double horizontalOffset2 = math.sin((i + 1) * 1.2) * 0.3;

      final double x1 = size.width * (0.5 + horizontalOffset1);
      final double y1 = size.height * (progress1 * 0.8 + 0.05);

      final double x2 = size.width * (0.5 + horizontalOffset2);
      final double y2 = size.height * (progress2 * 0.8 + 0.05);

      if (i == 0) {
        path.moveTo(x1, y1);
      }

      // Create a smoother curved path
      final controlX = (x1 + x2) / 2;
      final controlY = (y1 + y2) / 2;
      path.quadraticBezierTo(controlX, controlY, x2, y2);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
