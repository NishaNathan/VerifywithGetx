import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verificationapp/src/commonwidgets/buttonwidget.dart';
import 'package:verificationapp/src/commonwidgets/radiobuttonwidget.dart';
import 'package:verificationapp/src/constants/color.dart';
import 'package:verificationapp/src/features/authentication/controllers/messagetype/messagetypecontroller.dart';

enum MessageTypeRadio { both, whatsapp, sms, none }

class MessageType extends StatefulWidget {
  const MessageType({super.key});

  @override
  State<MessageType> createState() => _MessageTypeState();
}

class _MessageTypeState extends State<MessageType> {
  final MessageTypeController messagetypecontroller =
      Get.put(MessageTypeController());

  final List<Map<String, dynamic>> messagetypelist = [
    {'title': 'Both', 'value': 1},
    {'title': 'Whatsapp', 'value': 2},
    {'title': 'SMS', 'value': 3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Message Type",
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
                itemCount: messagetypelist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Obx(
                        () => RadioButtonWidget(
                          value: messagetypelist[index]['value'],
                          groupValue:
                              messagetypecontroller.selectedMessageType.value,
                          onChanged: (value) {
                            messagetypecontroller
                                .updateSelectedMessageType(value);
                          },
                          activeColor: Colors.black,
                          fillColor: ambercolor,
                        ),
                      ),
                      title: Text(messagetypelist[index]['title']));
                },
              ),
            ),
            Obx(() => ButtonWidget(
                  backgroundColor:
                      messagetypecontroller.isNextButtonEnabled.value
                          ? ambercolor
                          : Colors.grey,
                  buttonText: "Next",
                  fontColor: primaryColor,
                  onPressed: messagetypecontroller.isNextButtonEnabled.value
                      ? () => messagetypecontroller.onSubmit()
                      : null,
                  width: MediaQuery.of(context).size.height * 0.2,
                  isLoading: messagetypecontroller.isLoading.value,
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
