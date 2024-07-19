import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Our Story',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/story.png'), // 2. Centrally placed image
            SizedBox(height: 24.0),
            Text(
              'About Us', // 3. About Us (Large and bold)
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We are a dedicated team committed to making schools safer and more empathetic environments for students. Our mission is:', // 4. Mission statement (Small, unbold)
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 5. Bulleted points for About Us
                BulletPoint(text: 'Foster understanding, kindness, and support within the school community.'),
                BulletPoint(text: 'Address the challenges of bullying and emotional distress.'),
                BulletPoint(text: 'Ensure every student feels valued and heard.'),
              ],
            ),
            SizedBox(height: 24.0),
            Text(
              'About Heartistry', // 6. About Heartistry (Large and bold)
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 7. Heartistry description as bulleted points
                BulletPoint(text: 'Heartistry is an AI-powered Empathy Journal to combat bullying and foster empathy among students.'),
                BulletPoint(text: 'It will help students understand and express their emotions, promoting a kinder, safer, and more supportive school environment.'),
                BulletPoint(text: 'Heartistry will empower students with the skills and support they need to navigate their emotions and build positive relationships.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.fiber_manual_record, size: 12.0),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
