import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for Clipboard
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/top_nav_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final bgColor = const Color(0xFF111111);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const TopNavBar(),

      // The SelectionArea allows users to press Ctrl+A or highlight text!
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40 : 20,
                  vertical: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- HEADER SECTION ---
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 1,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'GET IN TOUCH',
                          style: GoogleFonts.inter(
                            color: Colors.white.withOpacity(0.5),
                            letterSpacing: 3,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Let's work together",
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: isDesktop ? 60 : 45,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 600,
                      child: Text(
                        "Have a project in mind, want to collaborate, or just say hello? I'm always open to new opportunities and conversations.",
                        style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),

                    // --- GRID SECTION ---
                    if (isDesktop)
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _ContactCard(
                                  title: 'EMAIL',
                                  subtitle:
                                      'pranavachaitanya@gmail.com', // Update with your actual email
                                  icon: Icons.mail_outline,
                                  iconColor: const Color(0xFFE57373),
                                  isEmail: true,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _ContactCard(
                                  title: 'GITHUB',
                                  subtitle: 'pranava2408', // Update this
                                  icon: Icons
                                      .code, // Can swap with FontAwesome Github icon
                                  iconColor: Colors.white,
                                  link: 'https://github.com/pranava2408',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: _ContactCard(
                                  title: 'LINKEDIN',
                                  subtitle: 'Connect on LinkedIn',
                                  icon: Icons
                                      .work_outline, // Can swap with FontAwesome LinkedIn icon
                                  iconColor: const Color(0xFF64B5F6),
                                  link:
                                      'https://www.linkedin.com/in/balla-pranava-chaitanya-59b84628a/', // Update this
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _ContactCard(
                                  title: 'CODEFORCES',
                                  subtitle: 'Competitive Profile',
                                  icon: Icons.leaderboard_outlined,
                                  iconColor: const Color(0xFF81C784),
                                  link:
                                      'https://codeforces.com/profile/pranav2408',
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    else
                      // Mobile Layout: Stack them vertically
                      Column(
                        children: [
                          _ContactCard(
                            title: 'EMAIL',
                            subtitle:
                                'pranavachaitanya@gmail.com', // Update this
                            icon: Icons.mail_outline,
                            iconColor: const Color(0xFFE57373),
                            isEmail: true,
                          ),
                          const SizedBox(height: 15),
                          _ContactCard(
                            title: 'GITHUB',
                            subtitle: 'pranava2408', // Update this
                            icon: Icons.code,
                            iconColor: Colors.white,
                            link: 'https://github.com/pranava2408',
                          ),
                          const SizedBox(height: 15),
                          _ContactCard(
                            title: 'LINKEDIN',
                            subtitle: 'Connect on LinkedIn',
                            icon: Icons.work_outline,
                            iconColor: const Color(0xFF64B5F6),
                            link:
                                'https://www.linkedin.com/in/balla-pranava-chaitanya-59b84628a/', // Update this
                          ),
                          const SizedBox(height: 15),
                          _ContactCard(
                            title: 'CODEFORCES',
                            subtitle: 'Competitive Profile',
                            icon: Icons.leaderboard_outlined,
                            iconColor: const Color(0xFF81C784),
                            link:
                                'https://codeforces.com/profile/pranavachaitanyaballa',
                          ),
                        ],
                      ),

                    const SizedBox(height: 40),
                    Text(
                      'Prefer email? I typically respond within 24 hours.',
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- INTERACTIVE CARD WIDGET ---
class _ContactCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String? link;
  final bool isEmail;

  const _ContactCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.link,
    this.isEmail = false,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool isHovered = false;

  Future<void> _handleTap() async {
    if (widget.isEmail) {
      // Copies email to clipboard
      await Clipboard.setData(ClipboardData(text: widget.subtitle));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.subtitle} copied to clipboard!'),
            backgroundColor: const Color(0xFF1A1A1A),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } else if (widget.link != null) {
      // Opens external link
      final Uri url = Uri.parse(widget.link!);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch ${widget.link}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF111111),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered
                  ? Colors.white.withOpacity(0.3)
                  : Colors.white.withOpacity(0.05),
              width: 1,
            ),
            // Subtle glow effect on hover
            boxShadow: [
              if (isHovered)
                BoxShadow(
                  color: Colors.white.withOpacity(0.02),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
            ],
          ),
          child: Row(
            children: [
              // Icon Container with tinted background
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: widget.iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 24),
              ),
              const SizedBox(width: 20),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 11,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.subtitle,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Action Icons (Copy for email, Arrow for links)
              if (widget.isEmail)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isHovered ? 1.0 : 0.5,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.copy, color: Colors.white, size: 16),
                  ),
                ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isHovered ? 1.0 : 0.5,
                child: const Icon(
                  Icons.arrow_outward,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
