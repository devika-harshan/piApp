import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Page')),
      body: Center(
        child: Text(
          'Welcome', // Text to display
          style: TextStyle(
            fontSize: 24, // Font size
            fontWeight: FontWeight.bold, // Font weight
            color: Colors.blue, // Text color
          ),
        ),
      ),
    );
  }
}
