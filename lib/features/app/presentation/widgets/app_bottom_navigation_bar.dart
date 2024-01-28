import 'package:flutter/material.dart';

/// Навигационное меню приложения
@immutable
class AppBottomNavigationBar extends StatelessWidget {
  /// Создает навигационное меню приложения
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
