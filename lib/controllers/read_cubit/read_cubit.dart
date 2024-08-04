import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:vocabularynoteapp/hive_cnstants.dart';
import 'package:vocabularynoteapp/models/word_model.dart';

part 'read_state.dart';

class ReadCubit extends Cubit<ReadState> {
  ReadCubit() : super(ReadInitial());
  static ReadCubit get(context) => BlocProvider.of<ReadCubit>(context);
  final Box _box = Hive.box<WordModel>(HiveConstants.wordsBox);
  LanguageFilter languageFilter = LanguageFilter.allWords;
  SortedBy sortedBy = SortedBy.time;
  SortedType sortedType = SortedType.ascending;

  @override
  void onChange(Change<ReadState> change) {
    log(change.toString());
    super.onChange(change);
  }

  void updateLanguageFilter(LanguageFilter languageFilter) {
    this.languageFilter = languageFilter;
    getWords();
  }

  void updateSortedBy(SortedBy sortedBy) {
    this.sortedBy = sortedBy;
    getWords();
  }

  void updateSortedType(SortedType sortedType) {
    this.sortedType = sortedType;
    getWords();
  }

  void getWords() {
    emit(ReadLoaded());
    try {
      List<WordModel> wordsToReturn =
          List.from(_box.get(HiveConstants.wordsList, defaultValue: []))
              .cast<WordModel>();
      _removeUnwantedWords(wordsToReturn);
      _applySorting(wordsToReturn);
      emit(ReadSuccess(wordsToReturn));
    } catch (e) {
      emit(ReadFailure('Something went wrong!,please try again later'));
    }
  }

  void _removeUnwantedWords(List<WordModel> wordsToReturn) {
    if (languageFilter == LanguageFilter.allWords) {
      return;
    }
    for (var i = 0; i < wordsToReturn.length; i++) {
      if ((languageFilter == LanguageFilter.arabicOnly &&
              wordsToReturn[i].isArabic == false) ||
          (languageFilter == LanguageFilter.englishOnly &&
              wordsToReturn[i].isArabic == true)) {
        {
          wordsToReturn.removeAt(i);
          i--;
        }
      }
    }
  }

  void _applySorting(List<WordModel> wordsToReturn) {
    if (sortedBy == SortedBy.time) {
      if (sortedType == SortedType.ascending) {
        return;
      } else {
        _reverse(wordsToReturn);
      }
    } else {
      wordsToReturn.sort(
          (WordModel a, WordModel b) => a.text.length.compareTo(b.text.length));
      if (sortedType == SortedType.ascending) {
        return;
      } else {
        _reverse(wordsToReturn);
      }
    }
  }

  void _reverse(List<WordModel> wordsToReturn) {
    for (var i = 0; i < wordsToReturn.length / 2; i++) {
      WordModel temp = wordsToReturn[i];
      wordsToReturn[i] = wordsToReturn[wordsToReturn.length - 1 - i];
      wordsToReturn[wordsToReturn.length - 1 - i] = temp;
    }
  }
}

enum LanguageFilter { arabicOnly, englishOnly, allWords }

enum SortedBy { time, wordLength }

enum SortedType { ascending, descending }
