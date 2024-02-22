import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verificationapp/src/commonwidgets/buttonwidget.dart';
import 'package:verificationapp/src/commonwidgets/radiobuttonwidget.dart';
import 'package:verificationapp/src/constants/color.dart';
import 'package:verificationapp/src/features/authentication/controllers/messagebackup/messagebackupcontroller.dart';

class MessageBackUp extends StatefulWidget {
  const MessageBackUp({super.key});

  @override
  State<MessageBackUp> createState() => _MessageBackUpState();
}

class _MessageBackUpState extends State<MessageBackUp> {
  final MessageBackUpController messagebackupctrl =
      Get.put(MessageBackUpController());

  final List<Map<String, dynamic>> backupdurationlist = [
    {'title': '1 Day Once', 'value': 1},
    {'title': '7 Days Once', 'value': 2},
    {'title': '15 Days Once', 'value': 3},
    {'title': '30 Days Once', 'value': 4},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "BackUp Duration",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          backgroundColor: ambercolor),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
               height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                itemCount: backupdurationlist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Obx(
                        () => RadioButtonWidget(
                          value: backupdurationlist[index]['value'],
                          groupValue:
                              messagebackupctrl.selectedbackupduration.value,
                          onChanged: (value) {
                            messagebackupctrl.updateSelectedBackUpType(value);
                          },
                          activeColor: Colors.black,
                          fillColor: ambercolor,
                        ),
                      ),
                      title: Text(backupdurationlist[index]['title']));
                },
              ),
            ),
            Obx(() => ButtonWidget(
                  backgroundColor: messagebackupctrl.isNextButtonEnabled.value
                      ? ambercolor
                      : Colors.grey,
                  buttonText: "Next",
                  fontColor: primaryColor,
                  onPressed: messagebackupctrl.isNextButtonEnabled.value
                      ? () => messagebackupctrl.onSubmit()
                      : null,
                  width: MediaQuery.of(context).size.height * 0.2,
                  isLoading: messagebackupctrl.isLoading.value,
                  circularloadingcolor: primaryColor,
                  circularstrokewidth: 2,
                  circularloadingheight: 20,
                  circularloadingwidth: 20,
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ],
        ),
      ),
    );
  }
}
