import 'package:flutter/material.dart';
import 'package:food_application/utils/dimension.dart';
class BtnIconBar extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final Color color;
  final double size;
  final double iconSize;
  BtnIconBar(
      {super.key,
      required this.icon,
        this.iconBackgroundColor = const Color(0x78ffffff),
        this.color = const Color(0xa4363534),
        this.size = 40,
        this.iconSize= 24});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: iconSize, color: color,),
    );
  }
}
