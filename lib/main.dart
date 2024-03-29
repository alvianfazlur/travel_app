import 'package:bwa_masteringflutter/app_pages.dart';
import 'package:bwa_masteringflutter/ui/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: SplashPage.routeName,
    getPages: appPages,
  ));
}