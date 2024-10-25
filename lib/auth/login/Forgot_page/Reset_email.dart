import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tamang_food/res/components/botton/flixible_button.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/images&icons.dart';

import '../../../res/components/botton/coman_button.dart';
import '../../../res/helper/textStyle.dart';
import '../../../views/widgets/oops_widget/custom_appBar.dart';

class ResetEmail_page extends StatelessWidget {
  const ResetEmail_page({super.key});

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
              'Reset email sent',
              style: AppTextStyle.fs33Light,
            ),
            Gap(10.h),
            Text(
              'We have sent a instructions email to',
              style: AppTextStyle.fs16Normal,
            ),
            Row(
              children: [
                Text(
                  'sajintamang@figma.com.',
                  style: AppTextStyle.fs16Normal,
                ),
                Flixible_button(text: 'Having problem?')
              ],
            ),
            Gap(20.h),
            Coman_IconButton(
              onpressed: () {
                App_Service.pop_screen(context);
              },
              radius: 5,
              btnName: 'Send again',
            ),
            Gap(80.h),
            Center(child: Image.asset(AppImages.forgot_image))
          ],
        ),
      ),
    );
  }
}
