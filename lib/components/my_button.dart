import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback onPressed;
  final String text;
  MyButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width/1.5, MediaQuery.of(context).size.height/15),
          backgroundColor: Colors.grey.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold)),
      child: Text(text),
    );
  }
}