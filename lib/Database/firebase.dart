


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthData{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final box = GetStorage();

  Singin(emailAddress,password)async{
    try {
      final UserCredential  usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      var authCredential= usercredential.user;
      if(authCredential!.uid.isNotEmpty){

        box.write('id', authCredential.uid);
         Get.snackbar('Welcome To', 'Our Site',colorText: Colors.white,
           backgroundColor: Colors.lightGreen,
           margin:
           const EdgeInsets.only(top: 30, bottom: 30),
           snackPosition: SnackPosition.TOP,
           isDismissible: true,
           forwardAnimationCurve: Curves.easeOutBack,);
        return Get.offAndToNamed('/homepage');


      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }



}