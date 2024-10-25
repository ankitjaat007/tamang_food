import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/firebaseControler.dart';
import 'package:tamang_food/res/services/functions/firebaseFunction.dart';
import 'package:tamang_food/views/firebase%20work/my%20school/editstudent.dart';

import '../../../res/helper/appservices.dart';

class ViewAllStudent extends StatelessWidget {
  ViewAllStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FirebaseControler>(context);
    final admisonList = provider.allAdmission;
    // print(admisonList.first.studentid);
    // print("===============");
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Student list'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: admisonList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisExtent: 280),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/idbg.jpg',
                        fit: BoxFit.cover,
                        height: 280.sp,
                        width: App_Service.getscreenwidth(context),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              App_Service.push_to_screen(
                                  EditStudent(
                                      admissionModel: admisonList[index]),
                                  context);
                            },
                            icon: Icon(Icons.edit_note_sharp)),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          'are you sure you want to delete this student'),
                                      Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                App_Service.pop_screen(context);
                                              },
                                              child: Text('NO')),
                                          TextButton(
                                              onPressed: () {
                                                FirebaseFunction()
                                                    .deletefirebaseData(context,
                                                        admisonList[index]);
                                              },
                                              child: Text('Yes'))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.dangerous_outlined)),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/images/studentdp.jpeg',
                                  scale: 4,
                                ),
                              ),
                            ),
                            App_Service.add_Height(10),
                            Center(
                              child: Text(
                                "${admisonList[index].name.toString().toUpperCase()}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue),
                              ),
                            ),
                            App_Service.add_Height(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'CLASS',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${admisonList[index].studentClass}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ADDRESS',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${admisonList[index].fullAddress}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'DOB',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${admisonList[index].dob}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'PH.NO',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${admisonList[index].phoneNumber}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'studentID',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Text(
                                    '  ${admisonList[index].studentid}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ],
              );
            }),
      ),
    );
  }
}
