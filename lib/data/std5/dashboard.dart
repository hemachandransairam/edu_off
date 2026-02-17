import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Std5Dashboard extends StatelessWidget {
  final Map<String, dynamic> userData;
  const Std5Dashboard({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mastery Progress",
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 15),
        _buildProgressChart(),
        const SizedBox(height: 30),
        Text(
          "Standard 5 Modules",
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 15),
        _buildModuleList(context),
      ],
    );
  }

  Widget _buildProgressChart() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          _buildStatRow("Overall Score", 0.85, Colors.blue),
          const SizedBox(height: 15),
          _buildStatRow("Knowledge Index", 0.65, Colors.orange),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, double value, Color color) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
            Text("${(value * 100).toInt()}%"),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: value,
          backgroundColor: color.withOpacity(0.1),
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }

  Widget _buildModuleList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildModuleTile(
          context,
          "English Grammar",
          "24 Lessons",
          Icons.auto_stories,
          Colors.blue,
        ),
        _buildModuleTile(
          context,
          "Advanced Math",
          "18 Lessons",
          Icons.functions,
          Colors.green,
        ),
        _buildModuleTile(
          context,
          "Global History",
          "12 Lessons",
          Icons.public,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildModuleTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/subject_selection',
            arguments: {'std': 5, 'mode': 'lessons'},
          );
        },
      ),
    );
  }
}
