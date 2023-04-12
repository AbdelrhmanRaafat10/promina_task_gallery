
import 'package:flutter/material.dart';

extension SnackBarShower on BuildContext {
  void showSnackBar(String message,{Color color=Colors.redAccent}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: color,
        content: Text(message,style: const TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}