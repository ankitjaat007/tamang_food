import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/services/controller/firebaseControler.dart';
import 'package:tamang_food/res/services/models/all_models.dart';

import '../../../utils/utils.dart';

class FirebaseFunction {
  final _firestore = FirebaseFirestore.instance;

  // ===================================
  SetFirebaseData(AdmissionModel model, BuildContext context) async {
    final provider = Provider.of<FirebaseControler>(context, listen: false);
    try {
      await _firestore.collection("student").add(model.tomap()).then((value) {
        provider.addAdmission(AdmissionModel.fromjson(model.tomap(), value.id));
        AppUtils.flushbarBarMessage("Admision successfully", context);
      });
    } catch (e) {
      print('add data error^^');
      print(e.toString());
    }
  }

  // =================================
  GetFirebaseData(BuildContext context) async {
    final aa = Provider.of<FirebaseControler>(context, listen: false);
    try {
      var response = await _firestore.collection("student").get();

      if (response.docs.isNotEmpty) {
        var getModel = response.docs
            .map((e) => AdmissionModel.fromjson(e.data(), e.id))
            .toList();
        aa.setAdmission(getModel);
        // print("==============");
      }
    } catch (e) {
      print('get data error^^');
      print(e.toString());
    }
  }

  // =================================
  deletefirebaseData(BuildContext context, AdmissionModel model) async {
    final aa = Provider.of<FirebaseControler>(context, listen: false);
    try {
      await _firestore
          .collection('student')
          .doc(model.studentid)
          .delete()
          .then((value) {
        aa.removeAdmission(model);
        App_Service.pop_screen(context);
      });
    } catch (e) {
      print('delete data error^^');
      print(e.toString());
    }
  }

  // =================================
  updatefirebaseData(BuildContext context, AdmissionModel model) async {
    final aa = Provider.of<FirebaseControler>(context, listen: false);
    try {
      await _firestore
          .collection('student')
          .doc(model.studentid)
          .update(model.tomap())
          .then((value) {
        aa.updateAdmission(model);
        App_Service.pop_screen(context);
      });
    } catch (e) {
      print('update data error^^');
      print(e.toString());
    }
  }
}
