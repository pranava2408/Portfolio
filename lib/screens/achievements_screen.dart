import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; 
import '../widgets/top_nav_bar.dart'; 

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  // Tracks which achievement is currently being hovered
  int? _hoveredIndex;

  final List<Map<String, String>> achievements = [
    {
      'id': '_01.',
      'title': 'ICPC REGIONALIST',
      'desc': 'Secured Rank 29 in the ICPC Chennai Regionals 2025 with Team AC Hunters, competing against top programmers across the region.',
      'image': 'assets/icpc.png', 
      'link': 'https://drive.google.com/file/d/1Jul0dW9rWbmhjUn_9RgvetYB0HrkfxVN/view',
    },
    {
      'id': '_02.',
      'title': 'META HACKER CUP',
      'desc': 'Secured a rank of 674 in Round 2 of the prestigious Meta Hacker Cup.',
      'image': 'assets/hackercup.png', 
      'link': 'https://www.facebook.com/codingcompetitions/hacker-cup/2025/certificate/1581106245945975',
    },
    {
      'id': '_03.',
      'title': 'CODEFORCES EXPERT',
      'desc': 'Achieved Expert rating on Codeforces and 5-star rating on CodeChef, placing in the top percentile globally.',
      'image': 'assets/expert.png', 
      'link': 'https://codeforces.com/profile/pranavachaitanyaballa', 
    }
  ];

  Future<void> _launchExternalUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final bgColor = const Color(0xFF111111); 

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const TopNavBar(), 
      
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            // Constrains the list width so it doesn't stretch too wide on huge monitors
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 40 : 20,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'My Coding Achievements',
                    style: GoogleFonts.inter(
                      fontSize: isDesktop ? 42 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 60),
                  
                  // No more split screen! Just the list.
                  _buildAchievementsList(isDesktop: isDesktop),
                    
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementsList({required bool isDesktop}) {
    return Column(
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
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                  bottom: index == achievements.length - 1
                      ? BorderSide(color: Colors.white.withOpacity(0.1), width: 1)
                      : BorderSide.none,
                ),
              ),
              // Align items to center vertically so the image looks aligned with the text
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. The Number
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      item['id']!,
                      style: GoogleFonts.inter(
                        color: isHovered ? Colors.white : Colors.white.withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                  // 2. The Title and Description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: GoogleFonts.oswald(
                            color: isHovered ? const Color(0xFFF7D0A1) : Colors.white,
                            fontSize: isDesktop ? 55 : 35,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                            letterSpacing: 1.5,
                          ),
                          child: Text(item['title']!),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['desc']!,
                          style: GoogleFonts.inter(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // 3. THE NEW INLINE IMAGE PREVIEW (Desktop Only)
                  if (isDesktop)
                    AnimatedOpacity(
                      opacity: isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: Container(
                        height: 140, // Height of the preview
                        width: 200,  // Width of the preview
                        margin: const EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          // Subtle background for transparent PDFs
                          color: Colors.white.withOpacity(0.02), 
                          border: Border.all(color: Colors.white.withOpacity(0.1)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['image']!,
                            // THIS IS THE FIX: contain ensures the entire image fits inside the box!
                            fit: BoxFit.contain, 
                          ),
                        ),
                      ),
                    ),

                  // 4. The Clickable Link Icon
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: AnimatedOpacity(
                      opacity: isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(
                        Icons.open_in_new,
                        color: Color(0xFFF7D0A1),
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}