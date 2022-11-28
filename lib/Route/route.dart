

import 'package:get/get.dart';
import 'package:nakab/Login/login.dart';
import 'package:nakab/Splash/splashscreen.dart';
import 'package:nakab/Widgets/Home/Addworkers/adworkers.dart';
import 'package:nakab/Widgets/Home/Bill/bill_sheet.dart';
import 'package:nakab/Widgets/Home/Bill/salary_details.dart';
import 'package:nakab/Widgets/Home/home.dart';
import 'package:nakab/Widgets/Work/work.dart';

List <GetPage> getpage= [
  GetPage(name: '/splashscreen', page: ()=>SplashScreen()),
  GetPage(name: '/loginpage', page: ()=>LoginPage()),
  GetPage(name: '/homepage', page: ()=>HomePage()),
  GetPage(name: '/new', page: ()=>ADDWORKER()),
  GetPage(name: '/list', page: ()=>NewWRK()),
  GetPage(name: '/sheet', page: ()=>SHEET()),
  GetPage(name: '/salary', page: ()=>SalaryDetails()),
];