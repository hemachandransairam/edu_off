import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/syllabus_model.dart';
import '../utils/responsive.dart';

// --- STANDARD SELECTION SCREEN ---
class StandardSelectionScreen extends StatelessWidget {
  const StandardSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: responsive.padding(horizontal: 25.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: responsive.gap(20)),
              _buildHeaderIcon(context),
              SizedBox(height: responsive.gap(35)),
              Text(
                'Select Your\nNew Level',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: responsive.sp(42),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                  height: 1.1,
                ),
              ),
              SizedBox(height: responsive.gap(15)),
              Text(
                'Unlock tailored lessons for your grade',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: Colors.grey[600],
                  fontSize: responsive.sp(17),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: responsive.gap(50)),
              _buildStandardButton(
                context,
                'Explorer',
                'Standard 1',
                1,
                Colors.orange,
              ),
              SizedBox(height: responsive.gap(18)),
              _buildStandardButton(
                context,
                'Adventurer',
                'Standard 2',
                2,
                Colors.blue,
              ),
              SizedBox(height: responsive.gap(18)),
              _buildStandardButton(
                context,
                'Discoverer',
                'Standard 3',
                3,
                Colors.green,
              ),
              SizedBox(height: responsive.gap(18)),
              _buildStandardButton(
                context,
                'Scholar',
                'Standard 4',
                4,
                Colors.purple,
              ),
              SizedBox(height: responsive.gap(18)),
              _buildStandardButton(
                context,
                'Master',
                'Standard 5',
                5,
                Colors.indigo,
              ),
              SizedBox(height: responsive.gap(40)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(BuildContext context) {
    final responsive = Responsive(context);

    return Center(
      child: Container(
        padding: responsive.padding(all: 5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFF8B80F8), Color(0xFFFFC6A5)],
          ),
        ),
        child: Container(
          padding: responsive.padding(all: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.school_rounded,
            size: responsive.iconSize(50),
            color: const Color(0xFF1E293B),
          ),
        ),
      ),
    );
  }

  Widget _buildStandardButton(
    BuildContext context,
    String trait,
    String title,
    int std,
    Color color,
  ) {
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/avatar', arguments: std),
      child: Container(
        padding: responsive.padding(horizontal: 22, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: responsive.borderRadius(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: responsive.padding(all: 12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: responsive.borderRadius(18),
              ),
              child: Icon(
                Icons.stars_rounded,
                color: color,
                size: responsive.iconSize(28),
              ),
            ),
            SizedBox(width: responsive.gap(20)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trait,
                    style: GoogleFonts.outfit(
                      fontSize: responsive.sp(13),
                      color: color,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      fontSize: responsive.sp(20),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey,
              size: responsive.iconSize(24),
            ),
          ],
        ),
      ),
    );
  }
}

// --- AVATAR SELECTION SCREEN ---
class AvatarSelectionScreen extends StatefulWidget {
  final int standard;
  const AvatarSelectionScreen({super.key, required this.standard});

  @override
  State<AvatarSelectionScreen> createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  String? selectedAvatar;

