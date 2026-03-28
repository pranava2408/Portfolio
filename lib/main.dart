import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/achievements_screen.dart';
import 'package:my_portfolio/screens/contact_screen.dart';

import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/about_screen.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);
void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp.router(
          title: 'My Portfolio',
          debugShowCheckedModeBanner: false,

          // Tells the app which theme to currently use
          themeMode: currentMode,

          // --- 1. CRISP LIGHT THEME ---
            theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(
              0xFFFAFAFA,
            ), // Soft, clean white
            primaryColor: const Color(0xFF000000), // Black accents
            textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme.apply(
                bodyColor: const Color(
                  0xFF111827,
                ), // Very dark gray for readable text
                displayColor: const Color(0xFF111827),
              ),
            ),
          ),

          // --- 2. PURE BLACK DARK THEME ---
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(
              0xFF000000,
            ), // True sleek black
            primaryColor: const Color(0xFFFFFFFF), // White accents
            textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme.apply(
                bodyColor: const Color(
                  0xFFE5E7EB,
                ), // Soft off-white for reading comfort
                displayColor: Colors.white, // Stark white for big headings
              ),
            ),
          ),

          routerConfig: _router,
        );
      },
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/projects',
      builder: (context, state) => const ProjectsScreen(),
    ),
    GoRoute(path: '/about', builder: (context, state) => const AboutScreen()),
    GoRoute(
      path: '/achievements',
      builder: (context, state) => const AchievementsScreen(),
    ),
     GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
  ],
);
