import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verificationapp/src/features/authentication/screens/homescreen/homescreen.dart';

class MessageBackUpController extends GetxController {
  RxInt selectedbackupduration = 0.obs;
  var isNextButtonEnabled = false.obs;
  final RxBool isLoading = false.obs;

  void updateSelectedBackUpType(int? value) {
    selectedbackupduration.value = value ?? 0;
    isNextButtonEnabled.value = selectedbackupduration.value != 0;
  }

  Future onSubmit() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      Get.to(const HomeScreen());
    } catch (e) {
      // ignore: avoid_print
      print('Error during navigation: $e');
    } finally {
      isLoading.value = false;
    }
  }

  sharedPreferenceMsgAlertCode(val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('messagebackup', val);
  }
}
