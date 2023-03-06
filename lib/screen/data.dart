import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:an/screen/home.dart';
import '../model/profile.dart';

class data extends StatelessWidget {
  data({super.key});
  final auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(
      email: ' ',
      name: ' ',
      lastname: ' ',
      password: ' ');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 41, 41, 255),
        // leading: Icon(Icons.menu),
        title: Text('Data'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            label: Text(
              "",
            ),
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              });
            },style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 53, 73, 255),)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [ Image.network('https://i0.wp.com/www.iurban.in.th/wp-content/uploads/2016/09/pooh-and-piglet.png?resize=418%2C417&ssl=1'),
              Text(
                auth.currentUser!.email!,
                style: TextStyle(fontSize: 20),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
