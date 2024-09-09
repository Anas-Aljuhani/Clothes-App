import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/services/setup.dart';
import 'package:clothes_app/src/login_screen.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/card/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.getWidth() * 0.1,
          vertical: context.getHeight() * 0.04),
      child: Center(
        child: Column(
          children: [
            const Text('My Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: context.getHeight() * 0.04,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    )),
              ),
              title: Text(
                getIt.get<AppModel>().user?.name ?? 'User',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(getIt.get<AppModel>().user?.email ?? 'email'),
            ),
            SizedBox(
              height: context.getHeight() * 0.04,
            ),
            const ProfileCard(
              title: 'My order',
            ),
            const ProfileCard(
              title: 'My cards',
            ),
            const ProfileCard(
              title: 'Payment Method',
            ),
            const ProfileCard(
              title: 'My Reviews',
            ),
            const ProfileCard(
              title: 'My Address',
            ),
            CustomeTextButton(
              buttonText: 'Logout',
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
