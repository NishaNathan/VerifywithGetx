import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  final dynamic value;
  //final int groupValue;
  final void Function(dynamic) onChanged;
  final Color activeColor;
  final Color fillColor;
  final int? groupValue;

  const RadioButtonWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.activeColor,
      required this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio(
      value: value,
      groupValue: groupValue, //controller.selectedRadio.value,
      onChanged: onChanged,
      activeColor: activeColor,
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return fillColor; // Set checkedColor when selected
        }
        return null; // Default fill color
      }),
      /* (newValue) {
              controller.selectedRadio.value = newValue as String;
              controller.isButtonEnabled.value = true;
            }, */
    );
  }
}
