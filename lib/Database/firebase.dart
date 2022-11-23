


import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthData{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Singin(emailAddress,password)async{
    try {
      final UserCredential  usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      var authCredential= usercredential.user;
      if(authCredential!.uid.isNotEmpty){
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