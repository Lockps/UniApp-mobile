import 'package:flutter/material.dart';

void main() {}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        //logo
        children: const [
          Icon(Icons.lock),
          //username
          SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
          )
        ],
      )),
    );
  }
}
