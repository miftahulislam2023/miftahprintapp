import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController bwPageController = TextEditingController();
  TextEditingController colorPageController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Making `result` reactive
  var result = "Total cost: ৳0.00".obs;

  void showResult() {
    int bwPages = int.tryParse(bwPageController.text) ?? 0;
    int colorPages = int.tryParse(colorPageController.text) ?? 0;
    double totalCost = (bwPages * 1.75) + (colorPages * 2.5);

    // Update the reactive result value
    result.value = "Total cost: ৳${totalCost.toStringAsFixed(2)}";
  }
}
