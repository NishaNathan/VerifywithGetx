import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verificationapp/src/constants/color.dart';
import 'package:verificationapp/src/constants/functionalities.dart';
import 'package:verificationapp/src/constants/imagestring.dart';
import 'package:verificationapp/src/constants/size.dart';
import 'package:verificationapp/src/features/authentication/controllers/splashscreen/splashscreencontroller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashScreenController());

  @override
  void initState() {
    checkSPActScreen();
    checkSPMsgAlertScreen();
    checkSPMsgTypeScreen();
    checkSPMsgBkUpScreen();
  }

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: splashController.animate.value ? 0 : -30,
                left: splashController.animate.value ? 0 : -30,
                child: Image.asset(
                  splashdropimage,
                  width: 100.0,
                  height: 80.0,
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 80,
                left: splashController.animate.value ? 30 : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: const Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CodeVerification',
                        style: TextStyle(
                            fontSize: heading, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Verify your code',
                        style: TextStyle(fontSize: subheading),
                      )
                    ],
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2400),
                bottom: splashController.animate.value ? 80 : 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Image.asset(
                    splashverifyimage,
                    height: MediaQuery.of(context).size.height * 0.7,
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2400),
                bottom: splashController.animate.value ? 20 : 0,
                right: 20.0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: ambercolor,
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
