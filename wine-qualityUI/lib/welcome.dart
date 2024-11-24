import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark overlay for text contrast
          Container(
            width: screenWidth,
            height: screenHeight,
            color: Colors.black.withOpacity(0.5),
          ),
          // Text content
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome text
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02), // Responsive padding
                      child: Text(
                        'WELCOME TO WINE QUALITY PREDICTOR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.07, // Responsive font size
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                  SizedBox(height: screenHeight * 0.02), 
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive horizontal padding
                      child: Text(
                        'Taste your favorite wine to confirm its vulnerability and also for your health',
                        textAlign: TextAlign.center, // Changed to center for better readability
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: screenWidth * 0.04, // Responsive text size
                        ),
                      ),
                    ),

                  SizedBox(height: screenHeight * 0.05), // Spacing before button
                  // Start Now button
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.2), // Responsive padding
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF591111),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.13, // Responsive padding
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70.0), // Top-right radius
                            bottomRight: Radius.circular(70.0), // Bottom-right radius
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to PredictionPage
                        Navigator.pushNamed(context, '/second');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Start Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.045, // Responsive font size
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03), // Spacing between text and icon
                          Flexible(
                            child: Image.asset(
                              'assets/forward.png',
                              width: screenWidth * 0.06, // Responsive icon size
                              height: screenHeight * 0.06,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
