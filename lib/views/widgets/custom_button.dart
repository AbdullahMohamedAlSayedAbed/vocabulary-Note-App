import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.colorCode, required this.onPressed});
  final int colorCode;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('Done',
                style: TextStyle(
                    color: Color(colorCode), fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
