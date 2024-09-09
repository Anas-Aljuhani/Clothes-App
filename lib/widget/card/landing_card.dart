import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:flutter/material.dart';

class CustomeLandScreenCard extends StatelessWidget {
  const CustomeLandScreenCard({
    super.key,
    required this.textCard,
    required this.colorCard,
    required this.imgCard,
    required this.heightCard,
    this.onTap,
  });

  final String textCard;
  final int colorCard;
  final String imgCard;
  final double heightCard;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: context.getWidth() *0.9,
              height: heightCard,
              decoration: BoxDecoration(
                  color: Color(colorCard),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 14,
                    right: MediaQuery.of(context).size.width / 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textCard,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(imgCard)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
