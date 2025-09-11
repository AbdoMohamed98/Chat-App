import 'package:chatapp/models/messagemodel.dart';
import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  const Chatbubble({super.key, required this.messagemodel});
 final Messagemodel messagemodel ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         ConstrainedBox(
  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7), // 70% of screen
  child: Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    padding: const EdgeInsets.all(8.0),
    child: Text(
      messagemodel.message,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  ),
)
      
        ],
      ),
    ) ;
  }
}