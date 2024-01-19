import 'package:flutter/material.dart';
import 'package:food_application/utils/dimension.dart';

class TextWidget extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  TextWidget({super.key, 
    this.color = const Color.fromARGB(250,36, 39, 38), 
    required this.text, 
    this.size = 20.0,
    this.overFlow = TextOverflow.ellipsis
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}