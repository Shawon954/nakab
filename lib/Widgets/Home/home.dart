import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';


class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {





  Future _singout()async{
    await FirebaseAuth.instance.signOut();
    Get.offAndToNamed('/loginpage');
  }



   final userinfobox = GetStorage();

   
  
  
  @override
  Widget build(BuildContext context) {
    
    
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
                 Container(
                   height: Get.height/2.2,
                   width: double.infinity,

                   child: Padding(
                     padding: const EdgeInsets.only(top: 30,left: 20),
                     child: Column(
                       children: [
                            CircleAvatar(
                              radius: 60,
                              child:ClipOval(
                                child: userinfobox.read('usrimage')
                              ),
                              ),

                         Row(
                           children: [
                             Text("Name :${userinfobox.read('usrname')} ",
                               style: TextStyle(
                                   fontSize: 20,
                                   color: Colors.grey,
                                   letterSpacing: 1.5,
                                   fontFamily: 'GoudyBookletter1911.otf',
                                   fontWeight: FontWeight.bold),)
                           ],
                         ),
                         SizedBox(height: 15,),
                         Row(
                           children: [
                             Text("Position : ${userinfobox.read('usrposition')}",
                               style: TextStyle(
                                   fontSize: 20,
                                   color: Colors.grey,
                                   letterSpacing: 1.5,
                                   fontFamily: 'GoudyBookletter1911.otf',
                                   fontWeight: FontWeight.bold),)
                           ],
                         ),
                         SizedBox(height: 15,),
                         Row(
                           children: [
                             Text("ID : ${userinfobox.read('usrId')}",
                               style: TextStyle(
                                   fontSize: 18,
                                   color: Colors.grey,
                                   letterSpacing: 1.5,

                                   fontWeight: FontWeight.bold),)
                           ],
                         ),
                         SizedBox(height: 15,),
                         Row(
                           children: [
                             Text("Call : ${userinfobox.read('usrcall')}",
                               style: TextStyle(
                                   fontSize: 18,
                                   color: Colors.grey,
                                   letterSpacing: 1.5,

                                   fontWeight: FontWeight.bold),)
                           ],
                         ),
                         SizedBox(height: 15,),
                         Row(
                           children: [
                             Text("Email : ${userinfobox.read('usremail')} ",
                               style: TextStyle(
                                   fontSize: 20,
                                   color: Colors.grey,
                                   letterSpacing: 1.5,
                                   fontFamily: 'GoudyBookletter1911.otf',
                                   fontWeight: FontWeight.bold),)
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),


            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: NeumorphicButton(
                    margin: EdgeInsets.only(top: 12),
                    onPressed: ()=>Get.toNamed('/officx'),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      color: Colors.white,
                      boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Office",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            letterSpacing: 1.5,
                            fontFamily: 'GoudyBookletter1911.otf',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: NeumorphicButton(
                    margin: EdgeInsets.only(top: 12),
                    onPressed: ()=>Get.toNamed("/list"),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      color: Colors.white,
                      boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Workers",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            letterSpacing: 1.5,
                            fontFamily: 'GoudyBookletter1911.otf',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: NeumorphicButton(
                    margin: EdgeInsets.only(top: 12),
                    onPressed: ()=>Get.toNamed('/sheet'),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      color: Colors.white,
                      boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Bill Sheet",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            letterSpacing: 1.5,
                            fontFamily: 'GoudyBookletter1911.otf',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: NeumorphicButton(
                    margin: EdgeInsets.only(top: 12),
                    onPressed: ()=>Get.toNamed('/new'),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      color: Colors.white,
                      boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Add Workers",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            letterSpacing: 1.5,
                            fontFamily: 'GoudyBookletter1911.otf',
                            fontWeight: FontWeight.bold),
                      ),

                    ),

                  ),
                ),
              ],
            ),
            SizedBox(
              width: 150,
              child: NeumorphicButton(
                margin: EdgeInsets.only(top: 12),
                onPressed: ()=>Get.toNamed('/imgset'),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  color: Colors.white,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  //border: NeumorphicBorder()
                ),
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "ImageSet",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        letterSpacing: 1.5,
                        fontFamily: 'GoudyBookletter1911.otf',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            SizedBox(height: Get.height/6,),
            SizedBox(
              width: 250,
              child: NeumorphicButton(
                margin: EdgeInsets.only(top: 12),
                onPressed: ()=>_singout(),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  color: Colors.white,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  //border: NeumorphicBorder()
                ),
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "LogOut",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        letterSpacing: 1.5,
                        fontFamily: 'GoudyBookletter1911.otf',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
