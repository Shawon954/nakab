import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:nakab/Database/firebase.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future _singout()async{
    await FirebaseAuth.instance.signOut();
    Get.offAndToNamed('/loginpage');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.asset(
                      '',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35,top: 50),
              child: Row(

                children: [
                  Text(
                    'Name : ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoudyBookletter1911.otf"),
                  ),
                  Text(
                    ' Md.Shawon',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoudyBookletter1911.otf"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 35, ),
              child: Row(

                children: [
                  Text(
                    'Position : ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoudyBookletter1911.otf"),
                  ),
                  Text(
                    'HRM',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoudyBookletter1911.otf"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 35, ),
              child: Row(

                children: [
                  Text(
                    'ID : ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoudyBookletter1911.otf"),
                  ),
                  Text(
                    '56847299',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 35, ),
              child: Row(

                children: [
                  Text(
                    'Passport : ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoudyBookletter1911.otf"),
                  ),
                  Text(
                    'BD56847299',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 35, ),
              child: Row(

                children: [
                  Text(
                    'Email : ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoudyBookletter1911.otf"),
                  ),
                  Text(
                    'shawoncse954@gmail.com',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoudyBookletter1911.otf"
                        ),
                  ),
                ],
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
                    onPressed: (){



                    },
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
                    onPressed: (){



                    },
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
