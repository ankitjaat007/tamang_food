import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/components/coman_TextFormField.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

import '../../../res/helper/validetor.dart';

class Profile_Information extends StatefulWidget {
  const Profile_Information({super.key});

  @override
  State<Profile_Information> createState() => _Profile_InformationState();
}

class _Profile_InformationState extends State<Profile_Information> {
  GlobalKey<FormState> _key = GlobalKey();
  FocusNode fullNamefoucs = FocusNode();
  FocusNode emailfoucs = FocusNode();
  FocusNode phnNumberfoucs = FocusNode();
  TextEditingController fullnamecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  @override
  void initState() {
    super.initState();
    textValue();
  }

  textValue() {
    final userdata = Provider.of<AllController>(context, listen: false).getuser;
    fullnamecontroler.text = userdata.name;
    emailcontroler.text = userdata.email;
    passwordcontroler.text = userdata.password;
  }

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<AllController>(context, listen: false);

    return Form(
      key: _key,
      child: Scaffold(
        appBar: CustomAppBar(text: 'Profile Settings', context: context),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Full name',
              style: AppTextStyle.fs12Light,
            ),
            Coman_TextFormField(
              validetor: (v) => AppValidetor.textValidetor(v, 'full name'),
              controller: fullnamecontroler,
              currentfocus: fullNamefoucs,
              nextfocus: emailfoucs,
              // hinttext: userdata.name,
            ),
            App_Service.add_Height(15),
            Text(
              'Email address',
              style: AppTextStyle.fs12Light,
            ),
            Coman_TextFormField(
              validetor: (v) => AppValidetor.emailValidetor(v),
              controller: emailcontroler,
              currentfocus: emailfoucs,
              nextfocus: phnNumberfoucs,
            ),
            App_Service.add_Height(15),
            Text(
              'Phone number',
              style: AppTextStyle.fs12Light,
            ),
            Coman_TextFormField(
              currentfocus: phnNumberfoucs,
            ),
            App_Service.add_Height(15),
            Text(
              'PAssword',
              style: AppTextStyle.fs12Light,
            ),
            Coman_TextFormField(
              obscureText: true,
              controller: passwordcontroler,
              keybord: TextInputType.none,
              suffixIconText: 'Change',
            ),
            Spacer(),
            Coman_IconButton(
              onpressed: () {
                valideTextFun(context, userdata);
              },
              btnName: 'Change settings',
              radius: 10,
            )
          ]),
        ),
      ),
    );
  }

  valideTextFun(BuildContext context, AllController provider) {
    if (_key.currentState!.validate()) {
      provider.setUser(UserModel(fullnamecontroler.text, emailcontroler.text,
          provider.getuser.password));
      Navigator.pop(context);
    }
  }
}
