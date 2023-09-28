import 'package:east_stay_vendor/utils/dependency_binding.dart';
import 'package:east_stay_vendor/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.instence.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitController(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xffEDEFF0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffEDEFF0),
          centerTitle: true,
          elevation: .5,
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: Color(0xff232323),
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: const ScreenSplashScreen(),
    );
  }
}
