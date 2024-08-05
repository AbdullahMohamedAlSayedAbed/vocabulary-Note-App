import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget(
      {super.key, required this.icon, required this.message});
  final IconData icon;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: ColorManager.white),
        const SizedBox(height: 20),
        Text(
          message,
          style: const TextStyle(color: ColorManager.white, fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
