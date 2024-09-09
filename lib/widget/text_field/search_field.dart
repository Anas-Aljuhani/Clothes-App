
import 'package:flutter/material.dart';

class SearchFeild extends StatelessWidget {
  const SearchFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.zoom_in,
            color: Color(0x22000000),
          ),
          hintStyle: TextStyle(color: Color(0x22000000)),
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          )),
    );
  }
}
