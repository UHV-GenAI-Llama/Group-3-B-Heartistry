import 'package:flutter/material.dart';
import 'package:journal_app/pages/login.dart'; // Import your login page
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay before navigating to Login screen
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo_splash.png', // Replace with your image path
          fit: BoxFit.contain, // Adjust the fit as per your requirement
        ),
      ),
    );
  }
}
