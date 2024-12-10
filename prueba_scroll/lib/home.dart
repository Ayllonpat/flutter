import 'package:flutter/material.dart';

class HomeActores extends StatelessWidget {
  const HomeActores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.only(top: 30),
                child: Row(
                    children: [
                        RichText(text: TextSpan(
                        text: 'Best Iranian Actors', style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.black, fontSize: 25),
                        
                        )
                        ),
                        RichText(text: TextSpan(
                            text: ' and Actresses', style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.black, fontSize: 25),
                            
                        )
                        
                        )
                    ],
                )
                ,
            )
            
        ],
      ),
    );
  }
}