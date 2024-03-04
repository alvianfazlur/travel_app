import 'dart:async';

import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_page.dart';
import 'package:bwa_masteringflutter/ui/pages/get_started.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/get_user.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/home_page.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = "/splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final getUser = Get.put(GetUser());

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Get.offNamedUntil(GetStartedPage.routeName, (route) => false);
      } else {
        getUser.getCurrentUser(user.uid).then((userData user) {
          Get.offNamedUntil(MainPage.routeName, (route) => false,
              arguments: user);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo_punggawa_travel.png'))),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "AIRPLANE",
              style: whiteTextStyle.copyWith(
                  fontWeight: medium, fontSize: 32, letterSpacing: 10),
            )
          ],
        ),
      ),
    );
  }
}
