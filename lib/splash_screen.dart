import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/home_screen.dart';
import 'package:testing/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:testing/student_screen.dart';
import 'package:testing/teacher_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    );
  }
  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool ? isLogin=sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType')?? '';
    if(isLogin){
         if (userType=='student'){
           Timer(Duration(seconds: 3), () {
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => StudentScreen()));
           }
           );
         }
         else if (userType=='teacher'){
           Timer(Duration(seconds: 3), () {
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => TeacherScreen()));
           }
           );
         }
         else{
           Navigator.push(context,
               MaterialPageRoute(builder:(context)=> HomeScreen()));
         }
    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
      );
    }
  }
    @override
    Widget build(BuildContext context) {
      print('buid');
      return Scaffold(
          body: Image(
              height: double.infinity,
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                  'https://images.pexels.com/photos/8342074/pexels-photo-8342074.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load')
          )
      );
    }
  }


