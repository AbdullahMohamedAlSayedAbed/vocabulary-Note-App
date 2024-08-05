import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/views/widgets/custom_failure_widget.dart';
import 'package:vocabularynoteapp/views/widgets/custom_loading_widget.dart';
import 'package:vocabularynoteapp/views/widgets/get_words_success_widget.dart';

class WordsWidget extends StatelessWidget {
  const WordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadCubit, ReadState>(
      builder: (context, state) {
        if (state is ReadSuccess) {
          if (state.words.isEmpty) {
            return const CustomFailureWidget(
              icon: Icons.list_rounded,
              message: 'Empty word list',
            );
          }
          return GetWordsSuccessWidget(
            words: state.words,
          );
        } else if (state is ReadFailure) {
          return CustomFailureWidget(
            icon: Icons.error,
            message: state.errMessage,
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
