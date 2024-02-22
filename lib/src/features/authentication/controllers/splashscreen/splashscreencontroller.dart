import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verificationapp/src/constants/functionalities.dart';
import 'package:verificationapp/src/features/authentication/screens/activationcodescreen/activationscreen.dart';
import 'package:verificationapp/src/features/authentication/screens/homescreen/homescreen.dart';
import 'package:verificationapp/src/features/authentication/screens/messagealertscreen/messagealert.dart';
import 'package:verificationapp/src/features/authentication/screens/messagebackupscreen/messagebackup.dart';
import 'package:verificationapp/src/features/authentication/screens/messagetypescreen/messagetype.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));

    chkspmessagebackupscrn == true
        ? Get.to(const HomeScreen())
        : chkspmessagetypescrn == true
            ? Get.to(const MessageBackUp())
            : chkspmessagealertscrn == true
                ? Get.to(const MessageType())
                : chkspactivationscrn == true
                    ? Get.to(const MessageAlertScreen())
                    : Get.to(const ActivationCodeScreen());

    /* chkspactivationscrn == true
        ? Get.to(const MessageAlertScreen())
        : chkspmessagealertscrn == true
            ? Get.to(const MessageType())
            : chkspmessagetypescrn == true ?  Get.to(const MessageBackUp())
                 :chkspmessagebackupscrn == true ?
                 Get.to(const ActivationCodeScreen()): ; */
  }
}
