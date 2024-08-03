import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'write_state.dart';

class WriteCubit extends Cubit<WriteState> {
  WriteCubit() : super(WriteInitial());
}
