import 'package:flutter/material.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/services/functions/firebaseFunction.dart';
import 'package:tamang_food/views/firebase%20work/my%20school/admission_student.dart';
import 'package:tamang_food/views/firebase%20work/my%20school/viewAllStudent.dart';

class School_homepage extends StatefulWidget {
  const School_homepage({super.key});

  @override
  State<School_homepage> createState() => _School_homepageState();
}

class _School_homepageState extends State<School_homepage> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    await FirebaseFunction().GetFirebaseData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My School'),
      ),
      body: Stack(alignment: Alignment.center, children: [
        Image.asset(
          'assets/images/school.jpg',
          fit: BoxFit.cover,
          width: App_Service.getscreenwidth(context),
          height: App_Service.getscreenheight(context),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                App_Service.push_to_screen(Admission_student(), context);
              },
              child: Text(
                'addmison',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
            ),
            TextButton(
              onPressed: () {
                App_Service.push_to_screen(ViewAllStudent(), context);
              },
              child: Text(
                'view student',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
            )
          ],
        )
      ]),
    );
  }
}
