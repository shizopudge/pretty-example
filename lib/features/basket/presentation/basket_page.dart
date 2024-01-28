import 'package:flutter/material.dart';

/// Экран "Корзина"
@immutable
class BasketPage extends StatelessWidget {
  /// Создает экран "Корзина"
  const BasketPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Корзина'),
          surfaceTintColor: Colors.transparent,
        ),
        body: const Placeholder(),
      );
}
