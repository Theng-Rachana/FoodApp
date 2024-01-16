import 'package:flutter/material.dart';
import 'package:food_application/ColorsTheme/ColorsThemes.dart';
import 'package:food_application/WidgetItems/DiscriptionText.dart';
import 'package:food_application/utils/dimension.dart';
import 'package:get/get.dart';

class ExtandableTextWidget extends StatefulWidget {
  final String text;

  const ExtandableTextWidget({super.key, required this.text});

  @override
  State<ExtandableTextWidget> createState() => _ExtandableTextWidgetState();
}

class _ExtandableTextWidgetState extends State<ExtandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hidden = true;
  double textHeight = dimensionPage.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? DiscriptionText(  text: firstHalf,  size: dimensionPage.font16,  height: 1.6,) : Column(
              children: [
                DiscriptionText(
                  text: hidden ? (firstHalf + "...") : (firstHalf + secondHalf),
                  color: AppColors.Darkviolet,
                  overFlow: TextOverflow.visible,
                  size: dimensionPage.font16,
                  height: 1.6,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hidden = !hidden;
                    });
                  },
                  child: Row(
                    children: [
                      DiscriptionText(
                        text: hidden ? 'Show more' : 'Show less',
                        color: Colors.red,
                        size: dimensionPage.font16,
                      ),
                      Icon(
                        hidden
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
