

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SalaryDetails extends StatefulWidget {
  const SalaryDetails({Key? key}) : super(key: key);

  @override
  State<SalaryDetails> createState() => _SalaryDetailsState();
}

class _SalaryDetailsState extends State<SalaryDetails> {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('UserData')
     .doc().collection('Balance').snapshots();

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
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
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text('Date : ${data['Date']}'),
                    subtitle: Text('Income : ${data['Today Income']}'),
                  ),
                );
              }).toList(),
            ),
          );
        },
    );
  }
}
