// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';

// ignore: must_be_immutable
class Coman_IconButton extends StatelessWidget {
  String? btnName, iconImage;
  Color? textclr, bgcolor, borderclr;
  Function? onpressed;
  double? radius, width, hight;
  // IconData? icons;

  Coman_IconButton(
      {super.key,
      required this.btnName,
      this.onpressed,
      this.textclr,
      this.bgcolor,
      this.borderclr,
      this.radius,
      this.width,
      this.hight,
      // this.icons,
      this.iconImage});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onpressed == null ? null : onpressed!(),
        // icon: icons == null
        //     ? SizedBox()
        //     : Icon(
        //         icons,
        //         color: Colors.black,
        //       ),
        // label: btnName == null
        //     ? SizedBox()
        //     : Text(
        //         btnName!,
        //         style: TextStyle(color: textclr),
        //       ),
        style: TextButton.styleFrom(
            backgroundColor: bgcolor == null ? AppColor.light_orange : bgcolor,
            maximumSize: Size(
                width == null
                    ? App_Service.getscreenwidth(context)
                    : App_Service.getscreenwidth(context) * width,
                hight == null ? 40.h : hight!),
            shape: RoundedRectangleBorder(
                borderRadius: radius == null
                    ? BorderRadius.zero
                    : BorderRadius.circular(radius as double)),
            side: borderclr == null
                ? BorderSide.none
                : BorderSide(color: borderclr!)),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconImage == null ? SizedBox() : Image.asset(iconImage!),
            Text(
              btnName!,
              style:
                  TextStyle(color: textclr == null ? AppColor.white : textclr),
            ),
            SizedBox()
          ],
        ));
  }
}
