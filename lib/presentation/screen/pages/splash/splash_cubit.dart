part of 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void success() {
    emit(state.copyWith(status: SplashStatus.loading));
    Future.delayed(const Duration(seconds: 3), () {
      emit(state.copyWith(status: SplashStatus.success));
    });
  }
  void init() {
      emit(state.copyWith(status: SplashStatus.loading));
  }
}