  final List<Map<String, dynamic>> avatars = [
    {
      'id': 'husky',
      'icon': Icons.pets,
      'color': Colors.blueGrey,
      'name': 'Husky',
    },
    {
      'id': 'dog',
      'icon': Icons.cruelty_free,
      'color': Colors.orangeAccent,
      'name': 'Buddy',
    },
    {
      'id': 'penguin',
      'icon': Icons.ice_skating,
      'color': Colors.blue,
      'name': 'Pingo',
    },
    {
      'id': 'chick',
      'icon': Icons.egg,
      'color': Colors.yellow,
      'name': 'Chicky',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Choose Your Friend',
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
      body: Padding(
        padding: responsive.padding(all: 25.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.gridColumns(
                    mobile: 2,
                    tablet: 3,
                    desktop: 4,
                  ),
                  crossAxisSpacing: responsive.gap(20),
                  mainAxisSpacing: responsive.gap(20),
                  childAspectRatio: 0.9,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  final avatar = avatars[index];
                  final isSelected = selectedAvatar == avatar['id'];
                  final Color color = avatar['color'] as Color;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatar = avatar['id'] as String;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: responsive.borderRadius(35),
                        border: Border.all(
                          color: isSelected ? color : Colors.transparent,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                isSelected
                                    ? color.withOpacity(0.2)
                                    : Colors.black.withOpacity(0.04),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: responsive.padding(all: 20),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              avatar['icon'] as IconData,
                              size: responsive.iconSize(55),
                              color: color,
                            ),
                          ),
                          SizedBox(height: responsive.gap(15)),
                          Text(
                            avatar['name'] as String,
                            style: GoogleFonts.outfit(
                              fontSize: responsive.sp(18),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1E293B),
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check_circle,
                              color: const Color(0xFF8B80F8),
                              size: responsive.iconSize(24),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: responsive.gap(30)),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    selectedAvatar == null
                        ? null
                        : () {
                          Navigator.pushNamed(
                            context,
                            '/home',
                            arguments: {
                              'std': widget.standard,
                              'avatar': selectedAvatar,
                            },
                          );
                        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  padding: responsive.padding(vertical: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: responsive.borderRadius(25),
                  ),
                  elevation: 0,
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: Text(
                  'Start My Journey',
                  style: GoogleFonts.outfit(
                    fontSize: responsive.sp(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: responsive.gap(20)),
          ],
        ),
      ),
    );
  }
}

// --- SUBJECT SELECTION SCREEN ---
class SubjectSelectionScreen extends StatelessWidget {
  final int standard;
  final String mode;

