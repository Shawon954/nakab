

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class NewWRK extends StatefulWidget {
  const NewWRK({Key? key}) : super(key: key);

  @override
  State<NewWRK> createState() => _NewWRKState();
}

class _NewWRKState extends State<NewWRK> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('UserData').snapshots();

  Future<void> userdelete(selectdocument) {
    return FirebaseFirestore.instance
        .collection("UserData")
        .doc(selectdocument)
        .delete()
        .then((value) => print('Delete'))
        .catchError((error) => print(error));
  }



  TextEditingController _hours = TextEditingController();
  TextEditingController _taka = TextEditingController();

 var _Amount ;
  @override
  initState(){
    _Amount = 0;


  }

   totalamount(){
  setState(() {
    _Amount = double.parse(_hours.text) * double.parse(_taka.text);
  });

   }







  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }



  

Future <void> addUser(selectaccount) async {
    return await FirebaseFirestore.instance.collection('UserData')
        .doc(selectaccount)
     .collection('Balance')
    .doc()
        .set({
        'Date': selectedDate,
        'Today Income': _Amount,


    });
  }


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


                            SizedBox(height: 5,),

                                InkWell(
                                  onTap: (){
                                    launch("tel://${
                                    ['phone']}");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 22,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 5,),
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
                              ],
                            ),
                            IconButton(
                                onPressed: ()=>userdelete(document.id),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                     Padding(
                       padding: const EdgeInsets.only(left: 15),
                       child: Row(
                         children: [
                           SizedBox(
                             width:100,
                             height: 50,
                             child: Container(
                               decoration: ShapeDecoration(
                                 gradient: LinearGradient(
                                   colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                   stops: [0.0, 0.4],
                                   tileMode: TileMode.clamp,
                                 ),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                 ),
                               ),
                               child: TextFormField(
                                 controller: _hours,
                                 keyboardType: TextInputType.number,
                                 style: TextStyle(fontSize: 18.0, color: Colors.black54),
                                 validator: (value) => value!.isEmpty ? 'ID Number cannot be blank':null,
                                 decoration: InputDecoration(
                                   contentPadding: EdgeInsets.all(12.0),


                                   labelText: 'Hours',
                                   labelStyle: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold),
                                   hintStyle: TextStyle(color: Colors.black54),
                                   focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.white),
                                     borderRadius: BorderRadius.circular(10.0),
                                   ),
                                   enabledBorder: UnderlineInputBorder(
                                     borderSide: BorderSide(color: Colors.white),
                                     borderRadius: BorderRadius.circular(10.0),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(width: 8,),
                           SizedBox(
                             height: 50,
                             width: 110,
                             child: Container(
                               decoration: ShapeDecoration(
                                 gradient: LinearGradient(
                                   colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                   stops: [0.0, 0.4],
                                   tileMode: TileMode.clamp,
                                 ),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                 ),
                               ),
                               child: TextFormField(
                                 keyboardType: TextInputType.number,
                                 controller: _taka,
                                 style: TextStyle(fontSize: 18.0, color: Colors.black54),
                                 validator: (value) => value!.isEmpty ? 'Full Name cannot be blank':null,
                                 decoration: InputDecoration(
                                   contentPadding: EdgeInsets.all(12.0),
                                   labelText: 'Amount',
                                   labelStyle: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold),
                                   hintStyle: TextStyle(color: Colors.black54),
                                   focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.white),
                                     borderRadius: BorderRadius.circular(10.0),
                                   ),
                                   enabledBorder: UnderlineInputBorder(
                                     borderSide: BorderSide(color: Colors.white),
                                     borderRadius: BorderRadius.circular(10.0),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(width: 30,),

                           SizedBox(
                             width: 80,
                             child: NeumorphicButton(
                               margin: EdgeInsets.only(top: 12),
                               onPressed: () {
                                 addUser(document.id);
                               },

                               style: NeumorphicStyle(
                                 shape: NeumorphicShape.flat,
                                 color: Colors.white,
                                 boxShape: NeumorphicBoxShape.roundRect(
                                     BorderRadius.circular(8)),
                                 //border: NeumorphicBorder()
                               ),
                               padding: EdgeInsets.all(12.0),
                               child: Center(
                                 child: Text(
                                   "Done",
                                   style: TextStyle(
                                       fontSize: 20,
                                       color: Colors.grey,
                                       fontFamily: 'GoudyBookletter1911',
                                       fontWeight: FontWeight.bold),
                                 ),
                               ),
                             ),
                           ),

                         ],
                       ),
                     ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [

                              Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(color: Colors.grey,fontSize: 18),),
                              SizedBox(height: 20.0,),
                              IconButton(
                                onPressed: () => _selectDate(context),
                               icon: Icon(Icons.calendar_month,color: Colors.grey,),
                              ),

                              ElevatedButton(onPressed: ()=>totalamount(),
                                child: Text('Amount : $_Amount'),
                              ),
                            ],
                          ),
                        ),
                     SizedBox(
                       height: 10,
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
    );
  }
}
