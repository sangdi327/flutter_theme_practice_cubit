import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_practice/cubit/theme_cubit.dart';
import 'package:flutter_theme_practice/view/home.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void initThemeMode(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    if (context.read<ThemeCubit>().state.isSaveLocalData == false) {
      context.read<ThemeCubit>().updateMode(
            brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: Builder(builder: (context) {
        initThemeMode(context);
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) => MaterialApp(
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: state.themeMode,
            home: const Home(),
          ),
        );
      }),
    );
  }
}

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xff28222b)),
    titleSmall: TextStyle(color: const Color(0xff28222b).withOpacity(0.7)),
    labelMedium: const TextStyle(color: Color(0xff9229c8)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff9279c8)),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  cardTheme: const CardTheme(color: Colors.white),
  dividerTheme: const DividerThemeData(
    color: Color(0xffeae8f4),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xffeae8f4),
  ),
  switchTheme: const SwitchThemeData(
    thumbColor: MaterialStatePropertyAll(Colors.white),
    trackColor: MaterialStatePropertyAll(Color(0xff9279c8)),
  ),
  scaffoldBackgroundColor: const Color(0xffEAE8F4),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xffdadada)),
    titleSmall: TextStyle(color: const Color(0xffdadada).withOpacity(0.7)),
    labelMedium: const TextStyle(color: Color(0xff8abd93)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff8abd93)),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  cardTheme: const CardTheme(
    color: Color(0xff342c38),
  ),
  dividerTheme: const DividerThemeData(
    color: Color(0xff28222b),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xff282228),
  ),
  switchTheme: const SwitchThemeData(
    thumbColor: MaterialStatePropertyAll(Colors.black),
    trackColor: MaterialStatePropertyAll(Color(0xffdadada)),
  ),
  scaffoldBackgroundColor: const Color(0xff282228),
);
