import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:permission_handler/permission_handler.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({super.key});

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<DrawingPoint?> drawingPoints = [];
  Color selectedColor = const Color(0xFF8B80F8);
  double strokeWidth = 5.0;
  bool isEraser = false;
  final GlobalKey _canvasKey = GlobalKey();

  final List<Color> colors = [
    const Color(0xFF8B80F8), // Purple
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.brown,
    Colors.black,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Free Drawing',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: responsive.sp(20),
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_outline_rounded,
              size: responsive.iconSize(24),
            ),
            onPressed: () {
              setState(() {
                drawingPoints.clear();
              });
            },
            tooltip: 'Clear All',
          ),
          IconButton(
            icon: Icon(Icons.save_rounded, size: responsive.iconSize(24)),
            onPressed: _saveDrawing,
            tooltip: 'Save Drawing',
          ),
        ],
      ),
      body: Column(
        children: [
          // Drawing canvas
          Expanded(
            child: Container(
              margin: responsive.padding(all: 20),
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
                child: RepaintBoundary(
                  key: _canvasKey,
                  child: Container(
                    color: Colors.white,
                    child: GestureDetector(
                      onPanStart: (details) {
                        setState(() {
                          drawingPoints.add(
                            DrawingPoint(
                              offset: details.localPosition,
                              paint:
                                  Paint()
                                    ..color =
                                        isEraser ? Colors.white : selectedColor
                                    ..strokeWidth = strokeWidth
                                    ..strokeCap = StrokeCap.round
                                    ..isAntiAlias = true,
                            ),
                          );
                        });
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          drawingPoints.add(
                            DrawingPoint(
                              offset: details.localPosition,
                              paint:
                                  Paint()
                                    ..color =
                                        isEraser ? Colors.white : selectedColor
                                    ..strokeWidth = strokeWidth
                                    ..strokeCap = StrokeCap.round
                                    ..isAntiAlias = true,
                            ),
                          );
                        });
                      },
                      onPanEnd: (details) {
                        setState(() {
                          drawingPoints.add(null);
                        });
                      },
                      child: CustomPaint(
                        painter: DrawingPainter(drawingPoints: drawingPoints),
                        size: Size.infinite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Tools panel
          Container(
            padding: responsive.padding(all: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(responsive.borderRadius(30).topLeft.x),
                topRight: Radius.circular(
                  responsive.borderRadius(30).topRight.x,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Brush/Eraser toggle
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isEraser = false;
                          });
                        },
                        child: Container(
                          padding: responsive.padding(vertical: 12),
                          decoration: BoxDecoration(
                            color:
                                !isEraser
                                    ? const Color(0xFF8B80F8)
                                    : Colors.grey[200],
                            borderRadius: responsive.borderRadius(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.brush_rounded,
                                color:
                                    !isEraser ? Colors.white : Colors.grey[600],
                                size: responsive.iconSize(24),
                              ),
                              SizedBox(width: responsive.gap(8)),
                              Text(
                                'Brush',
                                style: GoogleFonts.outfit(
                                  fontSize: responsive.sp(16),
                                  fontWeight: FontWeight.bold,
                                  color:
                                      !isEraser
                                          ? Colors.white
                                          : Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: responsive.gap(10)),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isEraser = true;
                          });
                        },
                        child: Container(
                          padding: responsive.padding(vertical: 12),
                          decoration: BoxDecoration(
                            color:
                                isEraser
                                    ? const Color(0xFF8B80F8)
                                    : Colors.grey[200],
                            borderRadius: responsive.borderRadius(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.auto_fix_high_rounded,
                                color:
                                    isEraser ? Colors.white : Colors.grey[600],
                                size: responsive.iconSize(24),
                              ),
                              SizedBox(width: responsive.gap(8)),
                              Text(
                                'Eraser',
                                style: GoogleFonts.outfit(
                                  fontSize: responsive.sp(16),
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isEraser
                                          ? Colors.white
                                          : Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: responsive.gap(20)),

                // Stroke width slider
                Row(
                  children: [
                    Icon(
                      Icons.line_weight_rounded,
                      color: Colors.grey[600],
                      size: responsive.iconSize(24),
                    ),
                    SizedBox(width: responsive.gap(10)),
                    Expanded(
                      child: SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: const Color(0xFF8B80F8),
                          inactiveTrackColor: Colors.grey[300],
                          thumbColor: const Color(0xFF8B80F8),
                          overlayColor: const Color(
                            0xFF8B80F8,
                          ).withOpacity(0.2),
                          trackHeight: 4,
                        ),
                        child: Slider(
                          value: strokeWidth,
                          min: 2,
                          max: 20,
                          onChanged: (value) {
                            setState(() {
                              strokeWidth = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: responsive.value(
                        mobile: 40.0,
                        tablet: 50.0,
                        desktop: 60.0,
                      ),
                      padding: responsive.padding(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B80F8).withOpacity(0.1),
                        borderRadius: responsive.borderRadius(10),
                      ),
                      child: Text(
                        '${strokeWidth.toInt()}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          fontSize: responsive.sp(14),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF8B80F8),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: responsive.gap(20)),

                // Color palette
                if (!isEraser) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.palette_rounded,
                        color: Colors.grey[600],
                        size: responsive.iconSize(24),
                      ),
                      SizedBox(width: responsive.gap(10)),
                      Text(
                        'Colors',
                        style: GoogleFonts.outfit(
                          fontSize: responsive.sp(16),
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsive.gap(15)),
                  Wrap(
                    spacing: responsive.gap(10),
                    runSpacing: responsive.gap(10),
                    children:
                        colors.map((color) {
                          final isSelected = selectedColor == color;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                            child: Container(
                              width: responsive.value(
                                mobile: 45.0,
                                tablet: 55.0,
                                desktop: 65.0,
                              ),
                              height: responsive.value(
                                mobile: 45.0,
                                tablet: 55.0,
                                desktop: 65.0,
                              ),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? const Color(0xFF1E293B)
                                          : Colors.grey[300]!,
                                  width: isSelected ? 4 : 2,
                                ),
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(
                                      color: color.withOpacity(0.5),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                ],
                              ),
                              child:
                                  isSelected
                                      ? Icon(
                                        Icons.check,
                                        color:
                                            color.computeLuminance() > 0.5
                                                ? Colors.black
                                                : Colors.white,
                                        size: responsive.iconSize(24),
                                      )
                                      : null,
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _saveDrawing() async {
    if (drawingPoints.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Draw something first!', style: GoogleFonts.outfit()),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
      return;
    }

    try {
      // Request storage permission
      PermissionStatus status;

      // For Android 13+ (API 33+), use photos permission
      // For older Android, use storage permission
      if (await Permission.photos.isGranted) {
        status = PermissionStatus.granted;
      } else if (await Permission.storage.isGranted) {
        status = PermissionStatus.granted;
      } else {
        // Request permission
        status = await Permission.photos.request();
        if (status.isDenied) {
          status = await Permission.storage.request();
        }
      }

      if (status.isDenied) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Storage permission is required to save drawings',
              style: GoogleFonts.outfit(),
            ),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            action: SnackBarAction(
              label: 'Settings',
              textColor: Colors.white,
              onPressed: () {
                openAppSettings();
              },
            ),
          ),
        );
        return;
      }

      if (status.isPermanentlyDenied) {
        if (!mounted) return;
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Row(
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Permission Required',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                content: Text(
                  'Storage permission is permanently denied. Please enable it in app settings to save drawings.',
                  style: GoogleFonts.outfit(),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.outfit(color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      openAppSettings();
                    },
                    child: Text(
                      'Open Settings',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF8B80F8),
                      ),
                    ),
                  ),
                ],
              ),
        );
        return;
      }

      // Permission granted, proceed with saving
      // Capture the canvas as an image
      RenderRepaintBoundary boundary =
          _canvasKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save to gallery using Gal package
      await Gal.putImageBytes(
        pngBytes,
        name: 'drawing_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (!mounted) return;
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              title: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF10B981),
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Saved!',
                    style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              content: Text(
                'Your drawing has been saved to your gallery!',
                style: GoogleFonts.outfit(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      drawingPoints.clear();
                    });
                  },
                  child: Text(
                    'Draw More',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF8B80F8),
                    ),
                  ),
                ),
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
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to save drawing. Please try again.',
            style: GoogleFonts.outfit(),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    }
  }
}

class DrawingPoint {
  final Offset offset;
  final Paint paint;

  DrawingPoint({required this.offset, required this.paint});
}

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> drawingPoints;

  DrawingPainter({required this.drawingPoints});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length - 1; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        canvas.drawLine(
          drawingPoints[i]!.offset,
          drawingPoints[i + 1]!.offset,
          drawingPoints[i]!.paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
