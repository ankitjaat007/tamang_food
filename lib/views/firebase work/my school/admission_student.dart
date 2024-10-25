import 'package:flutter/material.dart';
import 'package:tamang_food/res/components/admisionField.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/validetor.dart';
import 'package:tamang_food/res/services/functions/firebaseFunction.dart';
import 'package:tamang_food/res/services/models/all_models.dart';

// ignore: must_be_immutable
class Admission_student extends StatelessWidget {
  Admission_student({super.key});

  GlobalKey<FormState> _key = GlobalKey();

  final Name = TextEditingController();

  final Class = TextEditingController();

  final Fulladdress = TextEditingController();

  final PhoneNumber = TextEditingController();

  final DOB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Admission'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(children: [
              AdmisionField(
                validetor: (v) => AppValidetor.textValidetor(v, 'Name'),
                controller: Name,
                labelText: 'Name',
              ),
              App_Service.add_Height(10),
              AdmisionField(
                validetor: (v) => AppValidetor.textValidetor(v, 'Class'),
                controller: Class,
                labelText: 'Class',
              ),
              App_Service.add_Height(10),
              AdmisionField(
                validetor: (v) => AppValidetor.textValidetor(v, 'Full address'),
                controller: Fulladdress,
                labelText: 'Full address',
              ),
              App_Service.add_Height(10),
              AdmisionField(
                validetor: (v) => AppValidetor.textValidetor(v, 'Phone Number'),
                keyboardType: TextInputType.number,
                controller: PhoneNumber,
                labelText: 'Phone Number',
              ),
              App_Service.add_Height(10),
              AdmisionField(
                validetor: (v) => AppValidetor.textValidetor(v, 'dob'),
                controller: DOB,
                labelText: 'DD/MM/YYYY',
              ),
              App_Service.add_Height(10),
              TextButton(
                onPressed: () {
                  valideTextFun(context);
                },
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
              )
            ]),
          ),
        ),
      ),
    );
  }

  valideTextFun(BuildContext context) {
    if (_key.currentState!.validate()) {
      // setData(context);
      FirebaseFunction()
          .SetFirebaseData(
              AdmissionModel(
                name: Name.text.trim(),
                studentClass: Class.text.trim(),
                fullAddress: Fulladdress.text.trim(),
                phoneNumber: int.parse(PhoneNumber.text.trim()),
                dob: DOB.text,
              ),
              context)
          .then((value) {
        Name.clear();
        Class.clear();
        Fulladdress.clear();
        PhoneNumber.clear();
        DOB.clear();
      });
    }
  }
}
