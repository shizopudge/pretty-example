import 'package:flutter/material.dart';

/// Навигационное меню приложения
@immutable
class AppBottomNavigationBar extends StatelessWidget {
  /// {@macro on_tap}
  final ValueChanged<int> onTap;

  /// Текущий индекс
  final int currentIndex;

  /// Создает навигационное меню приложения
  const AppBottomNavigationBar({
    required this.onTap,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
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
