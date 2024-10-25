import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class AppUtils {
  static fildfocuschange(
      BuildContext context, FocusNode curntfocus, FocusNode nextfocos) {
    curntfocus.unfocus();
    FocusScope.of(context).requestFocus(nextfocos);
  }

  static flushbarBarMessage(String msg, BuildContext context) {
    return Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: const Color.fromARGB(154, 3, 3, 3),
        dismissDirection: FlushbarDismissDirection.VERTICAL,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(20),
        messageText: Text(
          msg,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        )).show(context);
  }
}
