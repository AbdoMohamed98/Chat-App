import 'package:chatapp/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Regestrationview extends StatefulWidget {
  const Regestrationview({super.key});

  @override
  State<Regestrationview> createState() => _RegestrationviewState();
}

class _RegestrationviewState extends State<Regestrationview> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerUser() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('User registered: ${credential.user!.email}');
      // Optionally, navigate to another page
      // Navigator.pushNamed(context, 'homePage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email already in use.');
      } else if (e.code == 'weak-password') {
        print('Weak password.');
      } else {
        print('Error: ${e.message}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 29, 41),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              const Spacer(flex: 1),
              const SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(image: AssetImage('assets/image1.jpg'))),
              const Text('Scholar Chat', style: TextStyle(color: Colors.white)),
              const Spacer(flex: 1),
              const Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: 'Password',
               
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              /// LOGIN BUTTON WITH FIREBASE CALL
              GestureDetector(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    await registerUser();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(child: Text('REGISTER')),
                ),
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?  ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'login_page');
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              const Spacer(flex: 1)
            ],
          ),
        ),
      ),
    );
  }
}
