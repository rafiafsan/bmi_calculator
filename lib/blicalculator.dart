import 'package:flutter/material.dart';


class BMI extends StatefulWidget {
  const BMI({super.key});

  
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController ageController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  late double bmi = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller:ageController,
              decoration: InputDecoration(
                hintText: 'Age'
              ),
            ),
            TextFormField(
              controller:feetController,
              decoration: InputDecoration(
                  hintText: 'Height(Feet)'
              ),
            ),
            TextFormField(
              controller:inchController,
              decoration: InputDecoration(
                  hintText: 'Height(Inch)'
              ),
            ),
            TextFormField(
              controller:weightController,
              decoration: InputDecoration(
                  hintText: 'Weight(kg)'
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              calculateBMI();
            }, child: Text("Calculate")),
            SizedBox(
              height: 10,
            ),
            Text(bmi.toString())

          ],
        ),
      ),
    );
  }

  calculateBMI() {
    double feet = double.tryParse(feetController.text) ?? 0;
    double inch = double.tryParse(inchController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    // Convert feet and inch to meters
    double heightInMeters = (feet * 12 + inch) * 0.0254;

    // Check if height is valid to prevent division by zero
    if (heightInMeters > 0) {
      double calculatedBMI = weight / (heightInMeters * heightInMeters);

      setState(() {
        bmi = calculatedBMI; // Update the state variable to refresh the UI
      });
    } else {
      setState(() {
        bmi = 0; // Set BMI to 0 if height is invalid
      });
    }
  }


// calculateBMI() {
  //   double feet = double.tryParse(feetController.text) ?? 0;
  //   double inch = double.tryParse(inchController.text) ?? 0;
  //   double weight = double.tryParse(weightController.text) ?? 0;
  //
  //   // Convert feet and inch to meters
  //   double heightInMeters = (feet * 12 + inch) * 0.0254;
  //
  //   // Calculate BMI
  //   double bmi = weight / (heightInMeters * heightInMeters);
  //   setState(() {
  //
  //   });
  // }


}