import 'package:flutter/material.dart';

import '../../helper/colors.dart';

// ignore: must_be_immutable
class Flixible_button extends StatelessWidget {
  String text;
  Color? textclr;
  Function? ontap;
  Flixible_button({super.key, required this.text, this.textclr, this.ontap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => ontap == null ? null : ontap!(),
        child: Text(
          text.toString(),
          style: TextStyle(
              color: textclr == null ? AppColor.light_orange : textclr),
        ));
  }
}
