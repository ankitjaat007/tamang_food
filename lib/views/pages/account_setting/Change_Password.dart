import 'package:flutter/material.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

import '../../../res/components/coman_TextFormField.dart';
import '../../../res/helper/colors.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({super.key});

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  GlobalKey<FormState> _key = GlobalKey();
  TextEditingController passwordcontroler = TextEditingController();
  TextEditingController newpasswordcontroler = TextEditingController();
  TextEditingController confirmpasswordcontroler = TextEditingController();

  bool Password1 = true;
  bool Password2 = true;
  bool Password3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Profile Settings", context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "password",
                        style: TextStyle(color: AppColor.gray),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Password1 = !Password1;
                          });
                        },
                        child: Password1 == true
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
                      controller: passwordcontroler, obscureText: Password1),
                  App_Service.add_Height(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New password",
                        style: TextStyle(color: AppColor.gray),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Password2 = !Password2;
                          });
                        },
                        child: Password2 == true
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
                      controller: newpasswordcontroler, obscureText: Password2),
                  App_Service.add_Height(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "COnfirm password",
                        style: TextStyle(color: AppColor.gray),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Password3 = !Password3;
                          });
                        },
                        child: Password3 == true
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
                      controller: confirmpasswordcontroler,
                      obscureText: Password3),
                ],
              ),
              Spacer(),
              Coman_IconButton(
                btnName: 'Change Password',
                radius: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  valideTextFun(BuildContext context, AllController provider) {
    if (_key.currentState!.validate()) {
      provider.getuser.password == passwordcontroler.text;
      Navigator.pop(context);
    }
  }
}
