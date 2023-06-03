import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:  [
                Color.fromARGB(255, 38, 10, 85),
               Color.fromARGB(26, 164, 132, 238)
               ],
               begin: Alignment.topLeft,
               end: Alignment.bottomRight
            ),
          ),
          child: const Center(
            child: Text('Hello World!!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30, 
              ),
            ),
          ),
        ),
      ),
    ), 
  );
}
