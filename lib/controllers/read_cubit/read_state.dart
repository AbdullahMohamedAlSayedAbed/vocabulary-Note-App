part of 'read_cubit.dart';

@immutable
sealed class ReadState {}

final class ReadInitial extends ReadState {}

final class ReadLoaded extends ReadState {}

final class ReadFailure extends ReadState {
  final String errMessage;

  ReadFailure(this.errMessage);
}
final class ReadSuccess extends ReadState {
  final List<WordModel> words;
  ReadSuccess(this.words);
}
