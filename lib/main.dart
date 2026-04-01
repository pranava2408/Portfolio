import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/achievements_screen.dart';
import 'package:my_portfolio/screens/contact_screen.dart';
import 'package:my_portfolio/screens/splash_screen.dart';

import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/about_screen.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);
void main() {
  usePathUrlStrategy();
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
            scaffoldBackgroundColor: const Color(0xFFF9FAFB), // softer white
            primaryColor: const Color(0xFF2563EB),

            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            ),

            textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme.apply(
                bodyColor: const Color(0xFF111827),
                displayColor: const Color(0xFF111827),
              ),
            ),
          ),

          // --- 2. PURE BLACK DARK THEME ---
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF0D1117), // ✅ premium dark
            primaryColor: const Color(0xFF38BDF8), // accent color

            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF111827), // navbar separation
              elevation: 0,
            ),

            textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme.apply(
                bodyColor: const Color(0xFFE5E7EB),
                displayColor: Colors.white,
              ),
            ),
          ),

          routerConfig: _router,
        );
      },
    );
  }
}

// final GoRouter _router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(path: '/', builder: (context, state) => SplashScreen()),
//     GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
//     GoRoute(
//       path: '/projects',
//       builder: (context, state) => const ProjectsScreen(),
//     ),
//     GoRoute(path: '/about', builder: (context, state) => const AboutScreen()),
//     GoRoute(
//       path: '/achievements',
//       builder: (context, state) => const AchievementsScreen(),
//     ),
//     GoRoute(
//       path: '/contact',
//       builder: (context, state) => const ContactScreen(),
//     ),
//   ],
// );


// --- PREMIUM BOTTOM-TO-TOP TRANSITION HELPER ---
CustomTransitionPage buildPageWithSlideUpTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 400), // Speed of the slide
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // Starts at the bottom (Y = 1.0)
      const end = Offset.zero;        // Ends exactly in the center
      const curve = Curves.easeOutQuart; // Smooth deceleration

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


final GoRouter _router = GoRouter(
  initialLocation: '/', 
  routes: [
    GoRoute(
      path: '/',
      // Slide UP into the Home Screen!
      pageBuilder: (context, state) => buildPageWithSlideUpTransition(
        context: context,
        state: state,
        child:  SplashScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      // Slide UP into the Home Screen!
      pageBuilder: (context, state) => buildPageWithSlideUpTransition(
        context: context,
        state: state,
        child: PortfolioHomePage(),
      ),
    ),
    GoRoute(
      path: '/projects',
      // Slide UP into the Projects Screen!
      pageBuilder: (context, state) => buildPageWithSlideUpTransition(
        context: context,
        state: state,
        child: const ProjectsScreen(),
      ),
    ),
     GoRoute(
      path: '/about',
      // Slide UP into the Projects Screen!
      pageBuilder: (context, state) => buildPageWithSlideUpTransition(
        context: context,
        state: state,
        child: const AboutScreen(),
      ),
    ),
     GoRoute(
      path: '/contact',
      // Slide UP into the Projects Screen!
      pageBuilder: (context, state) => buildPageWithSlideUpTransition(
        context: context,
        state: state,
        child: const ContactScreen(),
      ),
    ),
     GoRoute(
      path: '/achievements',
      // Slide UP into the Projects Screen!
      pageBuilder: (context, state) => buildPageWithSlideUpTransition(
        context: context,
        state: state,
        child: const AchievementsScreen(),
      ),
    ),
    // ... apply this same pageBuilder pattern to About, Contact, etc.
  ],
);