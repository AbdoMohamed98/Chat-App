import 'package:flutter/material.dart';

class Chatview extends StatefulWidget {
  const Chatview({super.key});

  @override
  State<Chatview> createState() => _ChatviewState();
}

class _ChatviewState extends State<Chatview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Chat'),
      ),
      body:  Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue, // Background color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),   // Top-left corner
              topRight: Radius.circular(20),  // Top-right corner
              bottomRight: Radius.circular(20), // Bottom-right corner
            ),
          ),
        
          child: Text(
            'Hello Chat!',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      
    );
  }
}
