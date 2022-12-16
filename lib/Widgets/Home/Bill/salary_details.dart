

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SalaryDetails extends StatefulWidget {
  const SalaryDetails({Key? key}) : super(key: key);

  @override
  State<SalaryDetails> createState() => _SalaryDetailsState();
}

class _SalaryDetailsState extends State<SalaryDetails> {

  User? user = FirebaseAuth.instance.currentUser;
  late final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('UserData')
      .doc(user!.uid)
      .collection('Balance')
      .snapshots();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['Date']),
                subtitle: Text('Amount : ${data['Today Income']}'),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
