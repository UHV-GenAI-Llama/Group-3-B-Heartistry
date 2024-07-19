import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empathy Gym'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'This is the Chat page.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
