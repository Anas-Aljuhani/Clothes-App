import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/services/setup.dart';
import 'package:clothes_app/src/login_screen.dart';

import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/text_field/custome_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController? controllerName = TextEditingController();
  final TextEditingController? controllerEmail = TextEditingController();
  final TextEditingController? controllerPassword = TextEditingController();
  final TextEditingController? controllerConfromPass = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              SizedBox(
                height: context.getHeight() / 40,
              ),
              Row(
                children: [
                  SizedBox(width: context.getWidth() / 8),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                        fontFamily: 'Romanesco',
                        fontSize: 35,
                        color: Color(0xff5F3636)),
                  ),
                ],
              ),
              SizedBox(
                height: context.getHeight() / 35,
              ),
              CustomTextField(
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your username';
                  }
                  if (val.contains(' ')) {
                    return 'Username cannot contain spaces';
                  }
                  return null;
                },
                hasSuffixIcon: false,
                hintText: 'User Name',
                controller: controllerName,
              ),
              SizedBox(
                height: context.getHeight() / 19,
              ),
              CustomTextField(
                hasSuffixIcon: false,
                hintText: 'Email',
                controller: controllerEmail,
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!val.contains('@') ||
                      !val.endsWith('.com') ||
                      val.contains(' ')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: context.getHeight() / 19,
              ),
              CustomTextField(
                hasSuffixIcon: true,
                hintText: 'Password',
                controller: controllerPassword,
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
              SizedBox(
                height: context.getHeight() / 19,
              ),
              CustomTextField(
                hasSuffixIcon: true,
                hintText: 'Confirm Password',
                controller: controllerConfromPass,
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (val != controllerPassword?.text) {
                    return 'Passwords do not match';
                  }
                  if (val.contains(' ')) {
                    return 'Password cannot contain spaces';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: context.getWidth() / 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: context.getWidth() / 3.08,
                    height: 2,
                    color: const Color(0xff5F3636),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: context.getHeight() / 25,
                    width: context.getWidth() / 15,
                    decoration: BoxDecoration(
                        color: const Color(0xffC0A286).withOpacity(0.20),
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2.5, color: const Color(0xff5F3636))),
                    child: const Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5F3636)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: context.getWidth() / 3.08,
                    height: 2,
                    color: const Color(0xff5F3636),
                  ),
                ],
              ),
              SizedBox(
                height: context.getWidth() / 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 40,
                    color: const Color(0xff5F3636).withOpacity(0.73),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: context.getWidth() / 14,
                        right: context.getWidth() / 14),
                    child: Icon(
                      Icons.g_mobiledata_outlined,
                      size: 60,
                      color: const Color(0xff5F3636).withOpacity(0.73),
                    ),
                  ),
                  Icon(
                    Icons.wechat_sharp,
                    size: 40,
                    color: const Color(0xff5F3636).withOpacity(0.73),
                  )
                ],
              ),
              SizedBox(
                height: context.getWidth() / 12,
              ),
              CustomeTextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    getIt.get<AppModel>().addUser(
                        name: controllerName!.text,
                        email: controllerEmail!.text,
                        password: controllerPassword!.text);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ));
                  }
                },
                buttonText: 'Sign Up',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have an account ?',
                    style: TextStyle(
                        color: const Color(0xff5F3636).withOpacity(0.48)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xff5F3636),
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
