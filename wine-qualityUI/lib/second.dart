import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/background1.jpg', // Replace with your image path
            fit: BoxFit.cover,
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TEST YOUR QUALITY HERE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'This is a machine learning initiative aimed at predicting the quality of wine based on its chemical properties.',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 188, 185, 185),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 130),
              ElevatedButton(
                onPressed: () {
                  // Add navigation or functionality for the button here
                   Navigator.pushNamed(context, '/input');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF591111), // Red wine color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text(
                  'predict here',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
