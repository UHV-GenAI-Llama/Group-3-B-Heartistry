import 'package:flutter/material.dart';
import 'package:journal_app/pages/home.dart'; // Import home.dart for navigation
import 'package:journal_app/pages/gym.dart'; // Import gym.dart for navigation
import 'package:journal_app/pages/chat.dart'; // Import chat.dart for navigation
import 'package:journal_app/pages/about.dart'; // Import about.dart for navigation

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
      home: HomePage(),
      routes: {
        '/home': (context) => Home(),
        '/gym': (context) => Gym(),
        '/chat': (context) => Chat(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Heartistry',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi user!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'How are you feeling today?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 4.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  EmotionBox(image: 'assets/images/very_sad.png', text: 'Upset'),
                  EmotionBox(image: 'assets/images/sad.png', text: 'Sad'),
                  EmotionBox(image: 'assets/images/neutral.png', text: 'Neutral'),
                  EmotionBox(image: 'assets/images/happy.png', text: 'Happy'),
                  EmotionBox(image: 'assets/images/very_happy.png', text: 'Excited'),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            Text(
              'What do you want to do?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            Text(
              'Get Started with your Empathy Journey',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home'); // Navigate to home.dart
                  },
                  child: Column(
                    children: <Widget>[
                      ActionBox(image: 'assets/images/reflect.png', text: 'Reflect and Write'),
                      SizedBox(height: 8.0),
                      Text(
                        'Reflect and Write',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/gym'); // Navigate to gym.dart
                  },
                  child: Column(
                    children: <Widget>[
                      ActionBox(image: 'assets/images/gym.png', text: 'Empathy Gym'),
                      SizedBox(height: 8.0),
                      Text(
                        'Empathy Gym',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/chat'); // Navigate to chat.dart
                  },
                  child: Column(
                    children: <Widget>[
                      ActionBox(image: 'assets/images/chat.png', text: 'Chat it out'),
                      SizedBox(height: 8.0),
                      Text(
                        'Chat it out',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/about'); // Navigate to about.dart
                  },
                  child: Column(
                    children: <Widget>[
                      ActionBox(image: 'assets/images/story.png', text: 'Our Story'),
                      SizedBox(height: 8.0),
                      Text(
                        'Our Story',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class EmotionBox extends StatelessWidget {
  final String image;
  final String text;

  EmotionBox({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.0,
      height: 96.0,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 48.0,
            width: 48.0,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 4.0),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ActionBox extends StatelessWidget {
  final String image;
  final String text;

  ActionBox({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            height: 100.0,
            width: 100.0,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
