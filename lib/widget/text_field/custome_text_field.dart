import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.editTextValue,
      required this.hasSuffixIcon,
      this.controller,
      this.validate});

  final String? Function(String?)? validate;

  final String hintText;
  final String? editTextValue;
  final bool hasSuffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth() / 1.3,
      child: TextFormField(
        validator: validate,
        initialValue: editTextValue,
        style: TextStyle(color: const Color(0xff5F3636).withOpacity(0.64)),
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: hasSuffixIcon == true
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove_red_eye,
                        color: const Color(0xff5F3636).withOpacity(0.60)))
                : null,
            hintText: hintText,
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xff5F3636).withOpacity(0.64)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff5F3636)),
            )),
      ),
    );
  }
}
