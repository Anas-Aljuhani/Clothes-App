import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/services/setup.dart';
import 'package:clothes_app/src/landing_screen.dart';
import 'package:clothes_app/src/sign_up_screen.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/text_field/custome_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: context.getHeight() / 40),
                Row(
                  children: [
                    SizedBox(width: context.getWidth() / 8),
                    const Text(
                      'Welcome back',
                      style: TextStyle(
                        fontFamily: 'Romanesco',
                        fontSize: 35,
                        color: Color(0xff5F3636),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.getHeight() / 15),
                Center(
                  child: Image.asset("assets/image/undraw_jewelry_iima 1.png"),
                ),
                SizedBox(height: context.getHeight() / 35),
                CustomTextField(
                  controller: controllerName,
                  hasSuffixIcon: false,
                  hintText: 'User Name',
                  validate: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter your username';
                    }
                    if (val.contains(' ')) {
                      return 'Username cannot contain spaces';
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.getHeight() / 19),
                CustomTextField(
                  controller: controllerPass,
                  hasSuffixIcon: true,
                  hintText: 'Password',
                  validate: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (val.contains(' ')) {
                      return 'Password cannot contain spaces';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontFamily: 'Romanesco',
                            fontSize: 16,
                            color: const Color(0xff5F3636).withOpacity(0.48),
                          ),
                        ),
                      ),
                      SizedBox(width: context.getWidth() / 13),
                    ],
                  ),
                ),
                SizedBox(height: context.getWidth() / 12),
                CustomeTextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (getIt.get<AppModel>().userChecker(
                          name: controllerName.text,
                          password: controllerPass.text)) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LandingScreen(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'Usernmae or password incorrect',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        );
                      }
                    }
                  },
                  buttonText: 'Login',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: const Color(0xff5F3636).withOpacity(0.48),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                          color: Color(0xff5F3636),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
