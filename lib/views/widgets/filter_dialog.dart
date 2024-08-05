import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';
import 'package:vocabularynoteapp/views/widgets/get_filter_button.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadCubit, ReadState>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: ColorManager.black,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _getLabelText("Language"),
                const SizedBox(height: 10),
                _getLanguageFilter(context),
                const SizedBox(height: 20),
                _getLabelText("Sorted By"),
                const SizedBox(height: 10),
                _getSortedBy(context),
                const SizedBox(height: 20),
                _getLabelText("Sorted Type"),
                const SizedBox(height: 10),
                _getSortedType(context),
              ],
            ),
          ),
        );
      },
    );
  }

  GetFilterButton _getLanguageFilter(BuildContext context) {
    return GetFilterButton(text: const [
      "English",
      "Arabic",
      "All"
    ], onTaps: [
      () => ReadCubit.get(context)
          .updateLanguageFilter(LanguageFilter.englishOnly),
      () => ReadCubit.get(context)
          .updateLanguageFilter(LanguageFilter.arabicOnly),
      () =>
          ReadCubit.get(context).updateLanguageFilter(LanguageFilter.allWords),
    ], activations: [
      ReadCubit.get(context).languageFilter == LanguageFilter.englishOnly,
      ReadCubit.get(context).languageFilter == LanguageFilter.arabicOnly,
      ReadCubit.get(context).languageFilter == LanguageFilter.allWords,
    ]);
  }

  Widget _getLabelText(String text) {
    return Text(text,
        style: const TextStyle(
            color: ColorManager.white,
            fontWeight: FontWeight.bold,
            fontSize: 18));
  }

  GetFilterButton _getSortedBy(BuildContext context) {
    return GetFilterButton(text: const [
      "Time",
      "Word Length"
    ], onTaps: [
      () => ReadCubit.get(context).updateSortedBy(SortedBy.time),
      () => ReadCubit.get(context).updateSortedBy(SortedBy.wordLength),
    ], activations: [
      ReadCubit.get(context).sortedBy == SortedBy.time,
      ReadCubit.get(context).sortedBy == SortedBy.wordLength
    ]);
  }

  GetFilterButton _getSortedType(BuildContext context) {
    return GetFilterButton(text: const [
      "Ascending",
      "Descending"
    ], onTaps: [
      () => ReadCubit.get(context).updateSortedType(SortedType.ascending),
      () => ReadCubit.get(context).updateSortedType(SortedType.descending),
    ], activations: [
      ReadCubit.get(context).sortedType == SortedType.ascending,
      ReadCubit.get(context).sortedType == SortedType.descending
    ]);
  }
}
