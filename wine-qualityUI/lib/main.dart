import 'package:flutter/material.dart';
import 'prediction.dart';
import 'welcome.dart';
import 'second.dart';
import 'input.dart';  // Import InputPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wine Quality Prediction',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Define initial route and additional routes
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(), // Initial route - WelcomePage
        '/second': (context) => SecondPage(), // Route for SecondPage
        '/input': (context) => InputPage(),  // Route for InputPage
      },
      onGenerateRoute: (settings) {
        // Handle dynamic route to pass the prediction result to the PredictionPage
        if (settings.name == '/prediction') {
          final predictionResult = settings.arguments as double;
          return MaterialPageRoute(
            builder: (context) => PredictionPage(predictionResult: predictionResult),
          );
        }
        return null; // Default route
      },
    );
  }
}
