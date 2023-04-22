// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

//*=====================PATH-FILE======================//
import 'package:project_uni/Social/Constructor/ctdatalist.dart';
import 'package:project_uni/Social/Constructor/ctdatapost.dart';
import 'package:project_uni/Social/Screen/postScreen.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Post"),
        backgroundColor: Colors.black.withAlpha(10),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WritePost()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Post")
            .orderBy("date", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, int index) {
                  late bool liked = true;
                  final doc = snapshot.data!.docs[index];
                  final data = doc.data() as Map<String, dynamic>;
                  final header = data["header"] as String?;
                  final essays = data["essays"] as String?;
                  return Card(
                    elevation: 5,
                    child: Stack(children: [
                      ListTile(
                        title: Text(
                          header ?? "Doesn't found header",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(essays ?? "Doesn't found essays"),
                      ),
                      Positioned(
                          top: 15,
                          right: 15,
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.comment))),
                      Positioned(
                        top: 17,
                        right: 60,
                        child: LikeButton(
                          size: 40,
                          isLiked: liked,
                          likeCount: 2,
                          likeBuilder: (isLiked) {
                            final color = isLiked ? Colors.red : Colors.grey;

                            return Icon(
                              Icons.favorite,
                              color: color,
                              size: 30,
                            );
                          },
                        ),
                      )
                    ]),
                  );
                }),
          );
        },
      ),
    );
  }
}
