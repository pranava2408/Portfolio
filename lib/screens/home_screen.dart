import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/top_nav_bar.dart';

// ==========================================
// HELPER: URL LAUNCHER
// ==========================================
Future<void> _launchExternalUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $urlString');
  }
}

// ==========================================
// MASTER HOME PAGE WRAPPER
// ==========================================
class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = const Color(0xFF111111);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const TopNavBar(), 
      
      // One global SelectionArea so recruiters can highlight anything
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              _HeroSection(),
              _AboutSection(),
              _TechStackSection(),
              _ProjectsSection(),
              _AchievementsSection(),
              _ContactSection(), 
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 1. HERO SECTION
// ==========================================
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    
    return Container(
      width: double.infinity,
      color: const Color(0xFF111111),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 40 : 20,
              vertical: isDesktop ? 120 : 60,
            ),
            child: Column(
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
                  'Competitive Programmer • Full-Stack Developer',
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
                    ElevatedButton.icon(
                      onPressed: () => _launchExternalUrl('https://drive.google.com/file/d/1h_-ITUG1fcuF9RoJfeuKOBvtp-c6YuiY/view?usp=sharing'),
                      icon: const Icon(Icons.description, color: Colors.black, size: 18),
                      label: const Text(
                        'RESUME',
                        style: TextStyle(color: Colors.black, letterSpacing: 2, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => _launchExternalUrl('https://github.com/pranava2408'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white.withOpacity(0.4)),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                        'VIEW GITHUB →',
                        style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.code, 'https://github.com/pranava2408'),
                    _buildSocialIcon(Icons.business_center, 'https://www.linkedin.com/in/balla-pranava-chaitanya-59b84628a/'),
                    _buildSocialIcon(Icons.terminal, 'https://leetcode.com/u/pranav2408/'),
                  ],
                ),
              ],
            ),
          ),
        ),
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

// ==========================================
// 2. DETAILED ABOUT SECTION
// ==========================================
class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final isTablet = MediaQuery.of(context).size.width > 600 && !isDesktop;

    return Container(
      color: const Color(0xFF0A0A0A),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 40 : 20,
              vertical: 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                SizedBox(
                  width: 800,
                  child: Column(
                    children: [
                      _buildBioText("I'm a pre-final year Computer Science Engineering student at NIT Silchar (Batch of 2027) and a passionate developer who enjoys solving complex problems and building meaningful digital experiences."),
                      const SizedBox(height: 20),
                      _buildBioText("My primary interests lie in competitive programming and full-stack software development. I enjoy breaking down complex problems using strong foundations in data structures and algorithms."),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
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
                LayoutBuilder(
                  builder: (context, constraints) {
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
                          iconColor: const Color(0xFF64B5F6),
                          title: 'Full-Stack Builder',
                          desc: 'From pixel-perfect Flutter frontends to robust backends with Node.js and MongoDB.',
                        ),
                        _buildTraitCard(
                          width: cardWidth,
                          icon: Icons.emoji_events_outlined,
                          iconColor: const Color(0xFFFFD54F),
                          title: 'Competitive Programmer',
                          desc: 'Sharpened problem-solving skills through ICPC, Meta Hacker Cup, and Codeforces.',
                        ),
                        _buildTraitCard(
                          width: cardWidth,
                          icon: Icons.psychology_outlined,
                          iconColor: const Color(0xFFBA68C8),
                          title: 'Problem Setter',
                          desc: 'Authored complex algorithmic challenges for events like Code Cauldron 3.0.',
                        ),
                        _buildTraitCard(
                          width: cardWidth,
                          icon: Icons.people_outline,
                          iconColor: const Color(0xFF4DB6AC),
                          title: 'Team Player',
                          desc: 'Experienced in collaborative, high-pressure environments like ICPC regionals.',
                        ),
                        _buildTraitCard(
                          width: cardWidth,
                          icon: Icons.rocket_launch_outlined,
                          iconColor: const Color(0xFFFF8A65),
                          title: 'Ship-First Mentality',
                          desc: 'I focus on delivering working, optimized products and learning from the data.',
                        ),
                        _buildTraitCard(
                          width: cardWidth,
                          icon: Icons.menu_book_outlined,
                          iconColor: const Color(0xFFF06292),
                          title: 'Always Growing',
                          desc: 'Currently diving deep into Computer Graphics and rigorous GATE CS preparation.',
                        ),
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget _buildBioText(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6), fontSize: 16, height: 1.8),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildStatCard(String value, String label, bool isDesktop) {
    return Container(
      width: isDesktop ? 220 : 160,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Text(value, style: GoogleFonts.oswald(color: Colors.white, fontSize: isDesktop ? 36 : 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(label, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.5), fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
        ],
      ),
    );
  }

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
          Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(desc, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.5), fontSize: 14, height: 1.6)),
        ],
      ),
    );
  }
}

