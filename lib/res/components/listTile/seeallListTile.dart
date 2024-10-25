import 'package:flutter/material.dart';

import '../../helper/textStyle.dart';
import '../botton/flixible_button.dart';

// ignore: must_be_immutable
class SeeallListTile extends StatelessWidget {
  String title;
  Function? onpress;
  SeeallListTile({super.key, required this.title, this.onpress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(
          title,
          style: AppTextStyle.fs24Semi_Bold,
        ),
        trailing: Flixible_button(
            ontap: () => onpress == null ? null : onpress!(), text: 'See all'));
  }
}
