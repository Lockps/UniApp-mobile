import 'package:firebase_core/firebase_core.dart';

import 'mostpopular.dart';
import 'qr/qrgen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'Social/Screen/mainsocial.dart';
import 'delivery/delivery.dart';

import 'login.dart';
import 'kriangkraislider.dart';
import 'package:project_uni/qr/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Social': (context) => const Feed(),
        '/deli': (context) => HomePageDelivery(),
      },
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.grey),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Home(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: (context) => const QrPage());
          },
          child: const Icon(Icons.qr_code),
          backgroundColor: Colors.grey,
        ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          right: MediaQuery.of(context).size.width * 0.1,
          child: const CircleAvatar(
            radius: 40,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.42,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 130, 130),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const LayoutFirstPage(),
            ))
      ],
    );
  }
}

class LayoutFirstPage extends StatelessWidget {
  const LayoutFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.13,
          child: const FeatureButton(),
        )
      ],
    );
  }
}

class FeatureButton extends StatelessWidget {
  const FeatureButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        button(context, const Icon(Icons.chat), '/Social'),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        button(context, const Icon(Icons.delivery_dining), '/deli'),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const myslidebar();
              }));
            },
            child: const Text("slidebar"))
      ],
    );
  }
}

Widget button(context, Icon icon, String otherpage) {
  return Container(
    decoration:
        const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    child: FittedBox(
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, otherpage);
        },
        icon: icon,
      ),
    ),
  );
}

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(10),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withAlpha(50),
        child: Stack(children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            right: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.6,
              child: QrGen(),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
        ]),
      ),
    );
  }
}
