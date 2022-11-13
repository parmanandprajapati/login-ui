import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/login_screen.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  String email = '',
      age = '',type='';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    type = sp.getString('userType') ?? '';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Student Screen'),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('email'),
              Text(email.toString()),
            ],
          ), Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('age'),
              Text(age.toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('userType'),
              Text(type.toString()),
            ],
          ),
          SizedBox(height: 40,),
          InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
