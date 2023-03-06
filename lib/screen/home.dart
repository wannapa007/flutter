import 'package:flutter/material.dart';
import 'package:an/screen/register.dart';
import 'login.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register / Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             Image.network('https://scontent.fnak2-1.fna.fbcdn.net/v/t1.6435-9/82937445_1479237815575034_427228321147781120_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeECsPAkcje6PPmDP3XYPGq6UXmBPD8SC2ZReYE8PxILZucnr9hzWYyhynmU-MTbm_f17DessyW1wNpmxXIIkRFH&_nc_ohc=TRFuGBpeS8MAX-Isju5&_nc_ht=scontent.fnak2-1.fna&oh=00_AfCCtbpv1rKyOu8hxZ9xOQjDVMiD2Y9K5RjIHN5iVS7Hgw&oe=642D6F6C'),
                 SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                    
                      return LoginScreen();
                    }));
                  },
                ),
              ),
               Text(''),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label:
                      Text('สร้างบัญชีผู้ใช้', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    }));
                  },
                ),
              ),
             
           
            ],
          ),
        ),
      ),
    );
  }

  String newMethod() => 'assets/image/logo.png';
}
