import 'package:flutter/material.dart';
import 'package:tamang_food/res/helper/colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends AppBar {
  String text;
  BuildContext context;
  CustomAppBar({required this.text, required this.context});

  @override
  Color? get backgroundColor => Colors.transparent;
// =============================

  @override
  Color? get foregroundColor => AppColor.black;
// =============================

  @override
  Widget? get title => Text(
        text,
        textAlign: TextAlign.center,
      );
// =============================

  @override
  double? get elevation => 0;
// =============================

  @override
  bool? get centerTitle => true;
// =============================

  @override
  Widget? get leading => IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios));
}
