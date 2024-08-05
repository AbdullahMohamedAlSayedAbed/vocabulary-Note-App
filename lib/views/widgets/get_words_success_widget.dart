import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/models/word_model.dart';
import 'package:vocabularynoteapp/views/widgets/custom_word_item_success.dart';

class GetWordsSuccessWidget extends StatelessWidget {
  const GetWordsSuccessWidget({super.key, required this.words});
  final List<WordModel> words;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: words.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return CustomWordItemSuccess(
          wordModel: words[index],
        );
      },
    );
  }
}
