import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_themes.dart';

import '../bloc/theme_bloc.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
                theme: state.themeName == AppTheme.lightTheme
                    ? AppTheme.darkTheme
                    : AppTheme.lightTheme));
          },
          icon: Icon(state.themeName == AppTheme.lightTheme
              ? Icons.sunny
              : Icons.brightness_2),
        );
      },
    );
  }
}

class Preferences extends StatelessWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferences"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.builder(
            itemCount: AppTheme.values.length,
            itemBuilder: (context, index) {
              final singleTheme = AppTheme.values[index];
              return InkWell(
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(theme: singleTheme));
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    color: appThemeData[singleTheme]?.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      singleTheme.toString(),
                      style: appThemeData[singleTheme]?.textTheme.bodyText1,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
