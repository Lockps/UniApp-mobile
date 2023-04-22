import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MostLiked extends StatefulWidget {
  const MostLiked({super.key});

  @override
  State<MostLiked> createState() => _MostLikedState();
}

class _MostLikedState extends State<MostLiked> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Post")
          .orderBy("essays", descending: true)
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
                            onPressed: () {}, icon: Icon(Icons.comment)))
                  ]),
                );
              }),
        );
      },
    );
  }
}
