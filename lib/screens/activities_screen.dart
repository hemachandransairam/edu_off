import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive.dart';
import 'tracing_screen.dart';
import 'drawing_screen.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  String? selectedLanguage;
  String? selectedTopic;
  String? selectedActivity;

  final Map<String, List<String>> languageTopics = {
    'Tamil': ['Uyir Ezhuthukal (Vowels)', 'Mei Ezhuthukal (Consonants)'],
    'English': ['Alphabets (A-Z)', 'Numbers (1-10)'],
  };

  final Map<String, Map<String, List<String>>> topicLetters = {
    'Tamil': {
      'Uyir Ezhuthukal (Vowels)': [
        'அ',
        'ஆ',
        'இ',
        'ஈ',
        'உ',
        'ஊ',
        'எ',
        'ஏ',
        'ஐ',
        'ஒ',
        'ஓ',
        'ஔ',
      ],
      'Mei Ezhuthukal (Consonants)': [
        'க்',
        'ங்',
        'ச்',
        'ஞ்',
        'ட்',
        'ண்',
        'த்',
        'ந்',
        'ப்',
        'ம்',
        'ய்',
        'ர்',
        'ல்',
        'வ்',
        'ழ்',
        'ள்',
        'ற்',
        'ன்',
      ],
    },
    'English': {
      'Alphabets (A-Z)': [
        'A',
        'B',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I',
        'J',
        'K',
        'L',
        'M',
        'N',
        'O',
        'P',
        'Q',
        'R',
        'S',
        'T',
        'U',
        'V',
        'W',
        'X',
        'Y',
        'Z',
      ],
      'Numbers (1-10)': ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
    },
  };

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Activities',
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: responsive.padding(all: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Activity Type Selection
            Text(
              'Choose Activity',
              style: GoogleFonts.outfit(
                fontSize: responsive.sp(24),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
            SizedBox(height: responsive.gap(20)),
            Row(
              children: [
                Expanded(
                  child: _buildActivityCard(
                    context,
                    'Letter Tracing',
                    Icons.gesture_rounded,
                    Colors.blue,
                    'tracing',
                    responsive,
                  ),
                ),
                SizedBox(width: responsive.gap(15)),
                Expanded(
                  child: _buildActivityCard(
                    context,
                    'Free Drawing',
                    Icons.brush_rounded,
                    Colors.purple,
                    'drawing',
                    responsive,
                  ),
                ),
              ],
            ),

            if (selectedActivity == 'tracing') ...[
              SizedBox(height: responsive.gap(30)),

              // Language Selection
              Text(
                'Select Language',
                style: GoogleFonts.outfit(
                  fontSize: responsive.sp(20),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
              SizedBox(height: responsive.gap(15)),
              Wrap(
                spacing: responsive.gap(10),
                runSpacing: responsive.gap(10),
                children:
                    languageTopics.keys.map((language) {
                      final isSelected = selectedLanguage == language;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLanguage = language;
                            selectedTopic = null;
                          });
                        },
                        child: Container(
                          padding: responsive.padding(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? const Color(0xFF8B80F8)
                                    : Colors.white,
                            borderRadius: responsive.borderRadius(20),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? const Color(0xFF8B80F8)
                                      : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            language,
                            style: GoogleFonts.outfit(
                              fontSize: responsive.sp(16),
                              fontWeight: FontWeight.w600,
                              color:
                                  isSelected
                                      ? Colors.white
                                      : const Color(0xFF1E293B),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),

              if (selectedLanguage != null) ...[
                SizedBox(height: responsive.gap(30)),

                // Topic Selection
                Text(
                  'Select Topic',
                  style: GoogleFonts.outfit(
                    fontSize: responsive.sp(20),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: responsive.gap(15)),
                ...languageTopics[selectedLanguage]!.map((topic) {
                  final isSelected = selectedTopic == topic;
                  return Padding(
                    padding: responsive.padding(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTopic = topic;
                        });
                      },
                      child: Container(
                        padding: responsive.padding(all: 15),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? const Color(0xFF8B80F8).withOpacity(0.1)
                                  : Colors.white,
                          borderRadius: responsive.borderRadius(15),
                          border: Border.all(
                            color:
                                isSelected
                                    ? const Color(0xFF8B80F8)
                                    : Colors.grey[300]!,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.school_rounded,
                              color:
                                  isSelected
                                      ? const Color(0xFF8B80F8)
                                      : Colors.grey[600],
                              size: responsive.iconSize(24),
                            ),
                            SizedBox(width: responsive.gap(12)),
                            Expanded(
                              child: Text(
                                topic,
                                style: GoogleFonts.outfit(
                                  fontSize: responsive.sp(16),
                                  fontWeight: FontWeight.w600,
                                  color:
                                      isSelected
                                          ? const Color(0xFF8B80F8)
                                          : const Color(0xFF1E293B),
                                ),
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
                    ),
                  );
                }).toList(),
              ],

              if (selectedTopic != null) ...[
                SizedBox(height: responsive.gap(30)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => TracingScreen(
                                language: selectedLanguage!,
                                topic: selectedTopic!,
                                letters:
                                    topicLetters[selectedLanguage]![selectedTopic]!,
                              ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B80F8),
                      foregroundColor: Colors.white,
                      padding: responsive.padding(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: responsive.borderRadius(20),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          size: responsive.iconSize(28),
                        ),
                        SizedBox(width: responsive.gap(8)),
                        Text(
                          'Start Tracing',
                          style: GoogleFonts.outfit(
                            fontSize: responsive.sp(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],

            if (selectedActivity == 'drawing') ...[
              SizedBox(height: responsive.gap(30)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DrawingScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: responsive.padding(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: responsive.borderRadius(20),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.brush_rounded, size: responsive.iconSize(28)),
                      SizedBox(width: responsive.gap(8)),
                      Text(
                        'Start Drawing',
                        style: GoogleFonts.outfit(
                          fontSize: responsive.sp(18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            SizedBox(height: responsive.gap(40)),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String activityType,
    Responsive responsive,
  ) {
    final isSelected = selectedActivity == activityType;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedActivity = activityType;
          if (activityType == 'drawing') {
            selectedLanguage = null;
            selectedTopic = null;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: responsive.padding(all: 20),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: responsive.borderRadius(20),
          border: Border.all(
            color: isSelected ? color : Colors.grey[300]!,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  isSelected
                      ? color.withOpacity(0.3)
                      : Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: responsive.padding(all: 15),
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? Colors.white.withOpacity(0.2)
                        : color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : color,
                size: responsive.iconSize(40),
              ),
            ),
            SizedBox(height: responsive.gap(12)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: responsive.sp(16),
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
