import 'package:flutter/material.dart';
import 'package:tamang_food/res/helper/colors.dart';

// ignore: must_be_immutable
class ComanListTile extends StatefulWidget {
  String? title, subtitle, leadingImg;
  IconData? leadingicon, tralingicon;
  bool? swichbtn, boolvalue;
  Color? leadingclr;
  Function? ontap;
  ComanListTile(
      {super.key,
      this.title,
      this.subtitle,
      this.leadingicon,
      this.tralingicon,
      this.swichbtn = false,
      this.boolvalue = false,
      this.leadingclr,
      this.leadingImg,
      this.ontap});

  @override
  State<ComanListTile> createState() => _ComanListTileState();
}

class _ComanListTileState extends State<ComanListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => widget.ontap == null ? null : widget.ontap!(),
      contentPadding: EdgeInsets.all(0),
      title: widget.title == null ? null : Text(widget.title!),
      subtitle: widget.subtitle == null ? null : Text(widget.subtitle!),
      leading: widget.leadingImg == null
          ? widget.leadingicon == null
              ? null
              : Icon(
                  widget.leadingicon,
                  color: widget.leadingclr,
                )
          : Image.asset(widget.leadingImg!),
      trailing: widget.swichbtn == false
          ? widget.tralingicon == null
              ? null
              : Icon(widget.tralingicon)
          : Switch(
              value: widget.boolvalue!,
              activeColor: AppColor.light_orange,
              inactiveThumbColor: AppColor.white,
              onChanged: (newvalue) {
                setState(() {
                  widget.boolvalue = !widget.boolvalue!;
                });
              }),
    );
  }
}
