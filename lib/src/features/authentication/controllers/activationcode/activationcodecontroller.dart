import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verificationapp/src/features/authentication/screens/messagealertscreen/messagealert.dart';

class ActivationCodeController extends GetxController {
  final TextEditingController activationCodeCntrlr = TextEditingController();
  final RxBool nextbtnEnable = false.obs;
  final RxString validationMsg = ''.obs;
  final RxBool isLoading = false.obs;

  validateActivationCode(String value) {
    RegExp regExp = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])[A-Z0-9]{8}$');
    if (regExp.hasMatch(value)) {
      nextbtnEnable.value = true;
      validationMsg.value = 'Valid Code';
    } else {
      nextbtnEnable.value = false;
      validationMsg.value =
          'Invalid Code. Please use uppercase letters and numbers only of max 8 characters.';
    }
  }

  Future onSubmit() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      sharedPreferenceactivateCode(true);
      Get.to(const MessageAlertScreen());
    } catch (e) {
      // ignore: avoid_print
      print('Error during navigation: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

sharedPreferenceactivateCode(val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('activationdcode', val);
}
