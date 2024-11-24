import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  final double leftMargin;
  final double predictionResult;

  // Constructor with a required parameter for predictionResult
  PredictionPage({
    this.leftMargin = 66.0,
    required this.predictionResult,
  });

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: widget.leftMargin, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0, left:35.0),
                    child: Text(
                      'PREDICTED RATINGS',
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: widget.leftMargin + 30),
                    child: Image.asset(
                      'assets/red.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Test result box
                  Container(
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.only(right: widget.leftMargin),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: const Color.fromARGB(255, 178, 176, 176), width: 2.0),
                    ),
                    child: Text(
                      'Predicted Wine Quality: ${widget.predictionResult.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), // End of the result box
                ],
              ),
              SizedBox(height: 20),

              // Test Again Button at the bottom center
              Padding(
                padding: EdgeInsets.only(bottom: 20.0, right: 55.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality to retest or navigate to the input page
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    'Test Again',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
