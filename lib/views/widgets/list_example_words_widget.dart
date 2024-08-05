import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/models/word_model.dart';
import 'package:vocabularynoteapp/views/widgets/word_info_widget.dart';

import '../../controllers/write_cubit/write_cubit.dart';

class ListExampleWordsWidget extends StatelessWidget {
  const ListExampleWordsWidget({
    super.key,
    required this.wordModel,
  });

  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
        wordModel.arabicExample.length,
        (index) {
          return WordInfoWidget(
            color: Color(wordModel.colorCode),
            isArabic: true,
            text: wordModel.arabicExample[index],
            onPressed: () {
              WriteCubit.get(context)
                  .deleteExample(wordModel.indexAtDatabase, index, true);
              ReadCubit.get(context).getWords();
            },
          );
        },
      ),
      ...List.generate(
        wordModel.englishExample.length,
        (index) {
          return WordInfoWidget(
            color: Color(wordModel.colorCode),
            isArabic: false,
            text: wordModel.englishExample[index],
            onPressed: () {
              WriteCubit.get(context)
                  .deleteExample(wordModel.indexAtDatabase, index, false);
              ReadCubit.get(context).getWords();
            },
          );
        },
      ),
    ]);
  }
}
