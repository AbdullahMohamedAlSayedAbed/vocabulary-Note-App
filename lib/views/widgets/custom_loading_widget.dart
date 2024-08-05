import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: ColorManager.white,
    ));
  }
}
