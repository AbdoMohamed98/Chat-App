import 'package:chatapp/widgets/chatbubble.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/image1.jpg'),
            ),
            SizedBox(width: 10),
            Text('Chat with User'),
          ],
        ),
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Chatbubble();
            }, itemCount: 10, ),
          ),
        ],
      )
      
    );
  }
}
