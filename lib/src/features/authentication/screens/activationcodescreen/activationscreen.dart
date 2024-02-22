import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verificationapp/src/commonwidgets/buttonwidget.dart';
import 'package:verificationapp/src/commonwidgets/textboxwidget.dart';
import 'package:verificationapp/src/constants/color.dart';
import 'package:verificationapp/src/constants/textstring.dart';
import 'package:verificationapp/src/features/authentication/controllers/activationcode/activationcodecontroller.dart';

class ActivationCodeScreen extends StatefulWidget {
  const ActivationCodeScreen({super.key});

  @override
  State<ActivationCodeScreen> createState() => _ActivationCodeScreenState();
}

class _ActivationCodeScreenState extends State<ActivationCodeScreen> {
  final ActivationCodeController actCodecontroller =
      Get.put(ActivationCodeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              "Code Activation",
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.w800),
            ),
            centerTitle: true,
            backgroundColor: ambercolor),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                activationText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextBoxWidget(
                fillColor: const Color.fromARGB(255, 243, 205, 94),
                width: MediaQuery.of(context).size.width * 0.3,
                maxLength: 8,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w900,
                counterText: '',
                controller: actCodecontroller.activationCodeCntrlr,
                onChanged: (value) {
                  actCodecontroller.validateActivationCode(value);
                },
                regexExp: RegExp(r'[^\w\s]'),
              ),
              const SizedBox(
                height: 20,
              ),
              /* F */
              Obx(() => ButtonWidget(
                    backgroundColor: actCodecontroller.nextbtnEnable.value
                        ? ambercolor
                        : Colors.grey,
                    buttonText: "Next",
                    fontColor: primaryColor,
                    onPressed: actCodecontroller.nextbtnEnable.value
                        ? () => actCodecontroller.onSubmit()
                        : null,
                    width: MediaQuery.of(context).size.height * 0.2,
                    isLoading: actCodecontroller.isLoading.value,
                    circularloadingcolor: primaryColor,
                    circularstrokewidth: 2,
                    circularloadingheight: 20,
                    circularloadingwidth: 20,
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Text(
                  actCodecontroller.validationMsg.value,
                  style: TextStyle(
                      color:
                          actCodecontroller.validationMsg.value == 'Valid Code'
                              ? Colors.green
                              : Colors.red,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
