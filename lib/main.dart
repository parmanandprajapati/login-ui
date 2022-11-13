import 'package:flutter/material.dart';
import 'package:testing/splash_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Screen',
      home: SplashScreen(),
    );
  }
}
