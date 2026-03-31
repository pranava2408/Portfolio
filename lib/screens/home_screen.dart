import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import '../widgets/top_nav_bar.dart';

Future<void> _launchExternalUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $urlString');
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = const Color(0xFF111111);
    final darkSectionBg = const Color(0xFF0A0A0A);

    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: TopNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==========================================
            // SECTION 1: THE HERO
            // ==========================================
            Container(
              width: double.infinity,
              color: bgColor,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 40 : 20,
                      vertical: isDesktop ? 120 : 60,
                    ),
                    child: _buildHeroContent(context, isDesktop: isDesktop),
                  ),
                ),
              ),
            ),

            // ==========================================
            // SECTION 2: ABOUT ME & TECH STACK
            // ==========================================
            Container(
              width: double.infinity,
              color: darkSectionBg,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 40 : 20,
                      vertical: isDesktop ? 100 : 60,
                    ),
                    child: Column(
                      children: [
                        _buildAboutSection(context, isDesktop: isDesktop),
                        const SizedBox(height: 100),
                        _buildTechStackSection(context, isDesktop: isDesktop),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // HERO CONTENT (With ShaderMask & High Contrast)
  // ==========================================
  Widget _buildHeroContent(BuildContext context, {required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '— WELCOME TO MY WORLD',
          style: GoogleFonts.inter(
            letterSpacing: 3,
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),

        // Premium metallic glowing copper gradient
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFF7D0A1), Color(0xFF9B5E36)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            "I'M PRANAVA\nCHAITANYA",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              fontSize: isDesktop ? 95 : 55,
              height: 1.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Competitive Programmer • Flutter Developer',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: isDesktop ? 20 : 16,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'I craft performant web applications, solve algorithmic challenges,\nand build products that people actually use.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.white.withOpacity(0.5),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 50),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _buildPrimaryButton(
              'RESUME',
              Icons.description,
              'https://drive.google.com/file/d/1h_-ITUG1fcuF9RoJfeuKOBvtp-c6YuiY/view?usp=sharing',
            ),
            _buildOutlinedButton(context, 'VIEW WORK →'),
          ],
        ),
        const SizedBox(height: 50),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(Icons.code, 'https://github.com/pranava2408'),
            _buildSocialIcon(
              Icons.business_center,
              'https://www.linkedin.com/in/balla-pranava-chaitanya-59b84628a/',
            ),
            _buildSocialIcon(
              Icons.terminal,
              'https://leetcode.com/u/pranav2408/',
            ),
            _buildSocialIcon(
              Icons.email,
              'mailto:pranavachaitanyaballa@gmail.com',
            ),
          ],
        ),
      ],
    );
  }

  // ==========================================
  // ABOUT SECTION
  // ==========================================
  Widget _buildAboutSection(BuildContext context, {required bool isDesktop}) {
    final darkBgTextColor = Colors.white.withOpacity(0.85);
    final mutedTextColor = Colors.white.withOpacity(0.5);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '- A LITTLE ABOUT ME',
          style: GoogleFonts.inter(
            letterSpacing: 3,
            color: mutedTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Building efficient solutions with code',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: isDesktop ? 42 : 28,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          "I'm a third year Computer Science Engineering student at NIT Silchar and a passionate developer who enjoys solving complex problems and building meaningful digital experiences.",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.8,
            color: darkBgTextColor,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "My primary interests lie in competitive programming, algorithms, and software development. I enjoy breaking down complex problems and designing efficient solutions using strong foundations in data structures and algorithms. Alongside problem solving, I love building modern and interactive web applications, focusing on clean design, performance, and scalability.",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.8,
            color: darkBgTextColor,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "I'm constantly exploring new technologies, improving my coding skills, and working on projects that push me to grow as a developer.",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.8,
            color: darkBgTextColor,
          ),
        ),
        const SizedBox(height: 50),

        OutlinedButton(
          onPressed: () => context.go('/about'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(color: Colors.white.withOpacity(0.3)),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Learn More →',
            style: TextStyle(letterSpacing: 1.2, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // ==========================================
  // TECH STACK SECTION (Native Icons Only)
  // ==========================================
  Widget _buildTechStackSection(
    BuildContext context, {
    required bool isDesktop,
  }) {
    final mutedTextColor = Colors.white.withOpacity(0.5);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '- TECH STACK',
          style: GoogleFonts.inter(
            letterSpacing: 3,
            color: mutedTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Tools I Work With',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: isDesktop ? 42 : 28,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 60),

        _buildTechCategoryRow('LANGUAGES', [
          _buildTechCard('C++', Icons.code, Colors.blueAccent),
          _buildTechCard('Dart', Icons.data_object, Colors.lightBlue),
          _buildTechCard('JavaScript', Icons.javascript, Colors.yellow),
        ], isDesktop),
        _buildTechDivider(),

        _buildTechCategoryRow('FRONTEND', [
          _buildTechCard('Flutter', Icons.flutter_dash, Colors.cyan),
        ], isDesktop),
        _buildTechDivider(),

        _buildTechCategoryRow('BACKEND', [
          _buildTechCard('Node.js', Icons.terminal, Colors.green),
          _buildTechCard('Express.js', Icons.api, Colors.white70),
        ], isDesktop),
        _buildTechDivider(),

        _buildTechCategoryRow('DATABASE', [
          _buildTechCard('MongoDB', Icons.storage, Colors.greenAccent),
        ], isDesktop),
        _buildTechDivider(),

        _buildTechCategoryRow('TOOLS', [
          _buildTechCard('Git', Icons.source, Colors.deepOrange),
          _buildTechCard('GitHub', Icons.folder_shared, Colors.white),
          _buildTechCard('Postman', Icons.network_ping, Colors.orange),
        ], isDesktop),
      ],
    );
  }

  Widget _buildTechCategoryRow(
    String title,
    List<Widget> items,
    bool isDesktop,
  ) {
    if (isDesktop) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.6),
                  letterSpacing: 2,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Wrap(spacing: 15, runSpacing: 15, children: items),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.white.withOpacity(0.6),
                letterSpacing: 2,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(spacing: 15, runSpacing: 15, children: items),
          ],
        ),
      );
    }
  }

  Widget _buildTechCard(String name, IconData icon, Color iconColor) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 32),
          const SizedBox(height: 10),
          Text(
            name,
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechDivider() {
    return Divider(
      color: Colors.white.withOpacity(0.05),
      thickness: 1,
      height: 1,
    );
  }

  // ==========================================
  // BUTTONS & ICONS (High Contrast Dark Mode)
  // ==========================================
  Widget _buildPrimaryButton(String text, IconData icon, String url) {
    return ElevatedButton.icon(
      onPressed: () => _launchExternalUrl(url),
      icon: Icon(icon, color: Colors.black, size: 18),
      label: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, String text) {
    return OutlinedButton(
      onPressed: () => context.go('/projects'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withOpacity(0.4)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: const TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => _launchExternalUrl(url),
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Icon(icon, size: 18, color: Colors.white.withOpacity(0.8)),
        ),
      ),
    );
  }
}
