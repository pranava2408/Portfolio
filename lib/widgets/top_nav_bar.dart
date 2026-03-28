import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart'; // Imports the global themeNotifier

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if we are currently in dark mode to change icon
    var isDark = themeNotifier.value == ThemeMode.dark;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent, // Keeps the sleek background
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.go('/'),
          child: const Text(
            '<PRANAVA />', // Your sleek developer logo
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
      actions: [
        _NavBarLink(title: 'Home', path: '/'),
        _NavBarLink(title: 'Projects', path: '/projects'),
        _NavBarLink(title: 'About', path: '/about'),
        _NavBarLink(title: 'achievements', path: '/achievements'),
        _NavBarLink(title: 'contact', path: '/contact'),
        const SizedBox(width: 20),
        
        // The Dark/Light Mode Toggle Button
        IconButton(
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          splashRadius: 20,
          onPressed: () {
            // Flip the global theme variable!
            themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
            isDark = !isDark;
          },
        ),
        const SizedBox(width: 30), // Edge padding
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

// A reusable widget for your text links to keep code clean
class _NavBarLink extends StatelessWidget {
  final String title;
  final String path;

  const _NavBarLink({required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: () => context.go(path),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
        child: Text(title),
      ),
    );
  }
}