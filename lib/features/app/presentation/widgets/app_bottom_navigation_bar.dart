import 'package:flutter/material.dart';

/// {@template app_bottom_navigation_bar}
/// Навигационное меню приложения
/// {@endtemplate}
@immutable
class AppBottomNavigationBar extends StatelessWidget {
  /// {@macro app_bottom_navigation_bar}
  const AppBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
              ),
              label: 'Каталог',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket_rounded,
              ),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_rounded,
              ),
              label: 'Профиль',
            ),
          ],
        ),
      );
}
