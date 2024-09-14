import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miftahprintapp/controller/controller.dart';
import 'package:miftahprintapp/screens/home_page.dart';
import 'package:miftahprintapp/screens/login_page.dart';
import 'package:miftahprintapp/screens/memo.dart';
import 'package:miftahprintapp/screens/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiftahPrint',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: <GetPage>[
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/signUp', page: () => SignupPage()),
        GetPage(name: '/memo', page: () => Memo()),
      ],
    );
  }
}
