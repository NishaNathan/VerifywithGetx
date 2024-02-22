import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verificationapp/src/features/authentication/screens/messagetypescreen/messagetype.dart';

class MessageAlertController extends GetxController {
  /* var missedcallchckbox = false.obs;
  var recievedcallchkbox = false.obs; */

  var checkboxValues = <bool>[false, false, false].obs;
  var isNextButtonEnabled = false.obs;
   final RxBool isLoading = false.obs;

  void toggleCheckbox(int index) {
    checkboxValues[index] = !checkboxValues[index];
    updateNextButtonState();
  }

  void updateNextButtonState() {
    isNextButtonEnabled.value = checkboxValues.any((value) => value);
  }

  Future onSubmit() async {
    try {
      isLoading.value = true;
      sharedPreferenceMsgAlertCode(true);
      await Future.delayed(const Duration(seconds: 2));
       
      Get.to(const MessageType());
    } catch (e) {
      // ignore: avoid_print
      print('Error during navigation: $e');
    } finally {
      isLoading.value = false;
    }
  }

  sharedPreferenceMsgAlertCode(val) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('messagealert', val);
  }
}

