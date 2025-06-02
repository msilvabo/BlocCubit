import 'package:bloc_app/presentation/screen/cubit/parameter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParameterCubit extends Cubit<ParameterState> {
  ParameterCubit(super.initialState);

  void addData(String server, String api) {
    emit(state.copyWith(server: server, api: api));
  }
}
