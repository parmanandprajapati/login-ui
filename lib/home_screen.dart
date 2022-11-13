import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email='',age='';
  @override
  void initState(){
    super.initState();
    loadData();
  }
  loadData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email =sp.getString('email')?? '';
   age =sp.getString('age')?? '';
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Home screen'),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('email'),
              Text(email.toString()),
            ],
          ),          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('age'),
              Text(age.toString()),
            ],
          ),
          SizedBox(height: 40,),
          InkWell(
              onTap:() async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder:(context)=> LoginScreen()));
              },

              child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: Center(
                    child: Text('Logout'),
                  )
              )
          ),
        ],
      ),
    );
  }
}
