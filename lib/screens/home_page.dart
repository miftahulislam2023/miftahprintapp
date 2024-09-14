import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miftahprintapp/widgets/button.dart';
import 'package:miftahprintapp/widgets/input_text.dart';
import 'package:miftahprintapp/controller/controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});


  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "MiftahPrint",
          style: TextStyle(color: Colors.white60),
        ),
        backgroundColor: Colors.teal[500],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Printing Your Ideas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 15),
            InputText(
                hint: "Enter your name", controller: controller.nameController, icon: const Icon(Icons.person),),
            InputText(
              controller: controller.bwPageController,
              hint: "B&W pages",
              keyBoardType: TextInputType.number, icon: const Icon(Icons.pageview),
            ),
            InputText(
              hint: "Color pages",
              controller: controller.colorPageController,
              keyBoardType: TextInputType.number, icon: const Icon(Icons.pageview),
            ),
            const SizedBox(height: 30),
            Center(
              child: Obx(
                    () => Text(
                  controller.result.value,  // Use .value to access reactive data
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Button(
                  onPressed: controller.showResult,
                  buttonText: 'Show Total',
                ),
                Expanded(child: Container()),
                Button(
                  onPressed: () => Get.toNamed('/memo'),
                  buttonText: 'Show Memo',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
