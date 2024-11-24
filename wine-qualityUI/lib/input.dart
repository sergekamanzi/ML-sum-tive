import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'prediction.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _fixedAcidityController = TextEditingController();
  final TextEditingController _volatileAcidityController = TextEditingController();
  final TextEditingController _citricAcidController = TextEditingController();
  final TextEditingController _residualSugarController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _alcoholController = TextEditingController();

  // Function to send the data to the FastAPI backend and get the result
  Future<void> predictWineQuality() async {
    // Gather the data
    var inputData = {
      'fixed_acidity': double.parse(_fixedAcidityController.text),
      'volatile_acidity': double.parse(_volatileAcidityController.text),
      'citric_acid': double.parse(_citricAcidController.text),
      'residual_sugar': double.parse(_residualSugarController.text),
      'pH': double.parse(_phController.text),
      'alcohol': double.parse(_alcoholController.text),
    };

    // Send the POST request to the FastAPI backend
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/predict/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(inputData),
    );

    if (response.statusCode == 200) {
      // If the request is successful, parse the response
      var predictionResult = json.decode(response.body)['predicted_quality'];

      // Navigation
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PredictionPage(predictionResult: predictionResult),
        ),
      );
    } else {
      // Handle the error 
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/back.png',
            width: 34,
            height: 34,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'RED WINE',
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: screenWidth * 0.06, 
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), 
              
              // Input fields
              _buildInputField('Fixed acidity', screenWidth, _fixedAcidityController),
              _buildInputField('Volatile Acidity', screenWidth, _volatileAcidityController),
              _buildInputField('Citric Acid', screenWidth, _citricAcidController),
              _buildInputField('Residual Sugar', screenWidth, _residualSugarController),
              _buildInputField('pH level', screenWidth, _phController),
              _buildInputField('Alcohol Content', screenWidth, _alcoholController),

              SizedBox(height: screenHeight * 0.01),

              // Find Result Button
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: screenHeight * 0.05),
                  child: ElevatedButton(
                    onPressed: predictWineQuality,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2,
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text(
                      'Find Result',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build input fields
  Widget _buildInputField(String label, double screenWidth, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.045,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade300,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
