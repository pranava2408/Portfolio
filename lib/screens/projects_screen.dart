import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/top_nav_bar.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  // --- PROJECT DATA ---
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'DSA Analyzer',
      'category': 'FULL-STACK PLATFORM',
      'description':
          'A comprehensive platform featuring a rule-based model to analyze coding skills and suggest optimal data structure and algorithm resources.',
      'tags': ['Flutter', 'Node.js', 'Express', 'MongoDB'],
      'github':
          'https://dsa-analyzer-five.vercel.app/', // Update with actual repo
      'icon': Icons.analytics_outlined,
      'color': const Color(0xFF64B5F6), // Blue
    },

    {
      'title': 'Bluetooth Chess Application',
      'category': 'ALGORITHMIC ENGINE',
      'description':
          'A fully functional chess application implementing complex game logic, move validation, and state management.',
      'tags': ['Dart', 'Flutter', 'Algorithms'],
      'github':
          'https://github.com/pranava2408/chess_app', // Update with actual repo
      'icon': Icons.sports_esports_outlined,
      'color': const Color(0xFFFFD54F), // Yellow
    },
    {
      'title': '8085 Microprocessor',
      'category': 'SYSTEMS SIMULATOR',
      'description':
          'A low-level simulator designed to parse, decode, and execute standard 8085 microprocessor instruction sets and memory operations.',
      'tags': ['C++', 'Architecture', 'Systems'],
      'github': 'https://8085emulator.vercel.app/', // Update with actual repo
      'icon': Icons.memory_outlined,
      'color': const Color(0xFF4DB6AC), // Teal
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final isTablet = MediaQuery.of(context).size.width > 600 && !isDesktop;
    final bgColor = const Color(0xFF111111);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const TopNavBar(),

      // SelectionArea allows recruiters to copy your project descriptions!
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
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
                          'MY WORK',
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
                      'Featured Projects',
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
                        "A selection of my recent work, focusing on full-stack architecture, algorithmic complexity, and scalable systems.",
                        style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),

                    // --- PROJECTS GRID ---
                    LayoutBuilder(
                      builder: (context, constraints) {
                        // 2 columns for Desktop/Tablet, 1 column for Mobile
                        int crossAxisCount = isDesktop || isTablet ? 2 : 1;
                        double childAspectRatio = isDesktop
                            ? 1.4
                            : (isTablet ? 1.2 : 1.0);

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30,
                                childAspectRatio: childAspectRatio,
                              ),
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return _ProjectCard(project: projects[index]);
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 100),
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

// --- INTERACTIVE PROJECT CARD WIDGET ---
class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  Future<void> _launchExternalUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = widget.project['color'];

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => _launchExternalUrl(widget.project['github']),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: const Color(0xFF151515), // Deep grey background
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered
                  ? primaryColor.withOpacity(0.5)
                  : Colors.white.withOpacity(0.05),
              width: 1,
            ),
            boxShadow: [
              if (isHovered)
                BoxShadow(
                  color: primaryColor.withOpacity(0.05),
                  blurRadius: 30,
                  spreadRadius: -5,
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Icon and GitHub Link
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.project['icon'],
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isHovered ? 1.0 : 0.4,
                    child: const Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Project Info
              Text(
                widget.project['category'],
                style: GoogleFonts.inter(
                  color: primaryColor,
                  fontSize: 10,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.project['title'],
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.project['description'],
                style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  height: 1.6,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),

              // Tech Stack Tags
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: (widget.project['tags'] as List<String>).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
