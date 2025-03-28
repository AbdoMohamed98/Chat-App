import 'package:chatapp/widgets/custombotton.dart';
import 'package:chatapp/widgets/customtextformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  GlobalKey<FormState> formkey = GlobalKey();
   String? email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 29, 41),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              // Replace Spacer() with SizedBox for spacing
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              const SizedBox(
                height: 50,
                width: 50,
                child: Image(image: AssetImage('assets/image1.jpg')),
              ),
              const Text('Scholar Chat', style: TextStyle(color: Colors.white)),

              // Another spacing replacement
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Email',
                onChanged: (data) {
                  email = data;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                onChanged: (data) {
                  password = data;
                },
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
              SizedBox(height: 15),
              Custombutton(
                text: 'Login',
                onTap: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This password is too weak')));
                    } else if (e.code == 'email-already-in-use') {
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This account is alredy exists for this email!')));
                    }
                  } catch (e) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('There is an error , try again later')));
                  }
                },
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?  ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'Regesteation_page',
                      );
                    },
                    child: Text(
                      'Regester',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),

              // Final spacing replacement
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
