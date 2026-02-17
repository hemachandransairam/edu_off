import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Std3Dashboard extends StatelessWidget {
  final Map<String, dynamic> userData;
  const Std3Dashboard({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDiscoveryHeader(),
        const SizedBox(height: 30),
        _buildSubjectRow(
          context,
          "Tamil",
          "12 Lessons",
          Icons.book_rounded,
          Colors.teal,
        ),
        _buildSubjectRow(
          context,
          "English",
          "15 Lessons",
          Icons.translate_rounded,
          Colors.indigo,
        ),
        _buildSubjectRow(
          context,
          "Maths",
          "10 Lessons",
          Icons.numbers_rounded,
          Colors.deepOrange,
        ),
        _buildSubjectRow(
          context,
          "Science",
          "8 Lessons",
          Icons.grass_rounded,
          Colors.green,
        ),
        _buildSubjectRow(
          context,
          "Social",
          "6 Lessons",
          Icons.map_rounded,
          Colors.brown,
        ),
      ],
    );
  }

  Widget _buildDiscoveryHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color(0xFFE2E8F0),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lightbulb_rounded,
              color: Colors.amber,
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discovery Phase",
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Color(0xFFF1F5F9),
                    color: Colors.amber,
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "40% of Syllabus found",
                  style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectRow(
    BuildContext context,
    String title,
    String stats,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap:
            () => Navigator.pushNamed(
              context,
              '/subject_selection',
              arguments: {'std': 3, 'mode': 'lessons'},
            ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: color.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      stats,
                      style: GoogleFonts.outfit(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.play_circle_fill_rounded, color: color, size: 35),
            ],
          ),
        ),
      ),
    );
  }
}
