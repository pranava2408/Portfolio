import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/top_nav_bar.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopNavBar(),
      body: Center(
        child: Text(
          'projects',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
