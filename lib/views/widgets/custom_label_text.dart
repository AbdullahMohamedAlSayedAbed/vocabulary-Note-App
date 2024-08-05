import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/models/word_model.dart';

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({
    super.key,
    required this.wordModel, required this.labelText,
  });

  final WordModel wordModel;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: TextStyle(
        color: Color(wordModel.colorCode),
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
