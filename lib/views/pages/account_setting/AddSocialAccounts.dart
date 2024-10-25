import 'package:flutter/material.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

import '../../../res/components/botton/coman_button.dart';
import '../../../res/helper/images&icons.dart';

class Add_Social_Accounts extends StatelessWidget {
  const Add_Social_Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Add Social Accounts', context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                'Add social accounts',
                style: AppTextStyle.fs24Semi_Bold,
              ),
              App_Service.add_Height(10),
              Text(
                'Add your social accounts for more security. You will go directly to their site.',
                style: AppTextStyle.fs16Normal.copyWith(color: AppColor.gray),
                textAlign: TextAlign.center,
              ),
              App_Service.add_Height(10),
              Coman_IconButton(
                // hight: 30,
                iconImage: AppIcons.facebook,
                radius: 5,
                btnName: 'Connect with Facebook',
                bgcolor: AppColor.darkBlue,
              ),
              App_Service.add_Height(10),
              Coman_IconButton(
                // hight: 30,
                iconImage: AppIcons.google,
                radius: 5,
                btnName: 'Connect with google',
                bgcolor: AppColor.lightBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
