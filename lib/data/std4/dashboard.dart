import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Std4Dashboard extends StatelessWidget {
  final Map<String, dynamic> userData;
  const Std4Dashboard({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExpertHeader(),
        const SizedBox(height: 30),
        Text(
          "Core Learning Paths",
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 15),
        _buildPathCard(
          context,
          "Advanced Languages",
          "Tamil & English Mastery",
          Icons.history_edu_rounded,
          Colors.indigo,
        ),
        _buildPathCard(
          context,
          "The Lab",
          "Science Experiments & Facts",
          Icons.science_rounded,
          Colors.purple,
        ),
        _buildPathCard(
          context,
          "Number Theory",
          "Maths & Logic Puzzles",
          Icons.functions_rounded,
          Colors.blue,
        ),
        _buildPathCard(
          context,
          "Our Society",
          "Social Studies & History",
          Icons.gavel_rounded,
          Colors.brown,
        ),
      ],
    );
  }

  Widget _buildExpertHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFC6A5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "EXPERT MODE",
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Hello, Scholar!",
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Standard 4 focus: Critical Thinking",
            style: GoogleFonts.outfit(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPathCard(
    BuildContext context,
    String title,
    String subtitle,
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
              arguments: {'std': 4, 'mode': 'lessons'},
            ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            title: Text(
              title,
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: GoogleFonts.outfit(fontSize: 13, color: Colors.grey[600]),
            ),
            trailing: const Icon(Icons.arrow_forward_rounded, size: 20),
          ),
        ),
      ),
    );
  }
}
