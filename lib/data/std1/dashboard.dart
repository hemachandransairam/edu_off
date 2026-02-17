import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Std1Dashboard extends StatelessWidget {
  final Map<String, dynamic> userData;
  const Std1Dashboard({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.orange.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 40),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Level 1 Explorer",
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                    Text(
                      "Standard 1 is full of wonders!",
                      style: GoogleFonts.outfit(color: Colors.orange[800]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        _buildQuickPlay(context),
      ],
    );
  }

  Widget _buildQuickPlay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Play & Learn!",
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.1,
          ),
          itemCount: 7, // Tamil, English, Maths, EVS, Art, Music, PE
          itemBuilder: (context, index) {
            final subjects = [
              {'n': 'Tamil', 'i': Icons.menu_book, 'c': Colors.redAccent},
              {'n': 'English', 'i': Icons.abc, 'c': Colors.blueAccent},
              {'n': 'Maths', 'i': Icons.calculate, 'c': Colors.greenAccent},
              {'n': 'EVS', 'i': Icons.nature_people, 'c': Colors.orangeAccent},
              {'n': 'Art & Craft', 'i': Icons.palette, 'c': Colors.pinkAccent},
              {'n': 'Music', 'i': Icons.music_note, 'c': Colors.purpleAccent},
              {'n': 'PE', 'i': Icons.fitness_center, 'c': Colors.tealAccent},
            ];
            final s = subjects[index];
            return _buildGameCard(
              context,
              s['n'] as String,
              s['i'] as IconData,
              s['c'] as Color,
            );
          },
        ),
      ],
    );
  }

  Widget _buildGameCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/subject_selection',
          arguments: {'std': 1, 'mode': 'games'},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
