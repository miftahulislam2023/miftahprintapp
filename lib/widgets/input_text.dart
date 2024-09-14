import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyBoardType;
  final Icon icon;
  const InputText(
      {super.key,
      required this.hint,
      required this.controller,
      this.keyBoardType = TextInputType.text, required this.icon});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = widget.controller.text.isEmpty;
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            hintText: widget.hint,
            filled: true,
            fillColor: isEmpty ? Colors.red[100] : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          keyboardType: widget.keyBoardType,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
