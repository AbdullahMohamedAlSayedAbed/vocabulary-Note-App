import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget({
    super.key,
    required this.color,
    required this.isArabic,
    required this.text,
    this.onPressed,
  });
  final Color color;
  final bool isArabic;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _getIsArabicWidget(),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  color: ColorManager.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          if (onPressed != null)
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.delete,
                  color: ColorManager.black,
                ))
        ],
      ),
    );
  }

  CircleAvatar _getIsArabicWidget() {
    return CircleAvatar(
      radius: 26,
      backgroundColor: ColorManager.black,
      child: Text(
        isArabic ? "AR" : "EN",
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
