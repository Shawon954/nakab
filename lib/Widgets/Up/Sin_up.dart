import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:image_picker/image_picker.dart';

class SingUP extends StatefulWidget {



  @override
  State<SingUP> createState() => _SingUPState();
}

class _SingUPState extends State<SingUP> {


  final userinfobox = GetStorage();

  final _formkey = GlobalKey<FormState>();



  TextEditingController _qatarid = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _emailadd = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _position = TextEditingController();

  writedata() async{

    File imgfile = File(_userimage!.path);
    FirebaseStorage _storage= FirebaseStorage.instance;
    UploadTask uploadTask = _storage.ref('UserImages').child(_userimage!.name).putFile(imgfile);

    TaskSnapshot snapshot = await uploadTask;
    imageUrl = await snapshot.ref.getDownloadURL();
    print(imageUrl);




    CollectionReference data = await FirebaseFirestore.instance.collection('myinformation');
    data.add({

      'id':_qatarid.text,
      'name':_fullname.text,
      'email':_emailadd.text,
      'phone':_phonenumber.text,
      'position':_position.text,


    });
    print(data);
    _qatarid.clear();
    _fullname.clear();
    _emailadd.clear();
    _phonenumber.clear();
    _position.clear();

    Navigator.pop(context);

  }

  XFile? _userimage;
  String? imageUrl;

  choosegallery()async{
    final ImagePicker _picker = ImagePicker();
    _userimage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }



 
      datapass(){

    if(userinfobox == null ){
      print('empty');
    } else if(userinfobox != null){
      Get.toNamed('/homepage');
    }


      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'My Information',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: "GoudyBookletter1911.otf"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 70, right: 70),
              child: Divider(
                thickness: 1.2,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 30),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
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
                        controller: _qatarid,
                        expands: false,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        validator: (value) => value!.isEmpty ? 'ID Number cannot be blank':null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.black54,
                          ),

                          labelText: 'Qatar ID',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
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
                        controller: _fullname,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        validator: (value) => value!.isEmpty ? 'Full Name cannot be blank':null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),

                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
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
                    SizedBox(
                      height: 15,),
                    Container(
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
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailadd,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        validator: (value) => value!.isEmpty ? 'Full Name cannot be blank':null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black54,
                          ),

                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
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
                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 15,
                    ),


                    Container(
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
                        controller: _phonenumber,
                        keyboardType: TextInputType.number,
                        expands: false,
                        validator: (value) => value!.isEmpty ? 'Phone Number cannot be blank':null,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.call,
                            color: Colors.red,
                          ),

                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
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

                        controller: _position,
                        expands: false,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        validator: (value) => value!.isEmpty ? 'Position cannot be blank':null,
                        decoration: InputDecoration(

                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.person_add_alt,
                            color: Colors.black54,
                          ),

                          labelText: 'Position',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
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
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      width: 200,
                      child: NeumorphicButton(
                        margin: EdgeInsets.only(top: 12),
                        onPressed: () {

                           if(_formkey.currentState!.validate()){
                            Get.toNamed('/homepage');
                            
                            userinfobox.write('usrname', _fullname.text);
                            userinfobox.write('usrId', _qatarid.text);
                            userinfobox.write('usrposition', _position.text);
                            userinfobox.write('usrcall', _phonenumber.text);
                            userinfobox.write('usremail', _emailadd.text);
                           }
                            _formkey.currentState!.save();
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
                            "Submit",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontFamily: 'GoudyBookletter1911',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
