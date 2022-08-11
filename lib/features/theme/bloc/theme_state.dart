part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final AppTheme themeName;
  const ThemeState({required this.themeName, required this.themeData});

  @override
  List<Object?> get props => [themeData];
}
