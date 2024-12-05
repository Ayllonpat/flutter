import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
  
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
         backgroundColor: Colors.red,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        
      ),
      body: Container(
        color: Colors.red, 
        width: double.infinity,     
        padding: const EdgeInsets.only(right: 10, left: 10, top: 5),  
        child:Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.amber,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(
                  image: AssetImage('images/path_logo.png'),
                  width: 200,
                ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 340,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign up'),
                  
                ),
                ],
              ),
            )
             
          ]
          ),
        )
      );
  }
}