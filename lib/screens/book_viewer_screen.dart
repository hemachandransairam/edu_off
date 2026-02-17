import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:page_flip/page_flip.dart';

class BookViewerScreen extends StatefulWidget {
  final String bookUrl;
  final String title;

  const BookViewerScreen({
    super.key,
    required this.bookUrl,
    required this.title,
  });

  @override
  State<BookViewerScreen> createState() => _BookViewerScreenState();
}

class _BookViewerScreenState extends State<BookViewerScreen> {
  bool _isLoading = true;
  String _loadingMessage = "Downloading textbook...";
  double _progressValue = 0;
  List<Uint8List> _pageImages = [];
  final GlobalKey<PageFlipWidgetState> _controller =
      GlobalKey<PageFlipWidgetState>();

  @override
  void initState() {
    super.initState();
    _downloadAndPrepareBook();
  }

  Future<void> _downloadAndPrepareBook() async {
    try {
      // 1. Prepare unique filename for caching
      String fileId = widget.title.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
      if (widget.bookUrl.contains('drive.google.com')) {
        final regExp = RegExp(r'\/d\/([a-zA-Z0-9_-]+)');
        final match = regExp.firstMatch(widget.bookUrl);
        if (match != null) {
          fileId = match.group(1)!;
        }
      }

      final docDir = await getApplicationDocumentsDirectory();
      final file = File('${docDir.path}/$fileId.pdf');

      // 2. Check if file exists locally (Offline Mode)
      if (await file.exists()) {
        setState(() => _loadingMessage = "Opening cached book...");
      } else {
        // 3. Download if not cached
        setState(() => _loadingMessage = "Downloading from Drive...");
        String downloadUrl = widget.bookUrl;
        if (widget.bookUrl.contains('drive.google.com')) {
          downloadUrl =
              'https://drive.google.com/uc?id=$fileId&export=download';
        }

        final response = await http.get(Uri.parse(downloadUrl));
        if (response.statusCode == 200) {
          await file.writeAsBytes(response.bodyBytes);
        } else {
          throw Exception(
            'Failed to download book (Status: ${response.statusCode})',
          );
        }
      }

      // 4. Render pages as images
      setState(() => _loadingMessage = "Preparing pages...");
      final document = await PdfDocument.openFile(file.path);

      for (int i = 1; i <= document.pagesCount; i++) {
        if (!mounted) break;

        setState(() {
          _progressValue = i / document.pagesCount;
          _loadingMessage = "Processing page $i of ${document.pagesCount}";
        });

        final page = await document.getPage(i);
        final pageImage = await page.render(
          width: page.width * 1.5, // Better memory management
          height: page.height * 1.5,
          format: PdfPageImageFormat.png,
        );
        if (pageImage != null) {
          _pageImages.add(pageImage.bytes);
        }
        await page.close();
      }
      await document.close();

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        String errorMsg = e.toString();
        if (errorMsg.contains('channel-error')) {
          errorMsg =
              "REQUIRED: Please STOP and RESTART the app manually to load the PDF engine.";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            duration: const Duration(seconds: 10),
          ),
        );
        setState(() => _isLoading = false);
      }
    }
  }

  void _showPageSearch(BuildContext context) {
    final TextEditingController pageController = TextEditingController();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: Text(
              'Go to Page',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Enter page number (1 - ${_pageImages.length})',
                  style: GoogleFonts.outfit(color: Colors.grey[600]),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: pageController,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'e.g. 15',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.outfit(color: Colors.grey),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final pageNum = int.tryParse(pageController.text);
                  if (pageNum != null &&
                      pageNum >= 1 &&
                      pageNum <= _pageImages.length) {
                    Navigator.pop(context);
                    // PageFlip index is 0-based
                    _controller.currentState?.goToPage(pageNum - 1);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid page number'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Go', style: GoogleFonts.outfit()),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
            fontSize: 18,
          ),
        ),
        actions: [
          if (!_isLoading && _pageImages.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () => _showPageSearch(context),
            ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body:
          _isLoading
              ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(color: Color(0xFF8B80F8)),
                      const SizedBox(height: 30),
                      Text(
                        _loadingMessage,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          color: const Color(0xFF1E293B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      LinearProgressIndicator(
                        value: _progressValue,
                        backgroundColor: Colors.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF8B80F8),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : _pageImages.isEmpty
              ? const Center(child: Text('Could not load pages'))
              : Center(
                child: PageFlipWidget(
                  key: _controller,
                  backgroundColor: const Color(0xFFF3F1FF),
                  children:
                      _pageImages.map((bytes) {
                        return InteractiveViewer(
                          minScale: 1.0,
                          maxScale: 4.0,
                          child: SelectionArea(
                            child: Image.memory(bytes, fit: BoxFit.contain),
                          ),
                        );
                      }).toList(),
                ),
              ),
    );
  }
}
