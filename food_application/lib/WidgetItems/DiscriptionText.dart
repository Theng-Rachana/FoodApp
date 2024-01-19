import 'package:flutter/material.dart';

class DiscriptionText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;
  DiscriptionText({super.key, 
    this.color = const Color.fromARGB(248, 137, 137, 137), 
    required this.text, 
    this.size = 12, 
    this.height = 1.2,
    this.overFlow = TextOverflow.ellipsis
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        backgroundColor: Colors.white,
        height: height,
        color: color,
        fontSize: size,
        overflow: overFlow,
        fontFamily: 'Roboto',
      ),
    );
  }
}