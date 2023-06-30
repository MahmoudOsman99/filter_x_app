import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  DeviceScreen({super.key});
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final d = db.doc('device').get().then((value) => print(value));

          db.collection("device").where("NOS", isEqualTo: 7).get().then(
            (querySnapshot) {
              print("Successfully completed");
              for (var docSnapshot in querySnapshot.docs) {
                print('${docSnapshot.id} => ${docSnapshot.data()}');
              }
            },
            onError: (e) => print("Error completing: $e"),
          );
        },
        child: Icon(Icons.add),
      ),
      body: const Center(
        child: Text(
          'data',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
