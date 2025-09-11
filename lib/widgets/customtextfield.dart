import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    Key? key,
    required this.onsubmitted,
    required this.controller,
  }) : super(key: key);

  final ValueChanged<String> onsubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // 🔑 connect controller here
      onSubmitted: onsubmitted,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        hintText: 'Type a message',
        suffixIcon: IconButton(
          icon: const Icon(Icons.send, color: Colors.blue),
          onPressed: () => onsubmitted(controller.text), // 🔑 send on tap
        ),
      ),
    );
  }
}
