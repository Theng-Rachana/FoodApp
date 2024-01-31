import 'package:flutter/material.dart';
import 'package:food_application/utils/dimension.dart';
import '../ColorsTheme/ColorsThemes.dart';
import 'DiscriptionText.dart';
import 'IconNText.dart';
import 'TextWidget.dart';

class SingleProductCard extends StatelessWidget {
  final String text;
  final int stars;
  final String rating;
  SingleProductCard({super.key, required this.text, required this.stars, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: text.toUpperCase() , size: dimensionPage.font26,),
        SizedBox(
          height: dimensionPage.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                    stars!,
                      (index) => Icon(
                    Icons.star,
                    color: AppColors.Darkviolet,
                    size: 15,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            DiscriptionText(text: rating),
            const SizedBox(
              width: 10,
            ),
            DiscriptionText(text: '1234'),
            const SizedBox(
              width: 5,
            ),
            DiscriptionText(text: 'Comments'),
          ],
        ),
        SizedBox(
          height: dimensionPage.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconNTextWidget(
                text: 'Normal',
                icon: Icons.circle,
                textColor: Colors.orange,
                iconColor: Colors.orange),
            const SizedBox(
              width: 15,
            ),
            IconNTextWidget(
                text: '2.5km',
                icon: Icons.fmd_good_sharp,
                textColor: AppColors.Darkviolet,
                iconColor: AppColors.Darkviolet),
            const SizedBox(
              width: 15,
            ),
            const IconNTextWidget(
                text: '30mn',
                icon: Icons.access_time_outlined,
                textColor: Colors.red,
                iconColor: Colors.red),
          ],
        ),
      ],
    );
  }
}
