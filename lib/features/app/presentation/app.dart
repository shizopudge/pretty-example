import 'package:flutter/material.dart';
import 'package:pretty_example/features/app/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:pretty_example/features/catalog/presentation/pages/pages.dart';

/// {@template app}
/// Корневой виджет приложения
/// {@endtemplate}
@immutable
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    Key? key,
  }) : super(key: key);

  /// Темный синий цвет с https://dartpad.dev/ "Hello, World!" Flutter примера
  static const Color _darkBlue = Color.fromARGB(255, 18, 32, 47);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: _darkBlue),
        ),
        home: const Scaffold(
          body: CatalogPage(),
          bottomNavigationBar: AppBottomNavigationBar(),
        ),
      );
}
