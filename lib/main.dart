import 'package:east_stay_vendor/utils/dependency_binding.dart';
import 'package:east_stay_vendor/utils/light_theme.dart';
import 'package:east_stay_vendor/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      theme: lightTheme,
      home:  const ScreenSplashScreen(),
    );
  }
}
