import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/top_nav_bar.dart';


class AchievementsScreen extends StatelessWidget{
  const AchievementsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      appBar: TopNavBar(),
      body: Center(
        child: Text(
          'icpc regionalist... etc',
          style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}