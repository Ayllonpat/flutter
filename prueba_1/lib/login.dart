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
        
         backgroundColor: const Color.fromRGBO(230, 47, 22, 1),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        
      ),
      body: Container(
        color:  const Color.fromRGBO(230, 47, 22, 1), 
        width: double.infinity,     
        padding: const EdgeInsets.only(right: 10, left: 10, top: 5),  
        child:Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: const Color.fromRGBO(230, 47, 22, 1),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                  image: AssetImage('images/path_logo.png'),
                  width: 200,
                  ),
                  Text('Beutiful, Private Sharing', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(220, 50), 
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
                  ),
                  child: const Text('Sign up', style: TextStyle(color:Color.fromRGBO(230, 47, 22, 1), fontSize: 20),),
                  
                  ),
                  Column(
                    
                    children: [
                      const Text('Already have a Path account?'),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Log in', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(220, 50), 
                          iconColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),    
                        )
                      ),
                    ],
                  ),
                  Text('By using Path, you agree to paths'),
                ],
              ),
            )
             
          ]
          ),
        )
      );
  }
}