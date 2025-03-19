import 'package:chatapp/widgets/customtextfield.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 29, 41),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image(image: AssetImage('assets/image1.jpg'))),
          Text('Scholar Chat',style: TextStyle(
            color: Colors.white
          )),
          Text('Sign In'),
          Customtextfield(hintText: 'email'),
          Customtextfield(hintText: 'password')
        ],
      ),
    );
  }
}

