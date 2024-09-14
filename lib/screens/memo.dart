import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miftahprintapp/controller/controller.dart';

class Memo extends StatelessWidget {
  Memo({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    // Calculate values from the controller
    int blackAndWhitePages = int.tryParse(controller.bwPageController.text) ?? 0;
    int colorPages = int.tryParse(controller.colorPageController.text) ?? 0;
    double bwCost = blackAndWhitePages * 1.75;
    double colorCost = colorPages * 2.5;
    double totalCost = bwCost + colorCost;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Memo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[500],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "MiftahPrint",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Display the entered name from the controller
                Text(
                  "Name: ${controller.nameController.text}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                // Display the calculation for black & white pages
                Text(
                  "Black & White Pages: $blackAndWhitePages × 1.75৳ = ${bwCost.toStringAsFixed(2)}৳",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                // Display the calculation for color pages
                Text(
                  "Color Pages: $colorPages × 2.5৳ = ${colorCost.toStringAsFixed(2)}৳",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                // Display the total cost
                Text(
                  "Total Cost: ${totalCost.toStringAsFixed(2)}৳",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add save memo functionality here if needed
              },
              child: const Text("Save memo"),
            ),
          ),
        ],
      ),
    );
  }
}
