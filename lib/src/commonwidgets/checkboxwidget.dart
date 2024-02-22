import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      this.value,
      this.onChanged,
      this.activeClr,
      this.chkClr,
      this.tileClr,
      this.borderSideClr,
      required this.borderRadius});

  final bool? value;
  final Function(bool?)? onChanged;
  final Color? activeClr;
  final Color? chkClr;
  final Color? tileClr;
  final Color? borderSideClr;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      activeColor: activeClr,
      checkColor: chkClr,
      //tileColor: tileClr,
      shape: RoundedRectangleBorder(
        //side: BorderSide(color: borderSideClr),
        borderRadius: borderRadius,
      ),
    );
  }
}
