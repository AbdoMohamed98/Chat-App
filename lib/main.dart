import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/views/homeview.dart';
import 'package:chatapp/views/regestrationview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'Regesteation_page' : (context) => Regestrationview()
      },
     
      home: Homeview(),
    );
  }
}
