import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SHEET extends StatefulWidget {
  const SHEET({Key? key}) : super(key: key);

  @override
  State<SHEET> createState() => _SHEETState();
}

class _SHEETState extends State<SHEET> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('UserData').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
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
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Container(
                  height: Get.height / 3.5,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'ID : ${data['id']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Name : ${data['name']}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                        fontFamily: 'GoudyBookletter1911.otf',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launch("tel://${['phone']}");
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: 22,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          data['phone'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Total Amount : ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '5000',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );

    //   SafeArea(
    //     child: Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //
    //         height: Get.height/6,
    //         width: double.maxFinite,
    //         child: Card(
    //           elevation: 5,
    //
    //         ),
    //       )
    //     ],
    //   ),
    // ));
  }
}
