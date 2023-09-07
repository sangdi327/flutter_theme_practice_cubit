import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_practice/components/app_font.dart';
import 'package:flutter_theme_practice/cubit/theme_cubit.dart';

class ThemeDrawer extends StatelessWidget {
  const ThemeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) => Column(
              children: [
                Row(
                  children: [
                    AppFont(
                      state.themeMode == ThemeMode.light ? '라이트 모드' : '다크 모드',
                      fontSize: 23,
                    ),
                    Switch(
                      value: state.isDarkMode == false,
                      onChanged: (modechage) {
                        context.read<ThemeCubit>().updateMode(
                              modechage ? ThemeMode.light : ThemeMode.dark,
                              isSaveLocalData: true,
                            );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
