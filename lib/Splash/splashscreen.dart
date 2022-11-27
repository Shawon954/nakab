import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  chooseScreen(){
     var UserID = box.read('id');
    if(UserID!= null){
      return Get.offAndToNamed('/homepage');
    }
    else{
      return Get.offAndToNamed('/loginpage');
    }
  }

  @override
  Widget build(BuildContext context) {
   Future.delayed(Duration(seconds: 3),()=>chooseScreen());
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/splashlogo/nakab.png')
          )
        ],
      ),
    );
  }
}
