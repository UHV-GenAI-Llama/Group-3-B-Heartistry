import 'package:flutter/material.dart';
import 'package:journal_app/pages/login.dart'; // Import login.dart to navigate to LoginPage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Get Started', // 1. Get Started (Large and bold)
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'by creating a free account.', // 2. By creating a free account (Small, unbold)
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 24.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Full Name', // 3a. TextField 1: Full name with appropriate icon
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Valid Email', // 3b. TextField 2: Valid email with appropriate icon
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number', // 3c. TextField 3: Phone number with appropriate icon
                  suffixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Strong Password', // 3d. TextField 4: Strong password with appropriate icon
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {}, // 4. Next button same as login page
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                ),
                child: Text('Next'),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
                  );
                },
                child: Text(
                  'Already Member? Login now', // 5. Below button: Already Member? Login now (Bold)
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
