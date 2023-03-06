import 'package:an/screen/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:an/screen/data.dart';

import '../model/profile.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  @override
  final formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
get auth => FirebaseAuth.instance;
  Profile profile = Profile(
      email: ' ',
      name: ' ',
      lastname: ' ',
      password: ' '); //เพิ่มข้อมูลใน Profile(email: ' ', password:' ');
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar( title: Text("Login"),
              backgroundColor: Color.fromARGB(255, 54, 84, 255),
                 actions: [
          
          ElevatedButton.icon(
            icon: Icon(
              Icons.home,
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
            },  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 72, 155, 255),)
          ),
          
        ],
              
              ),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          //   child: TextFormField(
                          //     onSaved: (String?  username){
                          //       profile.username=username!;
                          //     },
                          //     validator: RequiredValidator(errorText: "Please enter username"),
                          //     decoration: const InputDecoration(
                          //       border: UnderlineInputBorder(),
                          //       labelText: 'username',
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              onSaved: (String? email) {
                                profile.email = email!;
                              },
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Please enter e-mail"),
                                EmailValidator(
                                    errorText: "Invalid e-mail format")
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'e-mail',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              onSaved: (String? password) {
                                profile.password = password!;
                              },
                              validator: RequiredValidator(
                                  errorText: "Please enter password"),
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'password',
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 8, vertical: 16),
                          //   child: TextFormField(
                          //     onSaved: (String? name) {
                          //       profile.name = name!;
                          //     },
                          //     validator: RequiredValidator(
                          //         errorText: "Please enter name"),
                          //     decoration: const InputDecoration(
                          //       border: UnderlineInputBorder(),
                          //       labelText: 'name',
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 8, vertical: 16),
                          //   child: TextFormField(
                          //     onSaved: (String? lastname) {
                          //       profile.lastname = lastname!;
                          //     },
                          //     validator: RequiredValidator(
                          //         errorText: "Please enter lastname"),
                          //     decoration: const InputDecoration(
                          //       border: UnderlineInputBorder(),
                          //       labelText: 'lastname',
                          //     ),
                          //   ),
                          // ),
                           SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                    
                      return index();
                    }));
                  },
                ),
              ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
