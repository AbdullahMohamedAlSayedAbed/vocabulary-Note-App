import 'package:hive/hive.dart';
part 'word_model.g.dart';

@HiveType(typeId: 0)
class WordModel {
  @HiveField(0)
  final int indexAtDatabase;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final bool isArabic;
  @HiveField(3)
  final int colorCode;
  @HiveField(4)
  final List<String> arabicSimilarWords;
  @HiveField(5)
  final List<String> englishSimilarWords;
  @HiveField(6)
  final List<String> arabicExample;
  @HiveField(7)
  final List<String> englishExample;

  WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExample = const [],
    this.englishExample = const [],
  });
  WordModel addSimilarWord(String similarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords =
        _initializeNewSimilarWord(isArabicSimilarWord);
    newSimilarWords.add(similarWord);

    return _getAfterCheckSimilarWord(isArabicSimilarWord, newSimilarWords);
  }
  WordModel addExample(String example, bool isArabicExample) {
    List<String> newSimilarWords =
        _initializeNewExample(isArabicExample);
    newSimilarWords.add(example);

    return _getAfterCheckExample(isArabicExample, newSimilarWords);
  }

  WordModel deleteSimilarWord(
      int indexAtSimilarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords =
        _initializeNewSimilarWord(isArabicSimilarWord);
    newSimilarWords.removeAt(indexAtSimilarWord);

    return _getAfterCheckSimilarWord(isArabicSimilarWord, newSimilarWords);
  }
  WordModel deleteExample(
      int indexAtExample, bool isArabicExample) {
    List<String> newExamples =
        _initializeNewExample(isArabicExample);
    newExamples.removeAt(indexAtExample);

    return _getAfterCheckExample(isArabicExample, newExamples);
  }
  WordModel decrementIndexAtDatabase() {
    return WordModel(
      indexAtDatabase: indexAtDatabase - 1,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExample: arabicExample,
      englishExample: englishExample,
    );
  }
  WordModel _getAfterCheckSimilarWord(
      bool isArabicSimilarWord, List<String> newSimilarWords) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords:
          isArabicSimilarWord ? newSimilarWords : arabicSimilarWords,
      englishSimilarWords:
          !isArabicSimilarWord ? newSimilarWords : englishSimilarWords,
      arabicExample: arabicExample,
      englishExample: englishExample,
    );
  }
  WordModel _getAfterCheckExample(
      bool isArabicExample, List<String> newExample) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords:arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExample:isArabicExample ? newExample : arabicExample,
      englishExample:!isArabicExample? newExample : englishExample,
    );
  }

  List<String> _initializeNewSimilarWord(bool isArabicSimilarWord) {
    List<String> newSimilarWords = [];
    if (isArabicSimilarWord) {
      newSimilarWords = List.from(arabicSimilarWords);
    } else {
      newSimilarWords = List.from(englishSimilarWords);
    }
    return newSimilarWords;
  }
  List<String> _initializeNewExample(bool isArabicExample) {
    if (isArabicExample) {
     return List.from(arabicExample);
    } 
    return List.from(englishExample);
  }
}
