import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserFormView extends StatefulWidget {
  UserFormView({super.key});

  @override
  State<UserFormView> createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {
  final _name = TextEditingController();

  final _address = TextEditingController();

  final _city = TextEditingController();

  final _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> _mydata = [];

  void saveForm() async {
    Map<String, dynamic> _form = {
      "fullname": _name.text,
      "address": _address.text,
      "city": _city.text
    };

    await _firestore.collection("users").add(_form).then((value) {
      final doc_id = value.id;
      print(doc_id);

      _form.addAll({"doc_id": doc_id});

      _mydata.add(_form);
      setState(() {});
    });
  }

  getData() async {
    await _firestore.collection("users").get().then((value) {
      List<Map<String, dynamic>> snapshot = [];
      final dataList = value.docs;

      for (var d in dataList) {
        snapshot.add({
          "doc_id": d.id,
          "fullname": d.data()['fullname'],
          "address": d.data()['address'],
          "city": d.data()['city']
        });
      }
      _mydata = snapshot;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Form"),
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: _name,
          ),
          TextField(
            controller: _address,
          ),
          TextField(
            controller: _city,
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(onPressed: () => saveForm(), child: Text("Save Form")),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _mydata.length,
              itemBuilder: (ctx, i) {
                final data = _mydata[i];
                return ListTile(
                  title: Text(data['fullname']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(data['doc_id']),
                      Text("${data['address']}, ${data['city']}"),
                    ],
                  ),
                );
              })
        ],
      )),
    );
  }
}
