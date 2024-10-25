import 'package:flutter/material.dart';
import 'package:tamang_food/res/services/models/all_models.dart';

class FirebaseControler extends ChangeNotifier {
  List<AdmissionModel> _admission = [];
  List<AdmissionModel> get allAdmission => _admission;
  //  Set
  setAdmission(List<AdmissionModel> admission) {
    _admission = admission;
    notifyListeners();
  }

  // Remove
  removeAdmission(AdmissionModel admission) {
    _admission.remove(admission);
    print(admission.studentid);
    notifyListeners();
  }

  // Add
  addAdmission(AdmissionModel admission) {
    _admission.add(admission);
    notifyListeners();
  }

  // update
  updateAdmission(AdmissionModel updated) {
    final index = _admission
        .indexWhere((element) => element.studentid == updated.studentid);

    _admission[index] = updated;
    notifyListeners();
  }
}
