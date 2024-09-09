import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  const ProfileCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sorry this featurs is not available now :('),
        duration:  Duration(milliseconds: 700),
      )),
      child: Container(
        height: context.getHeight() * 0.06,
        margin: EdgeInsets.only(bottom: context.getHeight() * 0.03),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: kElevationToShadow[4]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
