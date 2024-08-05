import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/controllers/write_cubit/write_cubit.dart';
import 'package:vocabularynoteapp/models/word_model.dart';
import 'package:vocabularynoteapp/views/widgets/word_info_widget.dart';

class ListSimilarWordWidget extends StatelessWidget {
  const ListSimilarWordWidget({
    super.key,
    required this.wordModel,
  });

  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          wordModel.arabicSimilarWords.length,
          (index) {
            return WordInfoWidget(
              color: Color(wordModel.colorCode),
              isArabic: true,
              text: wordModel.arabicSimilarWords[index],
              onPressed: () {
                WriteCubit.get(context)
                    .deleteSimilarWord(wordModel.indexAtDatabase, index, true);
                ReadCubit.get(context).getWords();
              },
            );
          },
        ),
        ...List.generate(
          wordModel.englishSimilarWords.length,
          (index) {
            return WordInfoWidget(
              color: Color(wordModel.colorCode),
              isArabic: false,
              text: wordModel.englishSimilarWords[index],
              onPressed: () {
                WriteCubit.get(context)
                    .deleteSimilarWord(wordModel.indexAtDatabase, index, false);
                ReadCubit.get(context).getWords();
              },
            );
          },
        ),
      ],
    );
  }
}
