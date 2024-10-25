import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';

import '../../../res/components/botton/flixible_button.dart';
import '../../../res/helper/colors.dart';
import '../../../res/helper/textStyle.dart';
import '../../../views/widgets/oops_widget/custom_appBar.dart';

class Confirm_number_page extends StatelessWidget {
  const Confirm_number_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Login to Foodly',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Gap(20.h),
          Text(
            'Verify phone number',
            style: AppTextStyle.fs24Semi_Bold,
          ),
          Gap(15.h),
          Text(
            'Enter the 4-Digit code sent to you at\n+610489632578',
            style: TextStyle(color: AppColor.gray),
            textAlign: TextAlign.center,
          ),
          Gap(15.h),
          PinCodeTextField(
            cursorColor: AppColor.green,
            keyboardType: TextInputType.number,
            appContext: context,
            length: 4,
            pinTheme: PinTheme(
                fieldWidth: 60.w,
                shape: PinCodeFieldShape.underline,
                activeColor: AppColor.gray,
                inactiveColor: AppColor.gray,
                selectedFillColor: Colors.white,
                selectedColor: AppColor.gray,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white),
          ),
          Gap(15.h),
          Coman_IconButton(
            onpressed: () {
              // App_Service.push_to_screen(Enter_address_page(), context);
              Navigator.pushReplacementNamed(context, RouteName.sign_In_page);
            },
            radius: 10,
            btnName: 'Continue',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Didn’t receive code?',
                style: TextStyle(color: AppColor.gray),
              ),
              Flixible_button(
                text: 'Resend Again.',
              )
            ],
          ),
          Gap(20),
          Text(
            'By Signing up you agree to our Terms\nConditions & Privacy Policy.',
            style: TextStyle(color: AppColor.gray),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}