// ==========================================
// 3. TECH STACK SECTION (Upgraded)
// ==========================================
class _TechStackSection extends StatelessWidget {
  const _TechStackSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    
    return Container(
      color: const Color(0xFF0A0A0A),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20, vertical: 60),
            child: Column(
              children: [
                Text('Tools I Work With', style: GoogleFonts.oswald(fontSize: isDesktop ? 42 : 28, fontWeight: FontWeight.w700, color: Colors.white)),
                const SizedBox(height: 60),
                
                // Languages
                _buildTechCategoryRow('LANGUAGES', [
                  _buildTechCard('C/C++', Icons.code, Colors.blueAccent),
                  _buildTechCard('Dart', Icons.data_object, Colors.lightBlue),
                  _buildTechCard('JavaScript', Icons.javascript, Colors.yellow),
                  _buildTechCard('HTML/CSS', Icons.html, Colors.orange),
                  _buildTechCard('SQL', Icons.table_chart, Colors.teal),
                  _buildTechCard('R', Icons.analytics, Colors.indigo),
                  _buildTechCard('MATLAB', Icons.functions, Colors.redAccent),
                ], isDesktop),
                _buildTechDivider(),

                // Frameworks
                _buildTechCategoryRow('FRAMEWORKS', [
                  _buildTechCard('Flutter', Icons.flutter_dash, Colors.cyan),
                  _buildTechCard('Node.js', Icons.terminal, Colors.green),
                  _buildTechCard('Express.js', Icons.api, Colors.white70),
                  _buildTechCard('Mongoose', Icons.schema, Colors.red),
                ], isDesktop),
                _buildTechDivider(),

                // Databases
                _buildTechCategoryRow('DATABASES', [
                  _buildTechCard('MongoDB', Icons.storage, Colors.greenAccent),
                  _buildTechCard('Firebase', Icons.local_fire_department, Colors.orangeAccent),
                ], isDesktop),
                _buildTechDivider(),

                // Tools
                _buildTechCategoryRow('TOOLS', [
                  _buildTechCard('Git', Icons.source, Colors.deepOrange),
                  _buildTechCard('GitHub', Icons.folder_shared, Colors.white),
                  _buildTechCard('VS Code', Icons.code, Colors.blue),
                  _buildTechCard('Visual Studio', Icons.developer_board, Colors.purple),
                  _buildTechCard('Android Studio', Icons.android, Colors.green),
                ], isDesktop),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTechCategoryRow(String title, List<Widget> items, bool isDesktop) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: isDesktop 
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text(title, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold))), 
              Expanded(flex: 8, child: Wrap(spacing: 15, runSpacing: 15, children: items))
            ]
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(title, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold)), 
              const SizedBox(height: 15), 
              Wrap(spacing: 15, runSpacing: 15, children: items)
            ]
          ),
    );
  }

  Widget _buildTechCard(String name, IconData icon, Color iconColor) {
    return Container(
      width: 90, height: 90,
      decoration: BoxDecoration(color: const Color(0xFF151515), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white.withOpacity(0.05))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: iconColor, size: 32), const SizedBox(height: 10), Text(name, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w500), textAlign: TextAlign.center,)]),
    );
  }

  Widget _buildTechDivider() {
    return Divider(color: Colors.white.withOpacity(0.05), thickness: 1, height: 1);
  }
}

