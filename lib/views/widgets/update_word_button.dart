import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class UpdateWordButton extends StatelessWidget {
  const UpdateWordButton({super.key, required this.color, required this.onTap});
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: const Icon(Icons.add, color: ColorManager.black),
      ),
    );
  }
}
