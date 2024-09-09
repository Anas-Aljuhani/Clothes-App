
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:flutter/material.dart';

class SelectColorContainer extends StatelessWidget {
  final Color color;
  final Function()? onTap;
  const SelectColorContainer({
    super.key,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.getHeight() * 0.04,
        width: context.getWidth() * 0.22,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
