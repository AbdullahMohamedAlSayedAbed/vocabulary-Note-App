import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';
import 'package:vocabularynoteapp/views/widgets/add_word_dialog.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorManager.white,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const AddWordDialog(),
        );
      },
      child: const Icon(Icons.add, color: ColorManager.black),
    );
  }
}
