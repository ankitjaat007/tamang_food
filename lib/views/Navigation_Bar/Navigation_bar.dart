import 'package:flutter/material.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/views/Navigation_Bar/HomePage.dart';
import 'package:tamang_food/views/Navigation_Bar/OrdersPage.dart';
import 'package:tamang_food/views/Navigation_Bar/ProfilePage.dart';
import 'package:tamang_food/views/Navigation_Bar/SearchPage.dart';

// ignore: must_be_immutable
class Bottom_navigationBar extends StatefulWidget {
  ResturentModel restModel;
  Bottom_navigationBar({super.key, required this.restModel});

  @override
  State<Bottom_navigationBar> createState() => _Bottom_navigationBarState();
}

class _Bottom_navigationBarState extends State<Bottom_navigationBar> {
  late List<Widget> screens = [
    Home_page(restBackModel: widget.restModel),
    Search_page(),
    Order_page(),
    Profile_page()
  ];

  int cuindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: cuindex,
          showUnselectedLabels: true,
          selectedItemColor: AppColor.light_orange,
          unselectedItemColor: AppColor.gray,
          selectedLabelStyle: TextStyle(color: AppColor.light_orange),
          unselectedLabelStyle: TextStyle(color: AppColor.gray),
          onTap: (value) {
            setState(() {
              cuindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: 'Profile'),
          ]),
      body: screens[cuindex],
    );
  }
}
