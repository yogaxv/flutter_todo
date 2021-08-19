import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void useDarkTheme() => emit(true);
  void useLightTheme() => emit(false);
}
