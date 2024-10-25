import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

import '../../../res/components/coman_TextFormField.dart';
import '../../../res/components/botton/coman_button.dart';
import '../../../res/helper/colors.dart';
import '../../../res/helper/textStyle.dart';

class Forgot_Password_page extends StatelessWidget {
  const Forgot_Password_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Forgot Password',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot password',
              style: AppTextStyle.fs33Light,
            ),
            Gap(10.h),
            Text(
              'Enter your email address and we will\nsend you a reset instructions.',
              style: AppTextStyle.fs16Normal,
            ),
            Gap(15.h),
            Text(
              'Email address',
              style: TextStyle(color: AppColor.gray),
            ),
            Coman_TextFormField(),
            Gap(20.h),
            Coman_IconButton(
              onpressed: () {
                // App_Service.push_and_replace(ResetEmail_page(), context);
                Navigator.pushReplacementNamed(
                    context, RouteName.resetEmail_page);
              },
              radius: 5,
              btnName: 'Reset password',
            ),
          ],
        ),
      ),
    );
  }
}
