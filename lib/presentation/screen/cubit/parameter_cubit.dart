import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_app/presentation/screen/cubit/parameter_state.dart';

@injectable
class ParameterCubit extends Cubit<ParameterState> {
  ParameterCubit() : super(ParameterState());

  void updateParameters(String server, String api) {
    emit(state.copyWith(server: server, api: api));
  }
}