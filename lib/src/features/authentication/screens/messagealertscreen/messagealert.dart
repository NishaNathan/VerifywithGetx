import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verificationapp/src/commonwidgets/buttonwidget.dart';
import 'package:verificationapp/src/commonwidgets/checkboxwidget.dart';
import 'package:verificationapp/src/constants/color.dart';
import 'package:verificationapp/src/features/authentication/controllers/messagealert/messagealertcontroller.dart';

class MessageAlertScreen extends StatefulWidget {
  const MessageAlertScreen({super.key});

  @override
  State<MessageAlertScreen> createState() => _MessageAlertScreenState();
}

class _MessageAlertScreenState extends State<MessageAlertScreen> {
  final MessageAlertController messagealertctrl =
      Get.put(MessageAlertController());
  final List<Map<String, dynamic>> dataList = [
    {'title': 'Missed Call', 'icon': Icons.call_missed},
    {'title': 'Recieved Call', 'icon': Icons.call_received},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Message Alert",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          backgroundColor: ambercolor),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: Icon(
                      dataList[index]['icon'],
                      color: dataList[index]['title'] == "Missed Call"
                          ? Colors.red
                          : Colors.green,
                    ),
                    title: Text(dataList[index]['title']),
                    trailing: SizedBox(
                      height: 24,
                      width: 24,
                      child: Obx(
                        () => CheckBoxWidget(
                          onChanged: (bool? value) {
                            messagealertctrl.toggleCheckbox(index);
                          },
                          borderRadius: BorderRadius.circular(5.0),
                          activeClr: ambercolor,
                          chkClr: secondaryColor,
                          tileClr: primaryColor,
                          //borderSideClr: primaryColor,
                          value: messagealertctrl.checkboxValues[index],
                        ),
                      ),
                    ));
              },
            ),
          ),
          Obx(() => ButtonWidget(
                backgroundColor: messagealertctrl.isNextButtonEnabled.value
                    ? ambercolor
                    : Colors.grey,
                buttonText: "Next",
                fontColor: primaryColor,
                onPressed: messagealertctrl.isNextButtonEnabled.value
                    ? () => messagealertctrl.onSubmit()
                    : null,
                width: MediaQuery.of(context).size.height * 0.2,
                isLoading: messagealertctrl.isLoading.value,
                circularloadingcolor: primaryColor,
                circularstrokewidth: 2,
                circularloadingheight: 20,
                circularloadingwidth: 20,
                borderRadius: BorderRadius.circular(5.0),
              )),
        ]),
      ),
    );
  }
}
