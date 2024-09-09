import 'package:flutter/material.dart';

extension SizeConfig on BuildContext {
  getWidth() => MediaQuery.of(this).size.width;
  getHeight() => MediaQuery.of(this).size.height;
}
