import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  String title;
  VoidCallback onPressed;
  bool isActive = false;
  NavItem({super.key, required this.title, required this.onPressed});
  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },

      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },

      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            border: widget.isActive
                ? Border(bottom: BorderSide(color: Colors.white, width: 2))
                : null,
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              color: isHover || widget.isActive ? Colors.red : Colors.blue,
              fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
    // throw UnimplementedError();
  }
}
