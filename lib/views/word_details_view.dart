import 'package:flutter/material.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/controllers/write_cubit/write_cubit.dart';
import 'package:vocabularynoteapp/models/word_model.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';
import 'package:vocabularynoteapp/views/widgets/add_word_dialog.dart';
import 'package:vocabularynoteapp/views/widgets/word_info_widget.dart';

import 'widgets/custom_label_text.dart';
import 'widgets/update_word_button.dart';
import 'widgets/word_details_view_body.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key, required this.wordModel});
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(wordModel.colorCode),
        title: Text(
          'Word Details',
          style: TextStyle(color: Color(wordModel.colorCode)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                WriteCubit.get(context).deleteWord(wordModel.indexAtDatabase);

                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: WordDetailsViewBody(
        wordModel: wordModel,
      ),
    );
  }
}
