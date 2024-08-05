import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:vocabularynoteapp/hive_cnstants.dart';
import 'package:vocabularynoteapp/models/word_model.dart';

part 'write_state.dart';

class WriteCubit extends Cubit<WriteState> {
  WriteCubit() : super(WriteInitial());
  static WriteCubit get(context) => BlocProvider.of(context);
  @override
  void onChange(Change<WriteState> change) {
    log(change.toString());
    super.onChange(change);
  }

  final Box box = Hive.box(HiveConstants.wordsBox);
  String text = '';
  bool isArabic = false;
  int colorCode = 0xff4a47a3;
  void updateText(String text) {
    this.text = text;
  }

  void updateIsArabic(bool isArabic) {
    this.isArabic = isArabic;
    emit(WriteInitial());
  }

  void updateColorCode(int colorCode) {
    this.colorCode = colorCode;
    emit(WriteInitial());
  }

  void addSimilarWord(int indexAtDatabase) {
    _tryAndCatchBlock(() {
      List<WordModel> words = _getWordsFromDatabase();
      words[indexAtDatabase] =
          words[indexAtDatabase].addSimilarWord(text, isArabic);
      box.put(HiveConstants.wordsList, words);
    }, "we have problems when we add Similar Word,please try again later");
  }

  void addExample(int indexAtDatabase) {
    _tryAndCatchBlock(() {
      List<WordModel> words = _getWordsFromDatabase();
      words[indexAtDatabase] =
          words[indexAtDatabase].addExample(text, isArabic);
      box.put(HiveConstants.wordsList, words);
    }, "we have problems when we add Example,please try again later");
  }

  void deleteSimilarWord(
      int indexAtDatabase, int indexAtSimilarWord, bool isArabicSimilarWord) {
    _tryAndCatchBlock(() {
      List<WordModel> words = _getWordsFromDatabase();
      words[indexAtDatabase] = words[indexAtDatabase]
          .deleteSimilarWord(indexAtSimilarWord, isArabicSimilarWord);
      box.put(HiveConstants.wordsList, words);
    }, 'we have problems when we delete similar word,please try again later');
  }

  void deleteExample(
      int indexAtDatabase, int indexAtExample, bool isArabicExample) {
    _tryAndCatchBlock(() {
      List<WordModel> words = _getWordsFromDatabase();
      words[indexAtDatabase] =
          words[indexAtDatabase].deleteExample(indexAtExample, isArabicExample);
      box.put(HiveConstants.wordsList, words);
    }, 'we have problems when we delete example,please try again later');
  }

  void addWord() {
    _tryAndCatchBlock(() {
      List<WordModel> words = _getWordsFromDatabase();
      words.add(WordModel(
          indexAtDatabase: words.length,
          text: text,
          isArabic: isArabic,
          colorCode: colorCode));
      box.put(HiveConstants.wordsList, words);
      emit(WriteSuccess());
    }, 'Something went wrong!,please try again later');
  }

  void deleteWord(int indexAtDatabase) {
    _tryAndCatchBlock(() {
      List<WordModel> words =
          List.from(box.get(HiveConstants.wordsList, defaultValue: []))
              .cast<WordModel>();
      words.removeAt(indexAtDatabase);
      for (var i = indexAtDatabase; i < words.length; i++) {
        words[i] = words[i].decrementIndexAtDatabase();
      }
      box.put(HiveConstants.wordsList, words);
      emit(WriteSuccess());
    }, 'Something went wrong!,please try again later');
  }

  void _tryAndCatchBlock(VoidCallback methodToExecute, String message) {
    emit(WriteLoading());
    try {
      methodToExecute.call();
    } catch (error) {
      log(error.toString());
      emit(WriteFailure(message));
    }
  }

  List<WordModel> _getWordsFromDatabase() =>
      List.from(box.get(HiveConstants.wordsList, defaultValue: []))
          .cast<WordModel>();
}