  const SubjectSelectionScreen({
    super.key,
    required this.standard,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    final subjects = SyllabusModel.getSubjects();
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Select Subject',
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
      body: Padding(
        padding: responsive.padding(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.gap(10)),
            Text(
              'What do you want to\nlearn today?',
              style: GoogleFonts.outfit(
                fontSize: responsive.sp(28),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
                height: 1.2,
              ),
            ),
            SizedBox(height: responsive.gap(30)),
            Expanded(
              child: GridView.builder(
                padding: responsive.padding(bottom: 30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.gridColumns(
                    mobile: 2,
                    tablet: 3,
                    desktop: 4,
                  ),
                  crossAxisSpacing: responsive.gap(15),
                  mainAxisSpacing: responsive.gap(15),
                  childAspectRatio: 0.95,
                ),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return _buildSubjectCard(context, subject);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context, String subject) {
    final theme = _getSubjectTheme(subject);
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: () {
        if (mode == 'lessons') {
          Navigator.pushNamed(
            context,
            '/lessons_list',
            arguments: {'std': standard, 'subject': subject},
          );
        } else {
          Navigator.pushNamed(
            context,
            '/games_list',
            arguments: {'std': standard, 'subject': subject},
          );
        }
      },
      child: Container(
        padding: responsive.padding(all: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: responsive.borderRadius(30),
          boxShadow: [
            BoxShadow(
              color: theme['color'].withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                size: responsive.iconSize(35),
              ),
            ),
            SizedBox(height: responsive.gap(12)),
            Text(
              subject,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: responsive.sp(16),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getSubjectTheme(String subject) {
    switch (subject) {
      case 'Tamil':
        return {'icon': Icons.language_rounded, 'color': Colors.orange[400]};
      case 'English':
        return {'icon': Icons.abc_rounded, 'color': Colors.blue[400]};
      case 'Maths':
        return {'icon': Icons.calculate_rounded, 'color': Colors.green[400]};
      case 'EVS':
        return {
          'icon': Icons.nature_people_rounded,
          'color': Colors.orangeAccent,
        };
      case 'Art & Craft':
        return {'icon': Icons.palette_rounded, 'color': Colors.pink[400]};
      case 'Music':
        return {'icon': Icons.music_note_rounded, 'color': Colors.purple[400]};
      case 'PE':
        return {
          'icon': Icons.fitness_center_rounded,
          'color': Colors.teal[400],
        };
      default:
        return {'icon': Icons.book_rounded, 'color': Colors.grey[400]};
    }
  }
}

// --- GAMES LIST SCREEN ---
class GamesListScreen extends StatelessWidget {
  final int standard;
  final String subject;

  const GamesListScreen({
    super.key,
    required this.standard,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    final filteredGames = SyllabusModel.getFilteredContent(
      standard,
      subject,
      'games',
    );
    final topics =
        standard == 1
            ? SyllabusModel.getTopics(standard, subject)
            : <String, List<Map<String, dynamic>>>{};
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          '$subject Games',
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
      body:
          (filteredGames.isEmpty && topics.isEmpty)
              ? _buildEmptyState(subject)
              : standard == 1
              ? ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                itemCount: topics.length + filteredGames.length,
                itemBuilder: (context, index) {
                  if (index < topics.length) {
                    final topicName = topics.keys.elementAt(index);
                    final levels = topics[topicName]!;
                    return _buildTopicCard(context, topicName, levels);
                  } else {
                    final game = filteredGames[index - topics.length];
                    return _buildIndividualGameCard(context, game);
                  }
                },
              )
              : GridView.builder(
                padding: responsive.padding(all: 25),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.gridColumns(
                    mobile: 2,
                    tablet: 3,
                    desktop: 4,
                  ),
                  crossAxisSpacing: responsive.gap(15),
                  mainAxisSpacing: responsive.gap(15),
                  childAspectRatio: 0.88,
                ),
                itemCount: filteredGames.length,
                itemBuilder: (context, index) {
                  final game = filteredGames[index];
                  return _buildGameGridCard(context, game);
                },
              ),
    );
  }

  Widget _buildTopicCard(
    BuildContext context,
    String topicName,
    List<Map<String, dynamic>> levels,
  ) {
    final theme = _getSubjectTheme(subject);
    final responsive = Responsive(context);
    final currentLevel = 1;
    final totalLevels = levels.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
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
                  color: (theme['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  theme['icon'] as IconData,
                  color: theme['color'] as Color,
                  size: 26,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topicName,
                      style: GoogleFonts.outfit(
                        fontSize: responsive.sp(18),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      '$totalLevels Levels',
                      style: GoogleFonts.outfit(
                        color: Colors.grey[600],
                        fontSize: responsive.sp(13),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: CircularProgressIndicator(
                      value: currentLevel / totalLevels,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(theme['color']),
                      strokeWidth: 4,
                    ),
                  ),
                  Text(
                    '$currentLevel/$totalLevels',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/level_map',
                  arguments: {
                    'topicName': topicName,
                    'levels': levels,
                    'subject': subject,
                    'currentUnlockedLevel': currentLevel,
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: Text(
                'Play Adventure',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndividualGameCard(
    BuildContext context,
    Map<String, dynamic> game,
  ) {
    final theme = _getGameTheme(game);
    final responsive = Responsive(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (theme['color'] as Color).withOpacity(0.15),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              theme['icon'] as IconData,
              color: theme['color'] as Color,
              size: 26,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              game['title'] as String,
              style: GoogleFonts.outfit(
                fontSize: responsive.sp(17),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),
          IconButton(
            onPressed: () => _onGameTap(context, game),
            icon: const Icon(
              Icons.play_circle_fill_rounded,
              size: 45,
              color: Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameGridCard(BuildContext context, Map<String, dynamic> game) {
    final theme = _getGameTheme(game);
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: () => _onGameTap(context, game),
      child: Container(
        padding: responsive.padding(all: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: responsive.borderRadius(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: responsive.padding(all: 15),
              decoration: BoxDecoration(
                color: (theme['color'] as Color).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                theme['icon'] as IconData,
                size: responsive.iconSize(38),
                color: theme['color'] as Color,
              ),
            ),
            SizedBox(height: responsive.gap(12)),
            Text(
              game['title'] as String,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: responsive.sp(15),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _onGameTap(BuildContext context, Map<String, dynamic> game) {
    final type = game['type'];
    if (type == 'match') {
      Navigator.pushNamed(context, '/game_match', arguments: game['data']);
    } else if (type == 'fill_blanks') {
      Navigator.pushNamed(
        context,
        '/game_fill_blanks',
        arguments: game['data'],
      );
    } else if (type == 'compare') {
      Navigator.pushNamed(context, '/game_compare', arguments: game['data']);
    } else if (type == 'drag_drop') {
      Navigator.pushNamed(context, '/game_drag_drop', arguments: game['data']);
    } else {
      Navigator.pushNamed(context, game['route'] as String? ?? '/');
    }
  }

  Map<String, dynamic> _getGameTheme(Map<String, dynamic> game) {
    if (game.containsKey('color') && game.containsKey('icon')) {
      return {'color': game['color'], 'icon': game['icon']};
    }
    return _getSubjectTheme(game['subject'] as String);
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
      default:
        return {'icon': Icons.games_rounded, 'color': Colors.blueGrey};
    }
  }

  Widget _buildEmptyState(String subject) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.rocket_rounded,
              size: 80,
              color: Color(0xFF8B80F8),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Missions Launching Soon!',
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'We are preparing exciting games for $subject. Hang in there!',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(fontSize: 15, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}

// --- LESSONS LIST SCREEN (NOW SHOWS TOPICS WITH LEVEL MAPS) ---
class LessonsListScreen extends StatelessWidget {
  final int standard;
  final String subject;

  const LessonsListScreen({
    super.key,
    required this.standard,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          '$subject Gallery',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body:
          standard == 1 ? _buildBookLibrary(context) : _buildTopicList(context),
    );
  }

  Widget _buildTopicList(BuildContext context) {
    final topics = SyllabusModel.getTopics(standard, subject);
    return topics.isEmpty
        ? _buildEmptyLessons(subject)
        : ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            final topicName = topics.keys.elementAt(index);
            final levels = topics[topicName]!;
            return _buildTopicCard(context, topicName, levels);
          },
        );
  }

  Widget _buildBookLibrary(BuildContext context) {
    final theme = _getTheme(subject);

    // Placeholder books for Standard 1
    final books = [
      {
        'title': '$subject Textbook',
        'term': 'Term 1',
        'icon': Icons.menu_book_rounded,
        'url':
            subject == 'English'
                ? 'https://drive.google.com/file/d/1h1AWWPrB3l1YGT3x_xlr02WtKVLEafv5/view?usp=drive_link'
                : '',
      },
      {
        'title': '$subject Textbook',
        'term': 'Term 2',
        'icon': Icons.menu_book_rounded,
        'url': '',
      },
      {
        'title': '$subject Textbook',
        'term': 'Term 3',
        'icon': Icons.menu_book_rounded,
        'url': '',
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: (theme['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.library_books_rounded,
                  color: theme['color'] as Color,
                  size: 30,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Read your school books here!',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: (theme['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        book['icon'] as IconData,
                        color: theme['color'] as Color,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book['title'] as String,
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: const Color(0xFF1E293B),
                            ),
                          ),
                          Text(
                            book['term'] as String,
                            style: GoogleFonts.outfit(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (book['url'] != '') {
                          Navigator.pushNamed(
                            context,
                            '/book_viewer',
                            arguments: {
                              'url': book['url'],
                              'title': '${book['term']} ${book['title']}',
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'This book content is coming soon!',
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E293B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: const Text('Read'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTopicCard(
    BuildContext context,
    String topicName,
    List<Map<String, dynamic>> levels,
  ) {
    final theme = _getTheme(subject);
    final responsive = Responsive(context);

    // Calculate progress (for now, assume level 1 is unlocked)
    final currentLevel = 1; // TODO: Load from user progress
    final totalLevels = levels.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
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
                  color: (theme['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  theme['icon'] as IconData,
                  color: theme['color'] as Color,
                  size: 26,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topicName,
                      style: GoogleFonts.outfit(
                        fontSize: responsive.sp(18),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '$totalLevels Levels',
                      style: GoogleFonts.outfit(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        fontSize: responsive.sp(13),
                      ),
                    ),
                  ],
                ),
              ),
              // Progress indicator
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      value: currentLevel / totalLevels,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme['color'] as Color,
                      ),
                      strokeWidth: 4,
                    ),
                  ),
                  Text(
                    '$currentLevel/$totalLevels',
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            levels.first['description'] as String? ??
                'Complete all levels to master this topic!',
            style: GoogleFonts.outfit(
              color: Colors.grey[600],
              height: 1.5,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to level map
                Navigator.pushNamed(
                  context,
                  '/level_map',
                  arguments: {
                    'topicName': topicName,
                    'levels': levels,
                    'subject': subject,
                    'currentUnlockedLevel': currentLevel,
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: Text(
                'Start Adventure',
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getTheme(String subject) {
    switch (subject) {
      case 'Tamil':
        return {'icon': Icons.language_rounded, 'color': Colors.orange[400]};
      case 'English':
        return {'icon': Icons.abc_rounded, 'color': Colors.blue[400]};
      case 'Maths':
        return {'icon': Icons.calculate_rounded, 'color': Colors.green[400]};
      case 'EVS':
        return {
          'icon': Icons.nature_people_rounded,
          'color': Colors.orangeAccent,
        };
      case 'Art & Craft':
        return {'icon': Icons.palette_rounded, 'color': Colors.pink[400]};
      case 'Music':
        return {'icon': Icons.music_note_rounded, 'color': Colors.purple[400]};
      case 'PE':
        return {
          'icon': Icons.fitness_center_rounded,
          'color': Colors.teal[400],
        };
      default:
        return {'icon': Icons.auto_stories_rounded, 'color': Colors.blueGrey};
    }
  }

  Widget _buildEmptyLessons(String subject) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.auto_stories_rounded,
              size: 80,
              color: Color(0xFF8B80F8),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Library Restocking!',
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'We are adding more lessons for $subject. Check back soon for new stories!',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(fontSize: 15, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}

// --- TOPICS LIST SCREEN ---
class TopicsListScreen extends StatelessWidget {
  final int standard;
  final String subject;

  const TopicsListScreen({
    super.key,
    required this.standard,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    // Get topics for this subject from std1Topics
    final topics = _getTopicsForSubject(subject);
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          '$subject Topics',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body:
          topics.isEmpty
              ? _buildEmptyState(subject)
              : GridView.builder(
                padding: responsive.padding(all: 25),
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.gridColumns(
                    mobile: 2,
                    tablet: 3,
                    desktop: 4,
                  ),
                  crossAxisSpacing: responsive.gap(20),
                  mainAxisSpacing: responsive.gap(20),
                  childAspectRatio: 0.85,
                ),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  final topicName = topics.keys.elementAt(index);
                  final levels = topics[topicName]!;
                  return _buildTopicCard(context, topicName, levels);
                },
              ),
    );
  }

  Widget _buildTopicCard(
    BuildContext context,
    String topicName,
    List<Map<String, dynamic>> levels,
  ) {
    final theme = _getTheme(subject);
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/level_map',
          arguments: {
            'topicName': topicName,
            'levels': levels,
            'subject': subject,
            'currentUnlockedLevel': 1, // TODO: Load from user progress
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: responsive.borderRadius(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: responsive.padding(all: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: responsive.padding(all: 15),
                decoration: BoxDecoration(
                  color: (theme['color'] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  theme['icon'] as IconData,
                  color: theme['color'] as Color,
                  size: responsive.iconSize(35),
                ),
              ),
              SizedBox(height: responsive.gap(12)),
              Text(
                topicName,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                  fontSize: responsive.sp(15),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                  height: 1.2,
                ),
              ),
              SizedBox(height: responsive.gap(8)),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: (theme['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${levels.length} Levels',
                  style: GoogleFonts.outfit(
                    fontSize: responsive.sp(11),
                    fontWeight: FontWeight.bold,
                    color: theme['color'] as Color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, List<Map<String, dynamic>>> _getTopicsForSubject(String subject) {
    return SyllabusModel.getTopics(standard, subject);
  }

  Map<String, dynamic> _getTheme(String subject) {
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

  Widget _buildEmptyState(String subject) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.auto_stories_rounded,
              size: 80,
              color: Color(0xFF8B80F8),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Topics Coming Soon!',
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'We are preparing exciting topics for $subject. Stay tuned!',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(fontSize: 15, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
