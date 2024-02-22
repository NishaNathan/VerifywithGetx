import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      this.width,
      required this.buttonText,
      this.onPressed,
      required this.backgroundColor,
      required this.fontColor,
      required this.isLoading,
      this.circularloadingwidth,
      this.circularloadingheight,
      required this.circularloadingcolor,
      required this.circularstrokewidth,
      required this.borderRadius});

  final double? width;
  final String buttonText;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color fontColor;
  final bool isLoading;
  final double? circularloadingwidth;
  final double? circularloadingheight;
  final Color circularloadingcolor;
  final double circularstrokewidth;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!isLoading)
              Text(
                buttonText,
                style: TextStyle(color: fontColor),
              ),
            if (isLoading)
              SizedBox(
                width: circularloadingwidth,
                height: circularloadingheight,
                child: CircularProgressIndicator(
                  strokeWidth: circularstrokewidth,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(circularloadingcolor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
