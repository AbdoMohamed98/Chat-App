import 'package:chatapp/widgets/customtextfield.dart';
import 'package:flutter/material.dart';

class Regestrationview extends StatelessWidget {
  const Regestrationview ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 29, 41),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            const SizedBox(
                height: 50,
                width: 50,
                child: Image(image: AssetImage('assets/image1.jpg'))),
            const Text('Scholar Chat', style: TextStyle(color: Colors.white)),
            Spacer(flex: 1,),
            const Text('Regester',style: TextStyle(
              color: Colors.white,
            ),),
            SizedBox(height: 20),
            const Customtextfield(hintText: 'email'),
            SizedBox(height: 8),
            const Customtextfield(hintText: 'password'),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              height: 50,
              width: double.infinity,
              child: Center(child: Text('REGESTER')),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an account?  ',style: TextStyle(
                  color: Colors.white,
                ),),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Regesteation_page',);
                    },
                    child: Text(  'LOGIN IN',style: TextStyle(
                      color: Colors.white,
                    ),)
                    
                    )
              ],
            ),
            Spacer(flex: 1,)
          ],
        ),
      ),
    );
  }
}
