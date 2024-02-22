import 'package:shared_preferences/shared_preferences.dart';

bool? chkspactivationscrn;

bool? chkspmessagealertscrn;

bool? chkspmessagetypescrn;

bool? chkspmessagebackupscrn;

checkSPActScreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkActScreenStoredVal = prefs.getBool('activationdcode');
  chkspactivationscrn = checkActScreenStoredVal;
}

checkSPMsgAlertScreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkMsgAertStoredVal = prefs.getBool('messagealert');
  chkspmessagealertscrn = checkMsgAertStoredVal;
}

checkSPMsgTypeScreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkMsgAertStoredVal = prefs.getBool('messaeType');
  chkspmessagetypescrn = checkMsgAertStoredVal;
}

checkSPMsgBkUpScreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkMsgAertStoredVal = prefs.getBool('messagebackup');
  chkspmessagebackupscrn = checkMsgAertStoredVal;
}
