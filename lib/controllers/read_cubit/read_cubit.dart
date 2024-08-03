import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'read_state.dart';

class ReadCubit extends Cubit<ReadState> {
  ReadCubit() : super(ReadInitial());
}
