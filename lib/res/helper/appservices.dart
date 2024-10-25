import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App_Service {
  //---------------------------------------------
  //               lenght for screen
  // --------------------------------------------

  static getscreenwidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  //----------------------------------------------

  static getscreenheight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  //----------------------------------------------
  //                Add Height
  // ---------------------------------------------

  static add_Height(double height) => SizedBox(height: height.h);

  // ---------------------------------------------
  //                 Add Width
  // ---------------------------------------------

  static add_Width(double width) => SizedBox(width: width.w);

  // ---------------------------------------------
  //             Add Puss TO Screen
  // ---------------------------------------------

  static push_to_screen(screen, BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => screen,
      ));

  // ---------------------------------------------
  //           Add Puss remove Screen
  // ---------------------------------------------

  static push_remove_screen(Screen, BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Screen,
          ),
          (route) => false);

  // ---------------------------------------------
  //           Add Puss replace Screen
  // ---------------------------------------------

  static push_and_replace(Screen, BuildContext context) =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Screen,
      ));
  // ---------------------------------------------
  //                pop Screen
  // ---------------------------------------------

  static pop_screen(BuildContext context) => Navigator.of(context).pop();
}

//==================================finish=====================================