// ==========================================
// 4. PROJECTS SECTION
// ==========================================
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    
    final List<Map<String, dynamic>> projects = [
      {
        'title': 'DSA Analyzer',
        'category': 'FULL-STACK PLATFORM',
        'description': 'A comprehensive platform featuring a rule-based model to analyze coding skills and suggest optimal data structure and algorithm resources.',
        'tags': ['Flutter', 'Node.js', 'Express', 'MongoDB'],
        'github': 'https://dsa-analyzer-five.vercel.app/', 
        'icon': Icons.analytics_outlined,
        'color': const Color(0xFF64B5F6),
      },
      {
        'title': 'Bluetooth Chess Application',
        'category': 'ALGORITHMIC ENGINE',
        'description': 'A fully functional chess application implementing complex game logic, move validation, and state management.',
        'tags': ['Dart', 'Flutter', 'Algorithms'],
        'github': 'https://github.com/pranava2408/chess_app', 
        'icon': Icons.sports_esports_outlined,
        'color': const Color(0xFFFFD54F),
      },
      {
        'title': '8085 Microprocessor',
        'category': 'SYSTEMS SIMULATOR',
        'description': 'A low-level simulator designed to parse, decode, and execute standard 8085 microprocessor instruction sets and memory operations.',
        'tags': ['C++', 'Architecture', 'Systems'],
        'github': 'https://8085emulator.vercel.app/', 
        'icon': Icons.memory_outlined,
        'color': const Color(0xFF4DB6AC),
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFF111111),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Featured Projects', style: GoogleFonts.oswald(color: Colors.white, fontSize: isDesktop ? 60 : 45, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isDesktop ? 2 : 1,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: isDesktop ? 1.4 : 1.0,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) => _ProjectCard(project: projects[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

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
          transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: const Color(0xFF151515),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isHovered ? primaryColor.withOpacity(0.5) : Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.project['icon'], color: primaryColor, size: 28),
              const Spacer(),
              Text(widget.project['title'], style: GoogleFonts.oswald(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(widget.project['description'], style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6), fontSize: 14), maxLines: 3, overflow: TextOverflow.ellipsis,),
              const Spacer(),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: (widget.project['tags'] as List<String>).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Text(tag, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.7), fontSize: 10, fontWeight: FontWeight.w500)),
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

// ==========================================
// 5. ACHIEVEMENTS SECTION
// ==========================================
class _AchievementsSection extends StatefulWidget {
  const _AchievementsSection();

  @override
  State<_AchievementsSection> createState() => _AchievementsSectionState();
}

class _AchievementsSectionState extends State<_AchievementsSection> {
  int? _hoveredIndex;

  final List<Map<String, String>> achievements = [
    {
      'id': '_01.',
      'title': 'ICPC REGIONALIST',
      'desc': 'Secured Rank 29 in the ICPC Chennai Regionals.',
      'image': 'assets/icpc.png', 
      'link': 'https://drive.google.com/file/d/1Jul0dW9rWbmhjUn_9RgvetYB0HrkfxVN/view',
    },
    {
      'id': '_02.',
      'title': 'META HACKER CUP',
      'desc': 'Secured a rank of 674 in Round 2 of the Hacker Cup.',
      'image': 'assets/hackercup.png', 
      'link': 'https://www.facebook.com/codingcompetitions/hacker-cup/2025/certificate/1581106245945975',
    },
    {
      'id': '_03.',
      'title': 'CODEFORCES EXPERT',
      'desc': 'Achieved Expert rating on Codeforces and 5-star on CodeChef.',
      'image': 'assets/expert.png', 
      'link': 'https://codeforces.com/profile/pranavachaitanyaballa', 
    }
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      color: const Color(0xFF0A0A0A),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20, vertical: 80),
            child: Column(
              children: [
                Text('My Coding Achievements', style: GoogleFonts.inter(fontSize: isDesktop ? 42 : 32, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 60),
                Column(
                  children: List.generate(achievements.length, (index) {
                    final item = achievements[index];
                    final isHovered = _hoveredIndex == index;

                    return MouseRegion(
                      cursor: SystemMouseCursors.click, 
                      onEnter: (_) => setState(() => _hoveredIndex = index),
                      onExit: (_) => setState(() => _hoveredIndex = null),
                      child: GestureDetector(
                        onTap: () => _launchExternalUrl(item['link']!), 
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1)))),
                          child: Row(
                            children: [
                              Text(item['id']!, style: GoogleFonts.inter(color: isHovered ? Colors.white : Colors.white.withOpacity(0.4))),
                              const SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item['title']!, style: GoogleFonts.oswald(color: isHovered ? const Color(0xFFF7D0A1) : Colors.white, fontSize: isDesktop ? 40 : 25)),
                                    const SizedBox(height: 8),
                                    Text(item['desc']!, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.5))),
                                  ],
                                ),
                              ),
                              if (isDesktop)
                                AnimatedOpacity(
                                  opacity: isHovered ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 250),
                                  child: Container(
                                    height: 100, width: 150,
                                    margin: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.02)),
                                    child: Image.asset(item['image']!, fit: BoxFit.contain),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 6. CONTACT SECTION
