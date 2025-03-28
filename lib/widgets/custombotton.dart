import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const  Custombutton({super.key, required this.text,required this.onTap});
  final String text;
   final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        height: 50,
        width: double.infinity,
        child: Center(child: Text(text)),
      ),
    );
  }
}
