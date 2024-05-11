import 'package:flutter/material.dart';
import 'package:weight_tracker/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 130,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            // get user input
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your weight',
              ),
            ),
            //buttons
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(onPressed: onSave, text: "Save"),
                const SizedBox(
                  width: 8,
                ),
                MyButton(onPressed: onCancel, text: 'Cancel')
              ],
            )
          ],
        ),
      ),
    );
  }
}
