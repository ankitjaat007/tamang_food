import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tamang_food/res/components/botton/flixible_button.dart';
import 'package:tamang_food/res/components/coman_TextFormField.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/images&icons.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/res/helper/validetor.dart';
import 'package:tamang_food/res/services/functions/all_functions.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';
import '../../../res/components/botton/coman_button.dart';

// ignore: must_be_immutable
class Sign_In_page extends StatefulWidget {
  Sign_In_page({super.key});

  @override
  State<Sign_In_page> createState() => _Sign_In_pageState();
}

class _Sign_In_pageState extends State<Sign_In_page> {
  ValueNotifier<bool> obscureTextChange = ValueNotifier<bool>(true);

  // GlobelKey
  GlobalKey<FormState> _key = GlobalKey();

  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final userpassword = Provider.of<AllController>(context).getuser;
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Sign In',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Tamang Food Services',
                style: AppTextStyle.fs33Light,
              ),
              Gap(10.h),
              Text(
                'Enter your Phone number or Email\naddress for sign in. Enjoy your food :)',
                style: AppTextStyle.fs16Normal,
              ),
              Gap(15.h),
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email address',
                      style: TextStyle(color: AppColor.gray),
                    ),
                    Coman_TextFormField(
                      validetor: (v) => AppValidetor.emailValidetor(v),
                      keybord: TextInputType.emailAddress,
                      currentfocus: emailfocus,
                      nextfocus: passwordfocus,
                      controller: _email,
                    ),
                    Gap(15.h),
                    ValueListenableBuilder(
                      valueListenable: obscureTextChange,
                      builder: (context, value, child) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(color: AppColor.gray),
                              ),
                              InkWell(
                                onTap: () {
                                  obscureTextChange.value =
                                      !obscureTextChange.value;
                                },
                                child: obscureTextChange.value == true
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
                          Coman_TextFormField(
                            validetor: (v) => AppValidetor.passwordValidetor(v),
                            obscureText: obscureTextChange.value,
                            currentfocus: passwordfocus,
                            controller: _password,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              Center(
                  child: Flixible_button(
                text: 'Forget Password?',
                ontap: () {
                  // App_Service.push_to_screen(Forgot_Password_page(), context);
                  Navigator.pushNamed(context, RouteName.forgot_Password_page);
                },
                textclr: AppColor.gray,
              )),
              Coman_IconButton(
                onpressed: () {
                  valideTextFun(context);
                },
                radius: 5,
                btnName: 'Sign in',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Don’t have account?',
                    style: TextStyle(color: AppColor.gray),
                  ),
                  Flixible_button(
                    ontap: () {
                      // App_Service.push_to_screen(Sign_up_page(), context);
                      Navigator.pushNamed(context, RouteName.sign_up_page);
                    },
                    text: 'Create new account.',
                  )
                ],
              ),
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

  valideTextFun(BuildContext context) {
    if (_key.currentState!.validate()) {
      AllFunctions.getalluser(
          context, _email.text.trim(), _password.text.trim());
      Navigator.pushNamed(context, RouteName.enter_address_page);
    }
  }
}
