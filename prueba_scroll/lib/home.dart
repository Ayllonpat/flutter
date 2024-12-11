import 'package:flutter/material.dart';

class HomeActores extends StatelessWidget {
  const HomeActores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      body: Column(
       
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
            Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.only(top: 80, left: 35),
                child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Best Iranian Actors', style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.black, fontSize: 25),
                        
                        ),
                       
                        ],
                      ),
                       Row(
                          children: [
                            Text(
                            'and Actresses', style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.black, fontSize: 25),
                            
                        )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                            'March 2020', style: TextStyle(
                            color: Colors.grey, fontSize: 12),
                            
                        )
                          ],
                        ),
                    ],
                )
                ,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    
                  )
                ],
              ),
            )
            
        ],
      ),
    );
  }
}