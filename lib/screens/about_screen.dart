import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/top_nav_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final isTablet = MediaQuery.of(context).size.width > 600 && !isDesktop;
    final bgColor = const Color(0xFF111111);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const TopNavBar(),
      body: SelectionArea( // Enables text selection across the page!
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40 : 20,
                  vertical: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // --- SECTION 1: A LITTLE ABOUT ME ---
                    _buildSectionHeader('A LITTLE ABOUT ME'),
                    const SizedBox(height: 20),
                    Text(
                      'Building efficient solutions with code',
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: isDesktop ? 45 : 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    
                    // Bio Paragraphs
                    SizedBox(
                      width: 800,
                      child: Column(
                        children: [
                          _buildBioText(
                            "I'm a pre-final year Computer Science Engineering student at NIT Silchar (Batch of 2027) and a passionate developer who enjoys solving complex problems and building meaningful digital experiences.",
                          ),
                          const SizedBox(height: 20),
                          _buildBioText(
                            "My primary interests lie in competitive programming and full-stack software development. I enjoy breaking down complex problems using strong foundations in data structures and algorithms. Alongside competitive coding, I love building modern, cross-platform applications utilizing Flutter and Node.js, focusing on scalable backend architectures.",
                          ),
                          const SizedBox(height: 20),
                          _buildBioText(
                            "I'm constantly exploring new technologies, from integrating AI like the Gemini API to studying Compiler Design and Computer Graphics, always working on projects that push me to grow as a developer.",
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 100),

                    // --- SECTION 2: WHY ME ---
                    _buildSectionHeader('WHY ME'),
                    const SizedBox(height: 20),
                    Text(
                      'What I Bring to the Table',
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: isDesktop ? 45 : 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    
                    // The Quote
                    SizedBox(
                      width: 800,
                      child: Text(
                        "\"I'm not just a developer who writes code — I'm someone who genuinely cares about the underlying architecture. Whether it's helping students find resources with my DSA Analyzer or parsing AI data with a Document Processor, I build with purpose.\"",
                        style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: isDesktop ? 18 : 16,
                          fontStyle: FontStyle.italic,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 60),

                    // --- STATS ROW ---
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildStatCard('2000+', 'DSA PROBLEMS SOLVED', isDesktop),
                        _buildStatCard('Rank 29', 'ICPC CHENNAI REGIONALS', isDesktop),
                        _buildStatCard('Expert', 'CODEFORCES RATING', isDesktop),
                        _buildStatCard('9.35', 'CGPA AT NIT SILCHAR', isDesktop),
                      ],
                    ),

                    const SizedBox(height: 60),

                    // --- TRAITS GRID ---
                    LayoutBuilder(
                      builder: (context, constraints) {
                        // Calculate width for 3 columns on desktop, 2 on tablet, 1 on mobile
                        double cardWidth = isDesktop 
                            ? (constraints.maxWidth - 40) / 3 
                            : isTablet 
                                ? (constraints.maxWidth - 20) / 2 
                                : constraints.maxWidth;

                        return Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            _buildTraitCard(
                              width: cardWidth,
                              icon: Icons.code,
                              iconColor: const Color(0xFF64B5F6), // Blue
                              title: 'Full-Stack Builder',
                              desc: 'From pixel-perfect Flutter frontends to robust backends with Node.js and MongoDB — I build end-to-end applications.',
                            ),
                            _buildTraitCard(
                              width: cardWidth,
                              icon: Icons.emoji_events_outlined,
                              iconColor: const Color(0xFFFFD54F), // Yellow
                              title: 'Competitive Programmer',
                              desc: 'Sharpened problem-solving skills through ICPC, Meta Hacker Cup, and Codeforces, bringing algorithmic thinking to real-world engineering.',
                            ),
                            _buildTraitCard(
                              width: cardWidth,
                              icon: Icons.psychology_outlined,
                              iconColor: const Color(0xFFBA68C8), // Purple
                              title: 'Problem Setter',
                              desc: 'Authored and prepared complex algorithmic challenges for events like Code Cauldron 3.0 and nits hacks 8.0.',
                            ),
                            _buildTraitCard(
                              width: cardWidth,
                              icon: Icons.people_outline,
                              iconColor: const Color(0xFF4DB6AC), // Teal
                              title: 'Team Player',
                              desc: 'Experienced in collaborative, high-pressure environments like the ICPC regionals with Team AC Hunters. Clear communication comes naturally.',
                            ),
                            _buildTraitCard(
                              width: cardWidth,
                              icon: Icons.rocket_launch_outlined,
                              iconColor: const Color(0xFFFF8A65), // Orange
                              title: 'Ship-First Mentality',
                              desc: 'I focus on delivering working, optimized products. Iterate fast, learn from the data, and continuously improve the architecture.',
                            ),
                            _buildTraitCard(
                              width: cardWidth,
                              icon: Icons.menu_book_outlined,
                              iconColor: const Color(0xFFF06292), // Pink
                              title: 'Always Growing',
                              desc: 'Currently diving deep into Social Network Analysis, advanced Computer Graphics, and rigorous GATE CS preparation.',
                            ),
                          ],
                        );
                      }
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper for Section Headers (e.g., "- A LITTLE ABOUT ME")
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 30, height: 1, color: Colors.white.withOpacity(0.5)),
        const SizedBox(width: 15),
        Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.5),
            letterSpacing: 3,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 15),
        Container(width: 30, height: 1, color: Colors.white.withOpacity(0.5)),
      ],
    );
  }

  // Helper for Bio Text
  Widget _buildBioText(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: Colors.white.withOpacity(0.6),
        fontSize: 16,
        height: 1.8,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Helper for Top Stats (e.g., 2000+ DSA)
  Widget _buildStatCard(String value, String label, bool isDesktop) {
    return Container(
      width: isDesktop ? 220 : 160,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF151515), // Very dark grey, almost black
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: isDesktop ? 36 : 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.5),
              fontSize: 10,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Helper for the Grid Traits
  Widget _buildTraitCard({
    required double width,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String desc,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}