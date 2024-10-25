import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';

import '../../../res/components/coman_TextFormField.dart';
import '../../../res/helper/images&icons.dart';
import '../../../res/helper/textStyle.dart';
import '../../../views/widgets/oops_widget/custom_appBar.dart';

class Sign_up_page extends StatefulWidget {
  const Sign_up_page({super.key});

  @override
  State<Sign_up_page> createState() => _Sign_up_pageState();
}

class _Sign_up_pageState extends State<Sign_up_page> {
  bool obscureTextChange = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Sign Up',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: AppTextStyle.fs33Light,
              ),
              Gap(10.h),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Enter your Name, Email and Password for sign up.  ',
                  style: AppTextStyle.fs16Normal,
                ),
                TextSpan(
                    text: 'Already have account?',
                    style: AppTextStyle.fs16Normal
                        .copyWith(color: AppColor.light_orange),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ])),
              Gap(15.h),
              Text(
                'Full name',
                style: TextStyle(color: AppColor.gray),
              ),
              Coman_TextFormField(),
              Gap(15.h),
              Text(
                'Email address',
                style: TextStyle(color: AppColor.gray),
              ),
              Coman_TextFormField(),
              Gap(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(color: AppColor.gray),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        obscureTextChange = !obscureTextChange;
                      });
                    },
                    child: obscureTextChange == true
                        ? Icon(
                            Icons.visibility_off,
                            color: AppColor.gray,
                          )
                        : Icon(
                            Icons.visibility,
                            color: AppColor.gray,
                          ),
                  )
                ],
              ),
              Coman_TextFormField(obscureText: obscureTextChange),
              Gap(15.h),
              Coman_IconButton(
                onpressed: () {
                  // App_Service.push_to_screen(Login_number_page(), context);
                  Navigator.pushNamed(context, RouteName.login_number_page);
                },
                radius: 10,
                btnName: 'Sign up',
              ),
              Gap(15.h),
              Center(
                child: Text(
                  'By Signing up you agree to our Terms\nConditions & Privacy Policy.',
                  style: TextStyle(color: AppColor.gray),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(15.h),
              Center(
                  child: Text(
                'Or',
                style: AppTextStyle.fs16Normal,
              )),
              Gap(10.h),
              Coman_IconButton(
                // hight: 30,
                iconImage: AppIcons.facebook,
                radius: 5,
                btnName: 'Connect with Facebook',
                bgcolor: AppColor.darkBlue,
              ),
              Gap(10.h),
              Coman_IconButton(
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
