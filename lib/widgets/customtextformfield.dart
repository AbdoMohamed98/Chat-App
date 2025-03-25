import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   const CustomTextFormField({
    super.key,
    required this.hintText, this.validator,
  });
  final String hintText;
     
     final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.white)),
        hintText: hintText,
      ),
    );
  }
}
