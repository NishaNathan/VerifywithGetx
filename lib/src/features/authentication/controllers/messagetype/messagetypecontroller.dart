import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verificationapp/src/features/authentication/screens/messagebackupscreen/messagebackup.dart';

class MessageTypeController extends GetxController {
  RxInt selectedMessageType = 0.obs;
  var isNextButtonEnabled = false.obs;
  final RxBool isLoading = false.obs;

  // Key to uniquely identify the selected message type in SharedPreferences
  static const String messageTypeKey = 'selectedMessageType';

  /* @override
  void onInit() {
    super.onInit();
    // Retrieve the saved checkbox value when the controller is initialized
    loadSelectedMessageType();
  } */

  void updateSelectedMessageType(int? value) {
    selectedMessageType.value = value ?? 0;
    isNextButtonEnabled.value = selectedMessageType.value != 0;

    // Save the selected message type to SharedPreferences
   // saveSelectedMessageType();
  }

  /* Future<void> saveSelectedMessageType() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt(messageTypeKey, selectedMessageType.value);
    } catch (e) {
      // Handle the error, such as logging or displaying a message to the user
      if (kDebugMode) {
        print('Error saving selected message type: $e');
      }
    }
  }

  Future<void> loadSelectedMessageType() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int? savedMessageType = prefs.getInt(messageTypeKey);
      if (savedMessageType != null) {
        selectedMessageType.value = savedMessageType;
        isNextButtonEnabled.value = savedMessageType != 0;
      }
    } catch (e) {
      // Handle the error, such as logging or displaying a message to the user
      if (kDebugMode) {
        print('Error loading selected message type: $e');
      }
    }
  } */

  Future onSubmit() async {
    try {
      isLoading.value = true;
      sharedPreferenceMsgTypeCode(true);
      await Future.delayed(const Duration(seconds: 2));
      Get.to(const MessageBackUp());
    } catch (e) {
      // ignore: avoid_print
      print('Error during navigation: $e');
    } finally {
      isLoading.value = false;
    }
  }

   sharedPreferenceMsgTypeCode(val) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('messaeType', val);
  }
}
