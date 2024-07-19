import 'package:flutter/material.dart';
import 'package:journal_app/pages/about.dart';
import 'package:journal_app/pages/chat.dart';
import 'package:journal_app/pages/gym.dart';
import 'package:journal_app/pages/home.dart';
import 'package:journal_app/pages/homepage.dart';
import 'package:journal_app/pages/signup.dart';
import 'package:journal_app/pages/login.dart';
import 'package:journal_app/pages/splash_screen.dart';

void main() => runApp(MyJournalApp());

class MyJournalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empathy Journal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Set initial route to splash screen
      routes: {
        '/': (context) => SplashScreen(), // Route for SplashScreen
        '/login': (context) => LoginPage(), // Route for LoginPage
        '/homepg': (context) => HomePage(), // Route for HomePage
        '/signup': (context) => SignUpPage(), // Route for SignUpPage
        '/home': (context) => Home(),
        '/about': (context) => AboutPage(), // Route for AboutPage
        '/gym': (context) => Gym(), // Route for GymPage
        '/chat': (context) => Chat(), // Route for ChatPage
      },
    );
  }
}
