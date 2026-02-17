import '../data/std1/syllabus.dart';
import '../data/std2/syllabus.dart';
import '../data/std3/syllabus.dart';
import '../data/std4/syllabus.dart';
import '../data/std5/syllabus.dart';

class SyllabusModel {
  static List<String> getSubjects() {
    return ['Tamil', 'English', 'Maths', 'EVS', 'Art & Craft', 'Music', 'PE'];
  }

  static List<Map<String, dynamic>> getAllContent(
    int standard,
    String subject,
  ) {
    List<Map<String, dynamic>> source = [];

    switch (standard) {
      case 1:
        source = std1Content;
        break;
      case 2:
        source = std2Content;
        break;
      case 3:
        source = std3Content;
        break;
      case 4:
        source = std4Content;
        break;
      case 5:
        source = std5Content;
        break;
    }

    return source.where((item) => item['subject'] == subject).toList();
  }

  static List<Map<String, dynamic>> getFilteredContent(
    int standard,
    String subject,
    String mode,
  ) {
    final all = getAllContent(standard, subject);
    // If mode is 'lessons', show 'learning' category items
    // If mode is 'games', show 'gaming' category items
    // Default to show all if category is missing
    return all.where((item) {
      if (mode == 'lessons') {
        return item['category'] == 'learning' || item['category'] == null;
      } else {
        return item['category'] == 'gaming' || item['category'] == null;
      }
    }).toList();
  }

  static List<Map<String, dynamic>> getLessons(int standard) {
    List<Map<String, dynamic>> all = [];
    for (var sub in getSubjects()) {
      all.addAll(getAllContent(standard, sub));
    }
    return all;
  }

  static List<Map<String, dynamic>> getQuestions(int standard, String subject) {
    // This is for MCQ style lessons if they are separate from 'getAllContent'
    // For now, most content is integrated into games via getAllContent
    return [];
  }

  // Get topics with levels for a given standard and subject
  static Map<String, List<Map<String, dynamic>>> getTopics(
    int standard,
    String subject,
  ) {
    Map<String, List<Map<String, dynamic>>> topicsSource = {};

    switch (standard) {
      case 1:
        topicsSource = std1Topics;
        break;
      case 2:
        topicsSource = std2Topics;
        break;
      // Add other standards as needed
      default:
        return {};
    }

    // Filter topics by subject
    return Map.fromEntries(
      topicsSource.entries.where((entry) {
        if (entry.value.isEmpty) return false;
        return entry.value.first['subject'] == subject;
      }),
    );
  }
}
