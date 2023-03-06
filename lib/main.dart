import 'package:an/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future main() async {
   WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyACHaKIkn2A4WyvBs1be1Fic1BiCxjKupQ", 
      appId: "1:1073973577454:web:6df4d86655b0f6dbe815ff", 
      messagingSenderId: "1073973577454", 
      projectId: "flutter-pro-f792e")
    );
  }else{
      await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login-register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}
