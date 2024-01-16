import 'package:flutter/material.dart';
import 'package:food_application/WidgetItems/DiscriptionText.dart';
import 'package:food_application/WidgetItems/TextWidget.dart';

class ProductCards extends StatefulWidget {
  const ProductCards({super.key});

  @override
  State<ProductCards> createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 140,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Container(
            width: 140,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/food04.jpeg'),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: TextWidget(text: 'Food 1asdkmasjdnjafdbahebaefbaefaefhkaebf',)),
                DiscriptionText(text: 'Lorem...............'),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}