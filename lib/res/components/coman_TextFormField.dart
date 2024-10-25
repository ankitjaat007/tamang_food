import 'package:flutter/material.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';
import 'package:tamang_food/utils/utils.dart';

import '../helper/colors.dart';

// ignore: must_be_immutable
class Coman_TextFormField extends StatelessWidget {
  bool obscureText;
  String? suffixIconText, hinttext;
  FocusNode? currentfocus, nextfocus;
  TextEditingController? controller;
  TextInputType? keybord;
  Function(String)? validetor;

  Coman_TextFormField({
    super.key,
    this.obscureText = false,
    this.suffixIconText,
    this.hinttext,
    this.currentfocus,
    this.controller,
    this.keybord,
    this.nextfocus,
    this.validetor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validetor != null ? (value) => validetor!(value!) : null,
      keyboardType: keybord,
      controller: controller,
      focusNode: currentfocus,
      onFieldSubmitted: currentfocus != null
          ? (value) {
              nextfocus == null
                  ? null
                  : AppUtils.fildfocuschange(
                      context, currentfocus!, nextfocus!);
            }
          : null,
      cursorColor: AppColor.green,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hinttext,
          suffixIcon: suffixIconText == null
              ? null
              : InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.change_Password);
                  },
                  child: Text(
                    suffixIconText!,
                    style: TextStyle(color: AppColor.light_orange),
                  ),
                ),
          contentPadding: EdgeInsets.all(0),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.black))),
    );
  }
}
