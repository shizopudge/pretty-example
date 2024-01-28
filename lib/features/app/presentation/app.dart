import 'package:flutter/material.dart';
import 'package:pretty_example/features/app/presentation/widgets/widgets.dart';
import 'package:pretty_example/features/basket/presentation/basket_page.dart';
import 'package:pretty_example/features/catalog/presentation/pages/catalog_page.dart';
import 'package:pretty_example/features/profile/presentation/profile_page.dart';

/// Корневой виджет приложения
@immutable
class App extends StatefulWidget {
  /// Создает корневой виджет приложения
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// Темный синий цвет с https://dartpad.dev/ "Hello, World!" Flutter примера
  static const Color _darkBlue = Color.fromARGB(255, 18, 32, 47);

  /// {@template current_page_controller}
  /// Контроллер текущей страницы
  /// {@endtemplate}
  late final ValueNotifier<int> _currentPageController;

  @override
  void initState() {
    super.initState();

    _currentPageController = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _currentPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: _darkBlue),
        ),
        home: AnimatedBuilder(
          animation: _currentPageController,
          builder: (context, child) => Scaffold(
            body: IndexedStackWithFadeAnimation(
              currentIndex: _currentPage,
              children: const [
                CatalogPage(),
                BasketPage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: AppBottomNavigationBar(
              onTap: _setCurrentPage,
              currentIndex: _currentPage,
            ),
          ),
        ),
      );

  /// Устанавливает значение текущей страницы
  void _setCurrentPage(int index) {
    if (_currentPageController.value == index) return;
    _currentPageController.value = index;
  }

  /// Возвращает значение текущей страницы
  int get _currentPage => _currentPageController.value;
}
