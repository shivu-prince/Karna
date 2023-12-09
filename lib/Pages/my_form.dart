import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController db = TextEditingController();

  Future<void> insertRecord() async {
    if (name.text != "" ||
        gender.text != "" ||
        contact.text != "" ||
        db.text != "") {
      try {
        String uri = "http://127.0.0.1/karna_api/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "gender": gender.text,
          "contact": contact.text,
          "db": db.text
        });

        var response = jsonDecode(res.body);
        if (response["Success"] == "true") {
          print("record inserted");
        } else {
          print("failed try again");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("fill all forms");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Karna",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: gender,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("gender"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: contact,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("phone"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: db,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("db value"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                insertRecord();
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
