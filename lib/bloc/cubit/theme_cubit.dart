import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(false);

  void useDarkTheme() => emit(true);
  void useLightTheme() => emit(false);

  @override
  bool fromJson(Map<String, dynamic> json) => json['theme'] as bool;

  @override
  Map<String, bool> toJson(bool state) => {'theme': state};
}