// ==========================================
class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      color: const Color(0xFF111111),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(width: 30, height: 1, color: Colors.white.withOpacity(0.5)),
                    const SizedBox(width: 15),
                    Text('GET IN TOUCH', style: GoogleFonts.inter(color: Colors.white.withOpacity(0.5), letterSpacing: 3, fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 20),
                Text("Let's work together", style: GoogleFonts.oswald(color: Colors.white, fontSize: isDesktop ? 60 : 45, fontWeight: FontWeight.bold, height: 1.1)),
                const SizedBox(height: 20),
                SizedBox(
                  width: 600,
                  child: Text("Have a project in mind, want to collaborate, or just say hello? I'm always open to new opportunities and conversations.", style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6), fontSize: 16, height: 1.6)),
                ),
                const SizedBox(height: 60),
                
                if (isDesktop)
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _ContactCard(title: 'EMAIL', subtitle: 'pranavachaitanyaballa@gmail.com', icon: Icons.mail_outline, iconColor: const Color(0xFFE57373), isEmail: true)),
                          const SizedBox(width: 20),
                          Expanded(child: _ContactCard(title: 'GITHUB', subtitle: 'pranava2408', icon: Icons.code, iconColor: Colors.white, link: 'https://github.com/pranava2408')),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: _ContactCard(title: 'LINKEDIN', subtitle: 'Connect on LinkedIn', icon: Icons.work_outline, iconColor: const Color(0xFF64B5F6), link: 'https://www.linkedin.com/in/balla-pranava-chaitanya-59b84628a/')),
                          const SizedBox(width: 20),
                          Expanded(child: _ContactCard(title: 'CODEFORCES', subtitle: 'Competitive Profile', icon: Icons.leaderboard_outlined, iconColor: const Color(0xFF81C784), link: 'https://codeforces.com/profile/pranav2408')),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      _ContactCard(title: 'EMAIL', subtitle: 'pranavachaitanyaballa@gmail.com', icon: Icons.mail_outline, iconColor: const Color(0xFFE57373), isEmail: true),
                      const SizedBox(height: 15),
                      _ContactCard(title: 'GITHUB', subtitle: 'pranava2408', icon: Icons.code, iconColor: Colors.white, link: 'https://github.com/pranava2408'),
                      const SizedBox(height: 15),
                      _ContactCard(title: 'LINKEDIN', subtitle: 'Connect on LinkedIn', icon: Icons.work_outline, iconColor: const Color(0xFF64B5F6), link: 'https://www.linkedin.com/in/balla-pranava-chaitanya-59b84628a/'),
                      const SizedBox(height: 15),
                      _ContactCard(title: 'CODEFORCES', subtitle: 'Competitive Profile', icon: Icons.leaderboard_outlined, iconColor: const Color(0xFF81C784), link: 'https://codeforces.com/profile/pranav2408'),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String? link;
  final bool isEmail;

  const _ContactCard({required this.title, required this.subtitle, required this.icon, required this.iconColor, this.link, this.isEmail = false});

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool isHovered = false;

  Future<void> _handleTap() async {
    if (widget.isEmail) {
      await Clipboard.setData(ClipboardData(text: widget.subtitle));
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${widget.subtitle} copied to clipboard!'), backgroundColor: const Color(0xFF1A1A1A), behavior: SnackBarBehavior.floating));
    } else if (widget.link != null) {
      _launchExternalUrl(widget.link!);
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
          decoration: BoxDecoration(color: const Color(0xFF151515), borderRadius: BorderRadius.circular(16), border: Border.all(color: isHovered ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.05)), boxShadow: [if (isHovered) BoxShadow(color: Colors.white.withOpacity(0.02), blurRadius: 20, spreadRadius: 5)]),
          child: Row(
            children: [
              Container(width: 50, height: 50, decoration: BoxDecoration(color: widget.iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Icon(widget.icon, color: widget.iconColor, size: 24)),
              const SizedBox(width: 20),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.title, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.5), fontSize: 11, letterSpacing: 1.5, fontWeight: FontWeight.w600)), const SizedBox(height: 6), Text(widget.subtitle, style: GoogleFonts.inter(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis)])),
              if (widget.isEmail) AnimatedOpacity(duration: const Duration(milliseconds: 200), opacity: isHovered ? 1.0 : 0.5, child: const Padding(padding: EdgeInsets.only(right: 15), child: Icon(Icons.copy, color: Colors.white, size: 16))),
              AnimatedOpacity(duration: const Duration(milliseconds: 200), opacity: isHovered ? 1.0 : 0.5, child: const Icon(Icons.arrow_outward, color: Colors.white, size: 18)),
            ],
          ),
        ),
      ),
    );
  }
}