import 'package:bwa_masteringflutter/services/auth_service.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user.dart';
import '../bonus_page/bonus_controller.dart';

class SettingPageController extends GetxController {
  var userController = Get.find<BonusPageController>();
  userData? user;
  late String censoredPart;
  late String censoredText;
  String userId = '';

  @override
  void onInit() {
    user = userController.user;
    userId = user!.id;
    censoredPart = userId.substring(3, 10);
    censoredText = userId.replaceRange(3, 10, '*******');
    super.onInit();
  }

  void signOut() async {
    try {
      await AuthService().signOut();
      Get.offAllNamed(SignUpScreen.routeName);
    } catch (e) {
      throw e;
    }
  }
}
