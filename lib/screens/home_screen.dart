import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/top_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SelectableText(
              "Hi, I'm",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SelectableText(
              "Balla Pranava Chaitanya",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SelectableText(
              'Flutter Developer | Competitive Programmer',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () async {
                final Uri resume = Uri.parse(
                  'https://drive.google.com/file/d/1h_-ITUG1fcuF9RoJfeuKOBvtp-c6YuiY/view?usp=sharing',
                );
                if (!await launchUrl(resume)) {
                  debugPrint('could not load the resume');
                }
              },
              label: SelectableText('View Resume'),
              icon: Icon(Icons.download),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                backgroundColor: Theme.of(
                  context,
                ).primaryColor, // Uses your accent color
                foregroundColor:
                    Colors.black, // High contrast text on the button
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ), // Sleek, slightly rounded corners
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
