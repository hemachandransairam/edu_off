import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/syllabus_model.dart';

// --- COMPARE GAME SCREEN ---
class CompareGameScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const CompareGameScreen({super.key, required this.data});

  @override
  State<CompareGameScreen> createState() => _CompareGameScreenState();
}

class _CompareGameScreenState extends State<CompareGameScreen> {
  int currentIndex = 0;
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    final questions = widget.data['questions'] as List;
    final currentQ = questions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Bigger or Smaller?',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  currentQ['q'] as String,
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircle(currentQ['val1'] as int),
                  _buildCircle(currentQ['val2'] as int),
                ],
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      selectedValue == null
                          ? null
                          : () {
                            if (selectedValue == currentQ['ans']) {
                              if (currentIndex < questions.length - 1) {
                                setState(() {
                                  currentIndex++;
                                  selectedValue = null;
                                });
                              } else {
                                _showSuccess();
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Think again!')),
                              );
                            }
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(int value) {
    bool isSelected = selectedValue == value;
    return GestureDetector(
      onTap: () => setState(() => selectedValue = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 120 + (value * 2.0),
        height: 120 + (value * 2.0),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color(0xFF8B80F8)
                  : Colors.amber.withOpacity(0.2),
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFF8B80F8) : Colors.amber,
            width: 4,
          ),
        ),
        child: Center(
          child: Text(
            '$value',
            style: GoogleFonts.outfit(
              fontSize: 32 + (value * 0.5),
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.amber[900],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccess() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Text(
              'Awesome!',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
            ),
            content: Text(
              'You identified the numbers correctly!',
              style: GoogleFonts.outfit(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                child: Text(
                  'OK',
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
}

// --- DRAG DROP GAME SCREEN ---
class DragDropGameScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const DragDropGameScreen({super.key, required this.data});

  @override
  State<DragDropGameScreen> createState() => _DragDropGameScreenState();
}

class _DragDropGameScreenState extends State<DragDropGameScreen> {
  late List<Map<String, String>> items;
  Map<String, List<String>> collections = {};

  @override
  void initState() {
    super.initState();
    final dataItems = widget.data['items'] as List;
    items =
        dataItems
            .map(
              (item) => {
                'name': item['name'] as String,
                'cat': item['cat'] as String,
              },
            )
            .toList()
          ..shuffle();
    for (var cat in widget.data['categories'] as List) {
      collections[cat as String] = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isComplete = items.isEmpty;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Sort the Items',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children:
                    items.map((item) {
                      return Draggable<Map<String, String>>(
                        data: item,
                        feedback: _buildItemCard(item['name']!, true),
                        childWhenDragging: Opacity(
                          opacity: 0.3,
                          child: _buildItemCard(item['name']!, false),
                        ),
                        child: _buildItemCard(item['name']!, false),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      (widget.data['categories'] as List).map((cat) {
                        return Flexible(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 180),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: DragTarget<Map<String, String>>(
                              onWillAccept: (data) => data != null,
                              onAccept: (data) {
                                if (data['cat'] == cat) {
                                  setState(() {
                                    collections[cat]!.add(data['name']!);
                                    items.remove(data);
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Wrong category!'),
                                    ),
                                  );
                                }
                              },
                              builder:
                                  (
                                    context,
                                    candidateData,
                                    rejectedData,
                                  ) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    constraints: const BoxConstraints(
                                      minHeight: 250,
                                      maxHeight: 350,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.04),
                                          blurRadius: 15,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                      border: Border.all(
                                        color:
                                            candidateData.isNotEmpty
                                                ? const Color(0xFF8B80F8)
                                                : Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            cat as String,
                                            style: GoogleFonts.outfit(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF1E293B),
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey[100],
                                          height: 1,
                                        ),
                                        Flexible(
                                          child: ListView(
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(8),
                                            physics:
                                                const BouncingScrollPhysics(),
                                            children:
                                                collections[cat]!
                                                    .map(
                                                      (name) => Container(
                                                        margin:
                                                            const EdgeInsets.only(
                                                              bottom: 6,
                                                            ),
                                                        padding:
                                                            const EdgeInsets.all(
                                                              8,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color: const Color(
                                                            0xFFF1F5F9,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                        child: Text(
                                                          name,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              GoogleFonts.outfit(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    const Color(
                                                                      0xFF1E293B,
                                                                    ),
                                                              ),
                                                          maxLines: 2,
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
            if (isComplete)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E293B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 10,
                      shadowColor: const Color(0xFF1E293B).withOpacity(0.3),
                    ),
                    child: Text(
                      'Great Job!',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(String name, bool isDragging) {
    return Container(
      width: 100,
      height: 85,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF8B80F8),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B80F8).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

// --- FILL BLANKS GAME SCREEN ---
class FillBlanksGameScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const FillBlanksGameScreen({super.key, required this.data});

  @override
  State<FillBlanksGameScreen> createState() => _FillBlanksGameScreenState();
}

class _FillBlanksGameScreenState extends State<FillBlanksGameScreen> {
  int currentIndex = 0;
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final questions = widget.data['questions'] as List;
    final currentQ = questions[currentIndex];
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Fill in the Blanks',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  currentQ['text'].replaceAll('____', selectedOption ?? '....'),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children:
                    (currentQ['options'] as List).map((opt) {
                      bool isSelected = selectedOption == opt;
                      return GestureDetector(
                        onTap: () => setState(() => selectedOption = opt),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? const Color(0xFF8B80F8)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    isSelected
                                        ? const Color(
                                          0xFF8B80F8,
                                        ).withOpacity(0.3)
                                        : Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Text(
                            opt as String,
                            style: GoogleFonts.outfit(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      selectedOption == null
                          ? null
                          : () {
                            if (selectedOption == currentQ['ans']) {
                              if (currentIndex < questions.length - 1) {
                                setState(() {
                                  currentIndex++;
                                  selectedOption = null;
                                });
                              } else {
                                _showSuccess();
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Try another one!'),
                                ),
                              );
                            }
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    'Check Answer',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccess() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Text(
              'Perfect!',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
            ),
            content: Text(
              'You finished all sentences.',
              style: GoogleFonts.outfit(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                child: Text(
                  'OK',
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
}

// --- MATCH GAME SCREEN ---
class MatchGameScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const MatchGameScreen({super.key, required this.data});

  @override
  State<MatchGameScreen> createState() => _MatchGameScreenState();
}

class _MatchGameScreenState extends State<MatchGameScreen> {
  late List<Map<String, dynamic>> leftItems;
  late List<Map<String, dynamic>> rightItems;
  Map<int, int?> connections = {};
  final Map<int, GlobalKey> leftKeys = {};
  final Map<int, GlobalKey> rightKeys = {};
  int? activeLeftIndex;
  Offset? dragUpdate;
  int secondsLeft = 180;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    final pairs = widget.data['pairs'] as List;
    leftItems =
        pairs.asMap().entries.map((e) {
          leftKeys[e.key] = GlobalKey();
          return {
            'id': e.key,
            'val': e.value['left'],
            'emoji': e.value['emoji'],
          };
        }).toList();
    rightItems =
        pairs.asMap().entries.map((e) {
            rightKeys[e.key] = GlobalKey();
            return {'id': e.key, 'val': e.value['right']};
          }).toList()
          ..shuffle();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) =>
          mounted
              ? setState(() => secondsLeft > 0 ? secondsLeft-- : t.cancel())
              : t.cancel(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isAllMatched =
        connections.length == leftItems.length &&
        !connections.values.contains(null);
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Match Items',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Text(
                '${(secondsLeft ~/ 60).toString().padLeft(2, '0')}:${(secondsLeft % 60).toString().padLeft(2, '0')}',
                style: GoogleFonts.outfit(
                  fontSize: 22,
                  color: const Color(0xFF8B80F8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      CustomPaint(
                        painter: MatchLinePainter(
                          leftKeys: leftKeys,
                          rightKeys: rightKeys,
                          connections: connections,
                          activeLeftIndex: activeLeftIndex,
                          dragUpdate: dragUpdate,
                          context: context,
                        ),
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children:
                                    leftItems
                                        .asMap()
                                        .entries
                                        .map(
                                          (e) => _buildLeftItem(e.value, e.key),
                                        )
                                        .toList(),
                              ),
                            ),
                            const SizedBox(width: 40),
                            Expanded(
                              child: Column(
                                children:
                                    rightItems
                                        .asMap()
                                        .entries
                                        .map(
                                          (e) =>
                                              _buildRightItem(e.value, e.key),
                                        )
                                        .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            if (isAllMatched)
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E293B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Match Successful!',
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftItem(Map<String, dynamic> item, int index) {
    bool isMatched = connections.containsKey(index);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: isMatched ? const Color(0xFFBCF0DA) : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color:
                        isMatched
                            ? const Color(0xFFBCF0DA).withOpacity(0.3)
                            : Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    item['emoji'] ?? '❓',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item['val'],
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onPanStart:
                (details) =>
                    connections.containsKey(index)
                        ? null
                        : setState(() {
                          activeLeftIndex = index;
                          dragUpdate = details.globalPosition;
                        }),
            onPanUpdate:
                (details) =>
                    activeLeftIndex == null
                        ? null
                        : setState(() => dragUpdate = details.globalPosition),
            onPanEnd: (details) => _handleDragEnd(details.globalPosition),
            child: Container(
              key: leftKeys[index],
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isMatched ? const Color(0xFFBCF0DA) : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isMatched
                          ? const Color(0xFF10B981)
                          : const Color(0xFF8B80F8),
                  width: 3,
                ),
              ),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color:
                        isMatched
                            ? const Color(0xFF10B981)
                            : const Color(0xFF8B80F8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightItem(Map<String, dynamic> item, int index) {
    bool isMatched = connections.values.contains(index);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            key: rightKeys[index],
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: isMatched ? const Color(0xFFBCF0DA) : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    isMatched
                        ? const Color(0xFF10B981)
                        : const Color(0xFF8B80F8),
                width: 3,
              ),
            ),
            child: Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color:
                      isMatched
                          ? const Color(0xFF10B981)
                          : const Color(0xFF8B80F8),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: isMatched ? const Color(0xFFBCF0DA) : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color:
                        isMatched
                            ? const Color(0xFFBCF0DA).withOpacity(0.3)
                            : Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  item['val'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                    fontSize: 15,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleDragEnd(Offset globalPos) {
    if (activeLeftIndex == null) return;
    int? targetIndex;
    for (int i = 0; i < rightItems.length; i++) {
      RenderBox? box =
          rightKeys[i]?.currentContext?.findRenderObject() as RenderBox?;
      if (box != null &&
          (box.localToGlobal(Offset.zero) + const Offset(15, 15) - globalPos)
                  .distance <
              45) {
        targetIndex = i;
        break;
      }
    }
    if (targetIndex != null) {
      String leftVal = leftItems[activeLeftIndex!]['val'],
          rightVal = rightItems[targetIndex]['val'];
      if ((widget.data['pairs'] as List).any(
        (p) => p['left'] == leftVal && p['right'] == rightVal,
      )) {
        setState(() => connections[activeLeftIndex!] = targetIndex);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Try again!'),
            duration: Duration(milliseconds: 600),
          ),
        );
      }
    }
    setState(() {
      activeLeftIndex = null;
      dragUpdate = null;
    });
  }
}

class MatchLinePainter extends CustomPainter {
  final Map<int, GlobalKey> leftKeys, rightKeys;
  final Map<int, int?> connections;
  final int? activeLeftIndex;
  final Offset? dragUpdate;
  final BuildContext context;
  MatchLinePainter({
    required this.leftKeys,
    required this.rightKeys,
    required this.connections,
    this.activeLeftIndex,
    this.dragUpdate,
    required this.context,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..strokeWidth = 3
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;
    final colors = [
      Colors.teal,
      Colors.orange,
      Colors.pink,
      Colors.blue,
      Colors.purple,
      Colors.indigo,
      Colors.brown,
      Colors.red,
      Colors.cyan,
      Colors.deepPurple,
    ];
    connections.forEach((lIdx, rIdx) {
      if (rIdx != null) {
        Offset? start = _getCenter(leftKeys[lIdx]),
            end = _getCenter(rightKeys[rIdx]);
        if (start != null && end != null) {
          paint.color = colors[lIdx % colors.length].withOpacity(0.8);

          // Draw a smooth curve instead of straight line
          final path = Path();
          path.moveTo(start.dx, start.dy);

          final controlPoint1 = Offset(
            start.dx + (end.dx - start.dx) * 0.3,
            start.dy,
          );
          final controlPoint2 = Offset(
            start.dx + (end.dx - start.dx) * 0.7,
            end.dy,
          );

          path.cubicTo(
            controlPoint1.dx,
            controlPoint1.dy,
            controlPoint2.dx,
            controlPoint2.dy,
            end.dx,
            end.dy,
          );

          canvas.drawPath(path, paint);
        }
      }
    });
    if (activeLeftIndex != null && dragUpdate != null) {
      Offset? start = _getCenter(leftKeys[activeLeftIndex!]);
      if (start != null) {
        final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final localDragPos = renderBox.globalToLocal(dragUpdate!);
          paint.color = Colors.grey.withOpacity(0.5);

          final path = Path();
          path.moveTo(start.dx, start.dy);

          final controlPoint1 = Offset(
            start.dx + (localDragPos.dx - start.dx) * 0.3,
            start.dy,
          );
          final controlPoint2 = Offset(
            start.dx + (localDragPos.dx - start.dx) * 0.7,
            localDragPos.dy,
          );

          path.cubicTo(
            controlPoint1.dx,
            controlPoint1.dy,
            controlPoint2.dx,
            controlPoint2.dy,
            localDragPos.dx,
            localDragPos.dy,
          );

          canvas.drawPath(path, paint);
        }
      }
    }
  }

  Offset? _getCenter(GlobalKey? key) {
    if (key == null || key.currentContext == null) return null;
    final RenderBox? box = key.currentContext!.findRenderObject() as RenderBox?;
    final RenderBox? parentBox = context.findRenderObject() as RenderBox?;

    if (box == null || parentBox == null) return null;

    // Get the global position of the circle center
    final globalPosition = box.localToGlobal(const Offset(15, 15));
    // Convert to local coordinates relative to the CustomPaint
    return parentBox.globalToLocal(globalPosition);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// --- LESSON GAME SCREEN ---
class LessonGameScreen extends StatefulWidget {
  final String title;
  final int standard;
  final String subject;
  const LessonGameScreen({
    super.key,
    required this.title,
    required this.standard,
    required this.subject,
  });
  @override
  State<LessonGameScreen> createState() => _LessonGameScreenState();
}

class _LessonGameScreenState extends State<LessonGameScreen> {
  int curIdx = 0;
  List<Map<String, dynamic>> qs = [];
  String? selAns;
  @override
  void initState() {
    super.initState();
    qs = SyllabusModel.getQuestions(widget.standard, widget.subject);
  }

  @override
  Widget build(BuildContext context) {
    if (qs.isEmpty) return Scaffold(body: Center(child: Text('Coming Soon!')));
    final q = qs[curIdx];
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        title: Text(
          'Lesson Quiz',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (curIdx + 1) / qs.length,
              backgroundColor: Colors.white,
              color: const Color(0xFF8B80F8),
              minHeight: 6,
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  q['q'] as String,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 24, // Reduced from 32
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children:
                    (q['opt'] as List<String>).map((opt) {
                      bool isSel = selAns == opt;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: GestureDetector(
                          onTap: () => setState(() => selAns = opt),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 18,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSel
                                      ? const Color(0xFF8B80F8)
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      isSel
                                          ? const Color(
                                            0xFF8B80F8,
                                          ).withOpacity(0.3)
                                          : Colors.black.withOpacity(0.02),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Text(
                              opt,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                fontSize: 18, // Reduced from 22
                                fontWeight: FontWeight.bold,
                                color:
                                    isSel
                                        ? Colors.white
                                        : const Color(0xFF1E293B),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      selAns == null
                          ? null
                          : () =>
                              selAns == q['a']
                                  ? (curIdx < qs.length - 1
                                      ? setState(() {
                                        curIdx++;
                                        selAns = null;
                                      })
                                      : _showSuccess())
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Try again!')),
                                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showSuccess() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.stars_rounded,
                  color: Color(0xFFFFC6A5),
                  size: 100,
                ),
                const SizedBox(height: 20),
                Text(
                  'Great Job!',
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'You completed the lesson!',
                  style: GoogleFonts.outfit(color: Colors.grey[600]),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B80F8),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Return Home',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

// --- MULTIPLICATION GAME SCREEN ---
class MultiplicationGameScreen extends StatefulWidget {
  const MultiplicationGameScreen({super.key});
  @override
  State<MultiplicationGameScreen> createState() =>
      _MultiplicationGameScreenState();
}

class _MultiplicationGameScreenState extends State<MultiplicationGameScreen> {
  int n1 = 3, n2 = 2;
  int? ans;
  @override
  Widget build(BuildContext context) {
    int correct = n1 * n2;
    List<int> opts = [correct, correct + 2, correct + 1]..shuffle();
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Multiplication',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Text(
                '$n1 × $n2 = ?',
                style: GoogleFonts.outfit(
                  fontSize: 48, // Reduced from 64
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF8B80F8),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    opts.map((opt) {
                      bool isSel = ans == opt;
                      return GestureDetector(
                        onTap: () => setState(() => ans = opt),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 85, // Reduced from 95
                          height: 85, // Reduced from 95
                          decoration: BoxDecoration(
                            color:
                                isSel ? const Color(0xFF8B80F8) : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    isSel
                                        ? const Color(
                                          0xFF8B80F8,
                                        ).withOpacity(0.3)
                                        : Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '$opt',
                              style: GoogleFonts.outfit(
                                fontSize: 28, // Reduced from 34
                                fontWeight: FontWeight.bold,
                                color:
                                    isSel
                                        ? Colors.white
                                        : const Color(0xFF1E293B),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      ans == null
                          ? null
                          : () =>
                              ans == correct
                                  ? _showResult(true)
                                  : _showResult(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    'Check Answer',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showResult(bool isCorrect) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Text(
              isCorrect ? 'Excellent!' : 'Keep Practicing',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
            ),
            content: Text(
              isCorrect
                  ? 'You solved it correctly!'
                  : 'Count carefully and try again.',
              style: GoogleFonts.outfit(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (isCorrect) Navigator.pop(context);
                },
                child: Text(
                  'OK',
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
}

// --- QUANTITY GAME SCREEN ---
class QuantityGameScreen extends StatefulWidget {
  const QuantityGameScreen({super.key});
  @override
  State<QuantityGameScreen> createState() => _QuantityGameScreenState();
}

class _QuantityGameScreenState extends State<QuantityGameScreen> {
  int count = 0;
  final int target = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Quantity',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              constraints: const BoxConstraints(minHeight: 200, maxHeight: 300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      count,
                      (i) => const Icon(
                        Icons.favorite,
                        size: 45, // Reduced from 60
                        color: Color(0xFFFFC6A5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Text(
                'How many hearts? Target: $target',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 20, // Reduced from 24
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ctrl(
                  Icons.remove_rounded,
                  () => count > 0 ? setState(() => count--) : null,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Text(
                    '$count',
                    style: GoogleFonts.outfit(
                      fontSize: 36, // Reduced from 48
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
                _ctrl(Icons.add_rounded, () => setState(() => count++)),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      count == target
                          ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Correct!')),
                            );
                            Navigator.pop(context);
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    'Check Answer',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _ctrl(IconData i, VoidCallback t) => GestureDetector(
    onTap: t,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF8B80F8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B80F8).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(i, size: 32, color: Colors.white),
    ),
  );
}

// --- SHAPES GAME SCREEN ---
class ShapesGameScreen extends StatefulWidget {
  const ShapesGameScreen({super.key});
  @override
  State<ShapesGameScreen> createState() => _ShapesGameScreenState();
}

class _ShapesGameScreenState extends State<ShapesGameScreen> {
  final List<Map<String, dynamic>> shps = [
    {'name': 'Square', 'icon': Icons.square_rounded},
    {'name': 'Circle', 'icon': Icons.circle},
    {'name': 'Triangle', 'icon': Icons.change_history_rounded},
  ];
  String? target, sel;
  @override
  void initState() {
    super.initState();
    target = (List.of(shps)..shuffle()).first['name'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Find the Shape',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Tap the $target',
                  style: GoogleFonts.outfit(
                    fontSize: 24, // Reduced from 28
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children:
                    shps.map((s) {
                      bool isSel = sel == s['name'];
                      return GestureDetector(
                        onTap: () => setState(() => sel = s['name'] as String),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 110, // Reduced from 130
                          height: 110, // Reduced from 130
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    isSel
                                        ? const Color(
                                          0xFF8B80F8,
                                        ).withOpacity(0.2)
                                        : Colors.black.withOpacity(0.04),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                            border: Border.all(
                              color:
                                  isSel
                                      ? const Color(0xFF8B80F8)
                                      : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          child: Icon(
                            s['icon'] as IconData,
                            size: 60, // Reduced from 70
                            color:
                                isSel
                                    ? const Color(0xFF8B80F8)
                                    : Colors.grey[400],
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      sel == null
                          ? null
                          : () => sel == target ? _show(true) : _show(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    'Check Answer',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _show(bool ok) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Text(
              ok ? 'Correct!' : 'Try Again',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
            ),
            content: Text(
              ok ? 'Found it!' : 'Not that one.',
              style: GoogleFonts.outfit(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (ok) Navigator.pop(context);
                },
                child: Text(
                  'OK',
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
}

// --- SUBTRACTION GAME SCREEN ---
class SubtractionGameScreen extends StatefulWidget {
  const SubtractionGameScreen({super.key});
  @override
  State<SubtractionGameScreen> createState() => _SubtractionGameScreenState();
}

class _SubtractionGameScreenState extends State<SubtractionGameScreen> {
  int n1 = 8, n2 = 3;
  int? ans;
  @override
  Widget build(BuildContext context) {
    int correct = n1 - n2;
    List<int> opts = [correct, correct + 1, correct - 1]..shuffle();
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Subtraction',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Text(
                '$n1 - $n2 = ?',
                style: GoogleFonts.outfit(
                  fontSize: 48, // Reduced from 64
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF8B80F8),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    opts.map((opt) {
                      bool isSel = ans == opt;
                      return GestureDetector(
                        onTap: () => setState(() => ans = opt),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 85, // Reduced from 95
                          height: 85, // Reduced from 95
                          decoration: BoxDecoration(
                            color:
                                isSel ? const Color(0xFF8B80F8) : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    isSel
                                        ? const Color(
                                          0xFF8B80F8,
                                        ).withOpacity(0.3)
                                        : Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '$opt',
                              style: GoogleFonts.outfit(
                                fontSize: 28, // Reduced from 34
                                fontWeight: FontWeight.bold,
                                color:
                                    isSel
                                        ? Colors.white
                                        : const Color(0xFF1E293B),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      ans == null
                          ? null
                          : () => ans == correct ? _show(true) : _show(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    'Check Answer',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _show(bool ok) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Text(
              ok ? 'Awesome!' : 'Oops!',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
            ),
            content: Text(
              ok ? 'You solved it correctly!' : 'Try again.',
              style: GoogleFonts.outfit(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (ok) Navigator.pop(context);
                },
                child: Text(
                  'OK',
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
}

// --- DRAWING SCREEN ---
class DrawingScreen extends StatefulWidget {
  const DrawingScreen({super.key});
  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<Offset?> pts = [];
  Color col = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1FF),
      appBar: AppBar(
        title: Text(
          'Art Zone',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_sweep_rounded,
              color: Color(0xFFE11D48),
            ),
            onPressed: () => setState(() => pts.clear()),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: GestureDetector(
                  onPanUpdate:
                      (d) => setState(() {
                        RenderBox box = context.findRenderObject() as RenderBox;
                        pts.add(box.globalToLocal(d.globalPosition));
                      }),
                  onPanEnd: (d) => pts.add(null),
                  child: CustomPaint(
                    painter: DrawingPainter(pts: pts, color: col, width: 5.0),
                    size: Size.infinite,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 40),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pick a Color',
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      [
                            const Color(0xFFE11D48), // Red
                            const Color(0xFF2563EB), // Blue
                            const Color(0xFF059669), // Green
                            const Color(0xFFD97706), // Orange
                            const Color(0xFF7C3AED), // Purple
                            const Color(0xFF1E293B), // Navy
                          ]
                          .map(
                            (c) => GestureDetector(
                              onTap: () => setState(() => col = c),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: col == c ? 50 : 40,
                                height: col == c ? 50 : 40,
                                decoration: BoxDecoration(
                                  color: c,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        col == c
                                            ? Colors.white
                                            : Colors.transparent,
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    if (col == c)
                                      BoxShadow(
                                        color: c.withOpacity(0.4),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> pts;
  final Color color;
  final double width;
  DrawingPainter({required this.pts, required this.color, required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint p =
        Paint()
          ..color = color
          ..strokeCap = StrokeCap.round
          ..strokeWidth = width;
    for (int i = 0; i < pts.length - 1; i++) {
      if (pts[i] != null && pts[i + 1] != null)
        canvas.drawLine(pts[i]!, pts[i + 1]!, p);
    }
  }

  @override
  bool shouldRepaint(covariant DrawingPainter oldDelegate) => true;
}
