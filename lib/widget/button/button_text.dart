
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:flutter/material.dart';

class CustomeTextButton extends StatelessWidget {
  const CustomeTextButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  final String buttonText;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() / 1.6,
      height: context.getHeight() / 15,
      decoration: BoxDecoration(
          color: const Color(0xffE12727).withOpacity(0.81),
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
