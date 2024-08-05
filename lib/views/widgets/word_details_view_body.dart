import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/models/word_model.dart';
import 'package:vocabularynoteapp/views/widgets/custom_failure_widget.dart';
import 'package:vocabularynoteapp/views/widgets/custom_label_text.dart';
import 'package:vocabularynoteapp/views/widgets/custom_loading_widget.dart';
import 'package:vocabularynoteapp/views/widgets/update_word_button.dart';
import 'package:vocabularynoteapp/views/widgets/word_info_widget.dart';

import 'list_example_words_widget.dart';
import 'list_similar_word_widget.dart';
import 'update_word_dialog.dart';

class WordDetailsViewBody extends StatefulWidget {
  const WordDetailsViewBody({super.key, required this.wordModel});
  final WordModel wordModel;

  @override
  State<WordDetailsViewBody> createState() => _WordDetailsViewBodyState();
}

class _WordDetailsViewBodyState extends State<WordDetailsViewBody> {
  late WordModel _wordModel;
  @override
  void initState() {
    _wordModel = widget.wordModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadCubit, ReadState>(
      builder: (context, state) {
        if (state is ReadFailure) {
          return CustomFailureWidget(
            icon: Icons.error,
            message: state.errMessage,
          );
        }
        if (state is ReadSuccess) {
          int index = state.words.indexWhere((element) =>
              element.indexAtDatabase == _wordModel.indexAtDatabase);
          _wordModel = state.words[index];
          return GetWordSimilarAndExamplesWidget(wordModel: _wordModel);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}

class GetWordSimilarAndExamplesWidget extends StatelessWidget {
  const GetWordSimilarAndExamplesWidget({
    super.key,
    required this.wordModel,
  });

  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        CustomLabelText(wordModel: wordModel, labelText: 'Word '),
        const SizedBox(height: 5),
        WordInfoWidget(
          color: Color(wordModel.colorCode),
          isArabic: wordModel.isArabic,
          text: wordModel.text,
        ),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomLabelText(wordModel: wordModel, labelText: 'Similar Words '),
          UpdateWordButton(
            color: Color(wordModel.colorCode),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => UpdateWordDialog(
                  indexAtDatabase: wordModel.indexAtDatabase,
                  isExample: false,
                  colorCode: wordModel.colorCode,
                ),
              );
            },
          ),
        ]),
        const SizedBox(height: 10),
        ListSimilarWordWidget(wordModel: wordModel),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomLabelText(wordModel: wordModel, labelText: 'Examples'),
            UpdateWordButton(
                color: Color(wordModel.colorCode),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => UpdateWordDialog(
                      indexAtDatabase: wordModel.indexAtDatabase,
                      isExample: true,
                      colorCode: wordModel.colorCode,
                    ),
                  );
                }),
          ],
        ),
        const SizedBox(height: 10),
        ListExampleWordsWidget(wordModel: wordModel),
      ],
    );
  }
}
