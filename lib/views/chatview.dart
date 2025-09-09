import 'package:chatapp/widgets/chatbubble.dart';
import 'package:chatapp/widgets/customtextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatview extends StatefulWidget {
  const Chatview({super.key});

  @override
  State<Chatview> createState() => _ChatviewState();
}
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
 
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
      body:  Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Chatbubble();
              }, itemCount: 10, ),
            ),
            Customtextfield(
          onsubmitted:(data){
            messages.add({'text':data, 'createdAt':Timestamp.now()

          } ,
            );})
          ],
        ),
      )
      
    );
  }
}

