import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive.dart';

class TracingScreen extends StatefulWidget {
  final String language;
  final String topic;
  final List<String> letters;

  const TracingScreen({
    super.key,
    required this.language,
    required this.topic,
    required this.letters,
  });

  @override
  State<TracingScreen> createState() => _TracingScreenState();
}

class _TracingScreenState extends State<TracingScreen> {
  int currentLetterIndex = 0;
  List<Offset?> drawnPoints = [];
  bool isTraceCorrect = false;
  bool showFeedback = false;
  double accuracyPercentage = 0.0;
  bool hasCalculatedAccuracy = false;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final currentLetter = widget.letters[currentLetterIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar with gradient
            Container(
              padding: responsive.padding(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B80F8), Color(0xFF6B58F2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8B80F8).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: responsive.iconSize(24),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Title
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.topic,
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                                fontSize: responsive.sp(18),
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${widget.language} Letters',
                              style: GoogleFonts.outfit(
                                fontSize: responsive.sp(13),
                                color: Colors.white.withOpacity(0.9),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Progress badge
                      Container(
                        padding: responsive.padding(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.auto_awesome,
                              color: const Color(0xFF8B80F8),
                              size: responsive.iconSize(18),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${currentLetterIndex + 1}/${widget.letters.length}',
                              style: GoogleFonts.outfit(
                                fontSize: responsive.sp(16),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF8B80F8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: (currentLetterIndex + 1) / widget.letters.length,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: responsive.gap(15)),

            // Current letter display card
            Flexible(
              flex: 0,
              child: Container(
                margin: responsive.padding(horizontal: 20),
                padding: responsive.padding(all: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF8B80F8).withOpacity(0.1),
                      const Color(0xFF6B58F2).withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: responsive.borderRadius(25),
                  border: Border.all(
                    color: const Color(0xFF8B80F8).withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B80F8).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit_rounded,
                        color: const Color(0xFF8B80F8),
                        size: responsive.iconSize(24),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Trace this letter',
                            style: GoogleFonts.outfit(
                              fontSize: responsive.sp(14),
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            currentLetter,
                            style: GoogleFonts.notoSansTamil(
                              fontSize: responsive.sp(40),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF8B80F8),
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: responsive.gap(15)),

            // Tracing canvas
            Expanded(
              child: Container(
                margin: responsive.padding(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: responsive.borderRadius(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: responsive.borderRadius(20),
                  child: GestureDetector(
                    onPanStart: (details) {
                      setState(() {
                        drawnPoints.add(details.localPosition);
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        drawnPoints.add(details.localPosition);
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        drawnPoints.add(null);
                        _checkTracing();
                      });
                    },
                    child: CustomPaint(
                      painter: TracingPainter(
                        letter: currentLetter,
                        drawnPoints: drawnPoints,
                        language: widget.language,
                      ),
                      size: Size.infinite,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: responsive.gap(20)),

            // Action buttons
            Padding(
              padding: responsive.padding(horizontal: 20, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          drawnPoints.clear();
                          showFeedback = false;
                          hasCalculatedAccuracy = false;
                          accuracyPercentage = 0.0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: const Color(0xFF1E293B),
                        padding: responsive.padding(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: responsive.borderRadius(15),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.refresh_rounded,
                            size: responsive.iconSize(24),
                          ),
                          SizedBox(width: responsive.gap(8)),
                          Text(
                            'Clear',
                            style: GoogleFonts.outfit(
                              fontSize: responsive.sp(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: responsive.gap(15)),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: drawnPoints.length > 10 ? _nextLetter : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B80F8),
                        foregroundColor: Colors.white,
                        padding: responsive.padding(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: responsive.borderRadius(15),
                        ),
                        elevation: 0,
                        disabledBackgroundColor: Colors.grey[300],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentLetterIndex < widget.letters.length - 1
                                ? 'Next Letter'
                                : 'Finish',
                            style: GoogleFonts.outfit(
                              fontSize: responsive.sp(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: responsive.gap(8)),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: responsive.iconSize(24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkTracing() {
    if (drawnPoints.length > 20) {
      // Get the letter bounds from the canvas
      final canvasSize = context.size ?? const Size(300, 300);

      // Calculate the letter's expected position and size
      final letterSize = canvasSize.width * 0.6;
      final letterBounds = Rect.fromCenter(
        center: Offset(canvasSize.width / 2, canvasSize.height / 2),
        width: letterSize,
        height: letterSize,
      );

      // Count how many drawn points are within the letter bounds
      int pointsInBounds = 0;
      int totalPoints = 0;

      for (var point in drawnPoints) {
        if (point != null) {
          totalPoints++;
          // Check if point is within the letter area (with some tolerance)
          final expandedBounds = letterBounds.inflate(30); // 30px tolerance
          if (expandedBounds.contains(point)) {
            pointsInBounds++;
          }
        }
      }

      // Calculate coverage - how much of the letter area was traced
      double coverage = totalPoints > 0 ? (pointsInBounds / totalPoints) : 0.0;

      // Calculate density - how many points were drawn (more = better tracing)
      double density = (totalPoints / 200).clamp(0.0, 1.0);

      // Combined accuracy: 70% coverage + 30% density
      double rawAccuracy = (coverage * 0.7 + density * 0.3) * 100;

      // Apply realistic scoring:
      // - If coverage is very low (<40%), give low score
      // - If coverage is good (>60%), give proportional score
      if (coverage < 0.4) {
        accuracyPercentage = (rawAccuracy * 0.6).clamp(45.0, 65.0);
      } else if (coverage < 0.6) {
        accuracyPercentage = (rawAccuracy * 0.8).clamp(60.0, 80.0);
      } else {
        accuracyPercentage = rawAccuracy.clamp(75.0, 100.0);
      }

      setState(() {
        isTraceCorrect = accuracyPercentage >= 70;
        showFeedback = true;
        hasCalculatedAccuracy = true;
      });

      // Don't show popup automatically - only when user clicks Next
    }
  }

  void _nextLetter() {
    // First, calculate accuracy if not already done
    if (!hasCalculatedAccuracy && drawnPoints.length > 20) {
      _checkTracing();
    }

    // Show accuracy dialog first, then proceed based on user choice
    if (hasCalculatedAccuracy) {
      _showAccuracyDialog();
    } else {
      // If no drawing, just show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please trace the letter first!',
            style: GoogleFonts.outfit(),
          ),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    }
  }

  void _proceedToNextLetter() {
    if (currentLetterIndex < widget.letters.length - 1) {
      setState(() {
        currentLetterIndex++;
        drawnPoints.clear();
        isTraceCorrect = false;
        showFeedback = false;
        hasCalculatedAccuracy = false;
        accuracyPercentage = 0.0;
      });
    } else {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
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
                  'Excellent!',
                  style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: Text(
              'You completed all letters! Great job!',
              style: GoogleFonts.outfit(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'Done',
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

  void _showAccuracyDialog() {
    final showCelebration = accuracyPercentage >= 80;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Column(
              children: [
                if (showCelebration) ...[
                  Icon(
                    Icons.celebration,
                    color: _getAccuracyColors(accuracyPercentage)[0],
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getAccuracyIcon(accuracyPercentage),
                      color: _getAccuracyColors(accuracyPercentage)[0],
                      size: 35,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${accuracyPercentage.toStringAsFixed(0)}%',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: _getAccuracyColors(accuracyPercentage)[0],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _getAccuracyColors(accuracyPercentage),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getAccuracyMessage(accuracyPercentage),
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (showCelebration) ...[
                  const SizedBox(height: 15),
                  Text(
                    '🎉 Amazing work! 🎉',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
            actions: [
              if (accuracyPercentage < 80)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      drawnPoints.clear();
                      hasCalculatedAccuracy = false;
                      accuracyPercentage = 0.0;
                    });
                  },
                  child: Text(
                    'Try Again',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.bold,
                      color: _getAccuracyColors(accuracyPercentage)[0],
                    ),
                  ),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _proceedToNextLetter();
                },
                child: Text(
                  accuracyPercentage >= 80 ? 'Continue' : 'OK',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    color: _getAccuracyColors(accuracyPercentage)[0],
                  ),
                ),
              ),
            ],
          ),
    );
  }

  List<Color> _getAccuracyColors(double accuracy) {
    if (accuracy >= 90) {
      return [const Color(0xFF10B981), const Color(0xFF059669)]; // Green
    } else if (accuracy >= 75) {
      return [const Color(0xFF8B80F8), const Color(0xFF6B58F2)]; // Purple
    } else if (accuracy >= 60) {
      return [const Color(0xFFF59E0B), const Color(0xFFD97706)]; // Orange
    } else {
      return [const Color(0xFFEF4444), const Color(0xFFDC2626)]; // Red
    }
  }

  IconData _getAccuracyIcon(double accuracy) {
    if (accuracy >= 90) {
      return Icons.star_rounded;
    } else if (accuracy >= 75) {
      return Icons.thumb_up_rounded;
    } else if (accuracy >= 60) {
      return Icons.sentiment_satisfied_rounded;
    } else {
      return Icons.refresh_rounded;
    }
  }

  String _getAccuracyMessage(double accuracy) {
    if (accuracy >= 90) {
      return 'Excellent work!';
    } else if (accuracy >= 75) {
      return 'Great job!';
    } else if (accuracy >= 60) {
      return 'Good try! Keep practicing';
    } else {
      return 'Try again for better accuracy';
    }
  }
}

class TracingPainter extends CustomPainter {
  final String letter;
  final List<Offset?> drawnPoints;
  final String language;

  TracingPainter({
    required this.letter,
    required this.drawnPoints,
    required this.language,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw dotted letter outline
    final textPainter = TextPainter(
      text: TextSpan(
        text: letter,
        style: TextStyle(
          fontSize: size.width * 0.6,
          fontWeight: FontWeight.bold,
          foreground:
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 8
                ..color = const Color(0xFF8B80F8).withOpacity(0.3),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final offset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );

    // Draw dotted outline
    textPainter.paint(canvas, offset);

    // Draw user's traced path
    final userPaint =
        Paint()
          ..color = const Color(0xFF8B80F8)
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    for (int i = 0; i < drawnPoints.length - 1; i++) {
      if (drawnPoints[i] != null && drawnPoints[i + 1] != null) {
        canvas.drawLine(drawnPoints[i]!, drawnPoints[i + 1]!, userPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
