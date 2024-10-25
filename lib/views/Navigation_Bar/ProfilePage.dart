import 'package:flutter/material.dart';
import 'package:tamang_food/res/components/listTile/comanListTile.dart';
import 'package:tamang_food/res/dummyData.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    // bool notification1 = true;
    ValueNotifier<bool> notification1 = ValueNotifier<bool>(true);
    bool notification2 = true;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Account Settings',
                style: AppTextStyle.fs28Semi_Bold,
              ),
              ComanListTile(
                subtitle:
                    'Update your settings like notifications, payments, profile edit etc.',
              ),
              ...List.generate(
                  DummyData().account_Settings.length,
                  (index) => ComanListTile(
                        ontap: () {
                          onprass(DummyData().account_Settings[index]['id'],
                              context);
                        },
                        title: DummyData().account_Settings[index]['title'],
                        subtitle: DummyData().account_Settings[index]
                            ['subtitle'],
                        leadingicon: DummyData().account_Settings[index]
                            ['icon'],
                        tralingicon: Icons.arrow_forward_ios,
                      )),
              Text(
                'Notifications',
                style: AppTextStyle.fs16Semi_Bold,
              ),
              ComanListTile(
                boolvalue: notification1.value,
                swichbtn: true,
                leadingicon: Icons.notifications,
                title: 'Push Notifications',
                subtitle: 'For daily update you will get it',
              ),
              ComanListTile(
                swichbtn: true,
                leadingicon: Icons.notifications,
                title: 'SMS Notifications',
                subtitle: 'For daily update you will get it',
              ),
              ComanListTile(
                boolvalue: notification2,
                swichbtn: true,
                leadingicon: Icons.notifications,
                title: 'Promotional Notifications',
                subtitle: 'For daily update you will get it',
              ),
              Text(
                'MOre',
                style: AppTextStyle.fs16Semi_Bold,
              ),
              ComanListTile(
                leadingclr: Colors.amber,
                leadingicon: Icons.star,
                title: 'Rate Us',
                subtitle: 'Rate us playstore, appstor',
                tralingicon: Icons.arrow_forward_ios,
              ),
              ComanListTile(
                leadingicon: Icons.menu_book,
                title: 'FAQ',
                subtitle: 'Frequently asked questions',
                tralingicon: Icons.arrow_forward_ios,
              ),
              ComanListTile(
                leadingicon: Icons.exit_to_app,
                title: 'Logout',
                tralingicon: Icons.arrow_forward_ios,
              )
            ]),
          ),
        ),
      ),
    );
  }

  onprass(String id, BuildContext context) {
    switch (id) {
      case "person":
        // return App_Service.push_to_screen(Profile_Information(), context);
        return Navigator.pushNamed(context, RouteName.profile_Information);
      case "lock":
        // return App_Service.push_to_screen(Change_Password(), context);
        return Navigator.pushNamed(context, RouteName.change_Password);
      case "wallet":
        // return App_Service.push_to_screen(Payment_Methods(), context);
        return Navigator.pushNamed(context, RouteName.payment_Methods);
      case "location_on":
        // return App_Service.push_to_screen(Locations_page(), context);
        return Navigator.pushNamed(context, RouteName.locations_page);
      case "facebook":
        // return App_Service.push_to_screen(Add_Social_Accounts(), context);
        return Navigator.pushNamed(context, RouteName.add_Social_Accounts);
      case "refresh":
        // return App_Service.push_to_screen(Refer_to_Friends(), context);
        return Navigator.pushNamed(context, RouteName.refer_to_Friends);
    }
  }
}
