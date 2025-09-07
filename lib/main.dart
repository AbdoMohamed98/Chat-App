import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/navigation/router_generation_config.dart';
import 'package:chatapp/views/chatview.dart';
import 'package:chatapp/views/loginview.dart';
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterGenerationConfig.goRouter,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}
