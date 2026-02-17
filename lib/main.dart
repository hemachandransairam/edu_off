import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/selection_screens.dart';
import 'screens/game_screens.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/level_map_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox('studentBox');
  await Hive.openBox('settingsBox');

  // Initialize Supabase (User needs to replace these with their own)
  await Supabase.initialize(
    url: 'https://kbnzsoxdngsnbxfypoko.supabase.co',
    anonKey: 'sb_publishable_iuK2OH3EM-iHis0keHlYwQ_HUdVj7l8',
  );

  runApp(const KidsLearningApp());
}

class KidsLearningApp extends StatelessWidget {
  const KidsLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Learning App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8B80F8)),
        useMaterial3: true,
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case '/auth':
            return MaterialPageRoute(builder: (_) => const AuthPage());
          case '/standard_selection':
            return MaterialPageRoute(
              builder: (_) => const StandardSelectionScreen(),
            );
          case '/avatar':
            final standard = settings.arguments as int;
            return MaterialPageRoute(
              builder: (_) => AvatarSelectionScreen(standard: standard),
            );
          case '/home':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder:
                  (_) => HomeScreen(
                    standard: args['std'] as int,
                    avatar: args['avatar'] as String,
                  ),
            );
          case '/subject_selection':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder:
                  (_) => SubjectSelectionScreen(
                    standard: args['std'] as int,
                    mode: args['mode'] as String,
                  ),
            );
          case '/games_list':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder:
                  (_) => GamesListScreen(
                    standard: args['std'] as int,
                    subject: args['subject'] as String,
                  ),
            );
          case '/lessons_list':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder:
                  (_) => LessonsListScreen(
                    standard: args['std'] as int,
                    subject: args['subject'] as String,
                  ),
            );
          case '/game_lesson':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder:
                  (_) => LessonGameScreen(
                    title: args['title'] as String,
                    standard: args['std'] as int,
                    subject: args['subject'] as String,
                  ),
            );
          case '/game_quantity':
            return MaterialPageRoute(
              builder: (_) => const QuantityGameScreen(),
            );
          case '/game_addition':
            return MaterialPageRoute(
              builder:
                  (_) => const LessonGameScreen(
                    title: 'Addition',
                    standard: 1,
                    subject: 'Maths',
                  ),
            );
          case '/game_shapes':
            return MaterialPageRoute(builder: (_) => const ShapesGameScreen());
          case '/game_subtraction':
            return MaterialPageRoute(
              builder: (_) => const SubtractionGameScreen(),
            );
          case '/game_multiplication':
            return MaterialPageRoute(
              builder: (_) => const MultiplicationGameScreen(),
            );
          case '/drawing':
            return MaterialPageRoute(builder: (_) => const DrawingScreen());
          case '/game_match':
            final data = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => MatchGameScreen(data: data),
            );
          case '/game_fill_blanks':
            final data = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => FillBlanksGameScreen(data: data),
            );
          case '/game_compare':
            final data = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => CompareGameScreen(data: data),
            );
          case '/game_drag_drop':
            final data = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => DragDropGameScreen(data: data),
            );
          case '/topics_list':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder:
                  (_) => TopicsListScreen(
                    standard: args['std'] as int,
                    subject: args['subject'] as String,
                  ),
            );
          case '/level_map':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder:
                  (_) => LevelMapScreen(
                    topicName: args['topicName'] as String,
                    levels: args['levels'] as List<Map<String, dynamic>>,
                    subject: args['subject'] as String,
                    currentUnlockedLevel:
                        args['currentUnlockedLevel'] as int? ?? 1,
                  ),
            );
          default:
            return null;
        }
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAutoLogin();
  }

  void _checkAutoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    final settings = Hive.box('settingsBox');
    final email = settings.get('last_user_email');

    if (email != null) {
      final box = Hive.box('studentBox');
      final userData = box.get(email);
      if (userData != null && userData is Map) {
        String std = userData['standard'] ?? '';
        int stdInt = int.tryParse(std.replaceAll('Class ', '')) ?? 1;
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {
            'std': stdInt,
            'avatar': 'husky', // Default or saved avatar
          },
        );
        return;
      }
    }
    Navigator.pushReplacementNamed(context, '/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8B80F8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.school_rounded,
                size: 80,
                color: Color(0xFF8B80F8),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Kids Learn',
              style: GoogleFonts.outfit(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
