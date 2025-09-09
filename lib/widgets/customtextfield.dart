import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
     const Customtextfield({
    this.onsubmitted
    ,super.key
  });
    final ValueChanged<String>? onsubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onsubmitted,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintText: 'Type a message',
        suffixIcon: Icon(
          Icons.send,
          
          color: Colors.blue,
        ),
      ),
    );
  }
}
