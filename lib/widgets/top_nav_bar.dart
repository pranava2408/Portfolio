import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/widgets/nav_item.dart';
import '../main.dart'; // Imports the global themeNotifier

class TopNavBar extends StatefulWidget implements PreferredSizeWidget {
  const TopNavBar({super.key});

  @override
  State<TopNavBar> createState() => _TopNavBarState();

  @override
  // 70 is the perfect height. I removed the SizedBox(height: 40) wrapper you had, 
  // as wrapping an AppBar in a SizedBox breaks standard Flutter layout rules!
  Size get preferredSize => const Size.fromHeight(70); 
}

class _TopNavBarState extends State<TopNavBar> {
  
  // --- THE MOBILE TOGGLE MENU ---
  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Wraps tightly around your buttons
              children: [
                // We pass isMobile: true so the button knows to close the menu when tapped!
                _NavBarLink(title: 'Home', path: '/home', isMobile: true),
                const SizedBox(height: 15),
                _NavBarLink(title: 'Projects', path: '/projects', isMobile: true),
                const SizedBox(height: 15),
                _NavBarLink(title: 'About', path: '/about', isMobile: true),
                const SizedBox(height: 15),
                _NavBarLink(title: 'Achievements', path: '/achievements', isMobile: true),
                const SizedBox(height: 15),
                _NavBarLink(title: 'Contact', path: '/contact', isMobile: true),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var isDark = themeNotifier.value == ThemeMode.dark;
    
    // THE BREAKPOINT
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.go('/home'),
          child: const Text(
            'Balla Pranava Chaitanya',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
          ),
        ),
      ),
      actions: [
        // DESKTOP: Render your custom buttons in a row
        if (isDesktop) ...[
          const _NavBarLink(title: 'Home', path: '/home'),
          const _NavBarLink(title: 'Projects', path: '/projects'),
          const _NavBarLink(title: 'About', path: '/about'),
          const _NavBarLink(title: 'Achievements', path: '/achievements'),
          const _NavBarLink(title: 'Contact', path: '/contact'),
          const SizedBox(width: 20),
        ],

        // SHARED: Theme Toggle
        IconButton(
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          splashRadius: 20,
          onPressed: () {
            themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
            setState(() {});
          },
        ),

        // MOBILE: Render the Hamburger Menu Toggle
        if (!isDesktop)
          IconButton(
            icon: const Icon(Icons.menu),
            splashRadius: 20,
            onPressed: () => _showMobileMenu(context), // Triggers your custom bottom sheet
          ),
          
        const SizedBox(width: 20), 
      ],
    );
  }
}

// --- YOUR CUSTOM BUTTON WRAPPER ---
class _NavBarLink extends StatelessWidget {
  final String title;
  final String path;
  final bool isMobile; 

  const _NavBarLink({
    required this.title, 
    required this.path,
    this.isMobile = false, // Defaults to false for desktop
  });

  @override
  Widget build(BuildContext context) {
    return NavItem( // Your highly customized NavItem is perfectly preserved!
      title: title,
      onPressed: () {
        if (isMobile) {
          Navigator.pop(context); // Slide the menu down before routing
        }
        context.go(path);
      },
    );
  }
}