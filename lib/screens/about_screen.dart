import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/top_nav_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // navBar:TopNavBar(),
      appBar: TopNavBar(),
      body: Center(child: Text('About me!!',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold
      ),)),
    );
  }
}
