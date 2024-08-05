import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class GetFilterButton extends StatelessWidget {
  const GetFilterButton(
      {super.key,
      required this.text,
      required this.onTaps,
      required this.activations});
  final List<String> text;
  final List<VoidCallback> onTaps;
  final List<bool> activations;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < text.length; i++)
          GestureDetector(
            onTap: onTaps[i],
            child: Container(
              height: 40,
              width: 90,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ColorManager.white, width: 2),
                color: activations[i] ? ColorManager.white : ColorManager.black,
              ),
              child: Center(
                child: Text(
                  text[i],
                  style: TextStyle(
                      color: activations[i]
                          ? ColorManager.black
                          : ColorManager.white),
                ),
              ),
            ),
          )
      ],
    );
  }
}
