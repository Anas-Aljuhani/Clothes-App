import 'package:clothes_app/services/setup.dart';

import 'package:clothes_app/src/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen());
  }
}
