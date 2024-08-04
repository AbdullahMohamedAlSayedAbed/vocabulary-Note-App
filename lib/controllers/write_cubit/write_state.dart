part of 'write_cubit.dart';

@immutable
sealed class WriteState {}

final class WriteInitial extends WriteState {}

final class WriteLoading extends WriteState {}

final class WriteSuccess extends WriteState {}

final class WriteFailure extends WriteState {
 final String errMessage;

  WriteFailure(this.errMessage);

}
