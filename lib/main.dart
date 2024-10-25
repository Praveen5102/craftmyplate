import 'package:flutter/material.dart';
import 'package:craft_my_plate/screens/splashScreen.dart';
import 'package:craft_my_plate/screens/login1.dart';
import 'package:craft_my_plate/screens/login2.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyA_Ay3rycdRxGQlmXEiC26L2zUgeLFctZw",
        appId: "1:939911682191:android:8cb36f1e0d70899ccd38fa",
        messagingSenderId: "939911682191",
        projectId: "craftmyplate-fe055"
    )
  );
  // Run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(), // Entry point is splash screen
      routes: {
        '/login1': (context) => LoginScreen1(),
        '/login2': (context) => LoginScreen2(),
      },
    );
  }
}
