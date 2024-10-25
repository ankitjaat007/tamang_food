import 'package:flutter/material.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

import '../../../res/helper/appservices.dart';
import '../../../res/helper/colors.dart';
import '../../../res/helper/images&icons.dart';
import '../../../res/helper/textStyle.dart';

class Refer_to_Friends extends StatelessWidget {
  const Refer_to_Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Refer to Friends', context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Image.asset(AppIcons.wallet),
              App_Service.add_Height(10),
              Text(
                'Refer a Friend, Get \$10',
                style: AppTextStyle.fs24Semi_Bold,
              ),
              App_Service.add_Height(10),
              Text(
                'Get \$10 in credits when someone sign up using your refer link',
                style: AppTextStyle.fs16Normal.copyWith(color: AppColor.gray),
                textAlign: TextAlign.center,
              ),
              App_Service.add_Height(10),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Color.fromARGB(255, 239, 236, 236),
                leading: Icon(
                  Icons.share,
                  color: AppColor.black,
                ),
                title: Text(
                  'https://ui8.net/76738b',
                  style: AppTextStyle.fs16Normal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
