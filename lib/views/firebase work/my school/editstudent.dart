import 'package:flutter/material.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import '../../../res/components/admisionField.dart';
import '../../../res/helper/appservices.dart';
import '../../../res/services/functions/firebaseFunction.dart';

// ignore: must_be_immutable
class EditStudent extends StatefulWidget {
  AdmissionModel admissionModel;
  EditStudent({super.key, required this.admissionModel});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final Name = TextEditingController();

  final Class = TextEditingController();

  final Fulladdress = TextEditingController();

  final PhoneNumber = TextEditingController();

  final DOB = TextEditingController();
  // ===============================
  @override
  void initState() {
    super.initState();
    textValue();
  }

  textValue() {
    Name.text = widget.admissionModel.name.toString();
    Class.text = widget.admissionModel.studentClass.toString();
    Fulladdress.text = widget.admissionModel.fullAddress.toString();
    PhoneNumber.text = widget.admissionModel.phoneNumber.toString();
    DOB.text = widget.admissionModel.dob.toString();
  }

  @override
  Widget build(BuildContext context) {
    // final chanedata = Provider.of<FirebaseControler>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AdmisionField(
              controller: Name,
              labelText: 'Name',
            ),
            App_Service.add_Height(10),
            AdmisionField(
              controller: Class,
              labelText: 'Class',
            ),
            App_Service.add_Height(10),
            AdmisionField(
              controller: Fulladdress,
              labelText: 'Full address',
            ),
            App_Service.add_Height(10),
            AdmisionField(
              keyboardType: TextInputType.number,
              controller: PhoneNumber,
              labelText: 'Phone Number',
            ),
            App_Service.add_Height(10),
            AdmisionField(
              controller: DOB,
              labelText: 'DD/MM/YYYY',
            ),
            App_Service.add_Height(10),
            TextButton(
              onPressed: () {
                // final provider =
                //     Provider.of<FirebaseControler>(context, listen: false);

                FirebaseFunction().updatefirebaseData(
                    context,
                    AdmissionModel(
                        studentid: widget.admissionModel.studentid,
                        name: Name.text,
                        fullAddress: Fulladdress.text,
                        studentClass: Class.text,
                        dob: DOB.text,
                        phoneNumber: int.parse(PhoneNumber.text)));

                // _firestore
                //     .collection("student")
                //     .doc(widget.admissionModel.studentid)
                //     .update(AdmissionModel(
                //             name: Name.text,
                //             fullAddress: Fulladdress.text,
                //             studentClass: Class.text,
                //             dob: DOB.text,
                //             phoneNumber: int.parse(PhoneNumber.text))
                //         .tomap())
                //     .then((value) {
                //   provider.updateAdmission(AdmissionModel(
                //       studentid: widget.admissionModel.studentid,
                //       name: Name.text,
                //       fullAddress: Fulladdress.text,
                //       studentClass: Class.text,
                //       dob: DOB.text,
                //       phoneNumber: int.parse(PhoneNumber.text)));
                //   App_Service.pop_screen(context);
                // }
                // );
              },
              child: Text(
                'change',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
            )
          ],
        ),
      )),
    );
  }
}
