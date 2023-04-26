// ignore_for_file: prefer_const_constructors

import 'package:project_uni/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_uni/Social/Constructor/ctdatapost.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';

class WritePost extends StatelessWidget {
  const WritePost({Key? key});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    CollectionReference _datapost =
        FirebaseFirestore.instance.collection("Post");
    DataPost post = DataPost("", "", "", "");
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: "Header"),
                    validator:
                        RequiredValidator(errorText: "Please enter header"),
                    onSaved: (newValue) {
                      post.header = newValue!;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: "Post?"),
                    onSaved: (newValue) {
                      post.essays = newValue;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          post.date = DateTime.now().toString();
                          _formkey.currentState!.save();
                          _datapost.add({
                            "header": post.header,
                            "essays": post.essays,
                            "date": post.date
                          });
                          _formkey.currentState!.reset();

                          Navigator.pop(context);
                        }
                      },
                      icon: Icon(Icons.post_add),
                      label: Text("label"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
