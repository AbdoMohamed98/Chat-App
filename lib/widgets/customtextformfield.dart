import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
    CustomTextFormField({
    super.key,
    required this.hintText, this.validator,
    required this.onChanged
  });
  final String hintText;
     
     final String? Function(String?)? validator;
     void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
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
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        
      ),
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }
}
