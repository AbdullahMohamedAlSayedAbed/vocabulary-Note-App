import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class GetItemColorDesign extends StatelessWidget {
  const GetItemColorDesign(
      {super.key, required this.index, required this.colorCodes,  required this.activeColorCode });
  final int index;
  final List<int> colorCodes;
  final int activeColorCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          border: activeColorCode == colorCodes[index]
              ? Border.all(color: ColorManager.white, width: 2)
              : null,
          shape: BoxShape.circle,
          color: Color(colorCodes[index])),
      child: activeColorCode == colorCodes[index]
          ? const Center(child: Icon(Icons.check, color: ColorManager.white))
          : null,
    );
  }
}
