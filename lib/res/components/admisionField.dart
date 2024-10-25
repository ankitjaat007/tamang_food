import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdmisionField extends StatelessWidget {
  String labelText;
  TextInputType? keyboardType;
  TextEditingController? controller;
  Function(String)? validetor;
  AdmisionField(
      {super.key,
      required this.labelText,
      this.controller,
      this.keyboardType,
      this.validetor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validetor != null ? (value) => validetor!(value!) : null,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.blue),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    );
  }
}
