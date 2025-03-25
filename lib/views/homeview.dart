import 'package:chatapp/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  GlobalKey<FormState> formkey = GlobalKey();



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
              Spacer(
                flex: 1,
              ),
              const SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(image: AssetImage('assets/image1.jpg'))),
              const Text('Scholar Chat', style: TextStyle(color: Colors.white)),
              Spacer(
                flex: 1,
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 8),
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
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                height: 50,
                width: double.infinity,
                child: Center(child: Text('LOGIN')),
              ),
              SizedBox(
                height: 15,
              ),
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
                      ))
                ],
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
