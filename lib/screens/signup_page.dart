import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miftahprintapp/controller/controller.dart';
import 'package:miftahprintapp/models/user.dart';
import 'package:miftahprintapp/screens/home_page.dart';
import 'package:miftahprintapp/widgets/button.dart';
import 'package:miftahprintapp/widgets/input_text.dart';
import 'package:miftahprintapp/api_connection/api_connection.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final controller = Get.put(Controller());

  validateUserEmail() async {
    try {
      var response = await http.post(
        Uri.parse(API.validateEmail),
        body: {"user_email": controller.emailController.text},
      );
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['emailFound']) {
          Get.snackbar("Error 1", "Email already is in use");
        } else {
          saveUserData();
        }
      }
    } catch (e) {
      Get.snackbar("Error 0", e.toString());
    }
  }

  saveUserData() async {
    User userModel = User(
      1,
      controller.fullNameController.text,
      controller.emailController.text,
      controller.passwordController.text,
    );

    try {
      var response =
          await http.post(Uri.parse(API.signUp), body: userModel.toJson());

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          Get.snackbar("Done", "Account created successfully");
          controller.clearInput();
        } else {
          Get.snackbar("Error 1", "Some error occurred");
        }
      }
    } catch (e) {
      Get.snackbar("Error 2", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Register")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            InputText(
              hint: "Full Name",
              controller: controller.fullNameController,
              icon: const Icon(Icons.person),
            ),
            InputText(
              hint: "Email",
              controller: controller.emailController,
              icon: const Icon(Icons.email),
            ),
            InputText(
              hint: "Password",
              controller: controller.passwordController,
              icon: const Icon(Icons.lock),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              onPressed: () {
                validateUserEmail();
                Get.to(HomePage());
              },
              buttonText: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
