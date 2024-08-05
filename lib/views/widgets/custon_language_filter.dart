import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabularynoteapp/controllers/read_cubit/read_cubit.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

class CustomLanguageFilter extends StatelessWidget {
  const CustomLanguageFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadCubit, ReadState>(
      builder: (context, state) {
        return Text(
          _mapLanguageFilterToText(ReadCubit.get(context).languageFilter),
          style: const TextStyle(
              color: ColorManager.white,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        );
      },
    );
  }

  String _mapLanguageFilterToText(LanguageFilter languageFilter) {
    switch (languageFilter) {
      case LanguageFilter.arabicOnly:
        return "Arabic Only";
      case LanguageFilter.englishOnly:
        return "English Only";
      default:
        return "All Words";
    }
  }
}
