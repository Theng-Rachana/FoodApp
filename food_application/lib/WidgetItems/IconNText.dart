import 'package:flutter/material.dart';
import 'package:food_application/WidgetItems/DiscriptionText.dart';
import 'package:food_application/utils/dimension.dart';

class IconNTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  const IconNTextWidget({super.key, 
    required this.text, 
    required this.icon, 
    required this.textColor, 
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon , color: iconColor, size: dimensionPage.iconSize24,),
        const SizedBox(width: 5,),
        DiscriptionText(text: text, color: textColor,)
      ],
    );
  }
}