import 'package:flutter/material.dart';

/// Экран "Профиль"
@immutable
class ProfilePage extends StatelessWidget {
  /// Создает экран "Профиль"
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Профиль'),
          surfaceTintColor: Colors.transparent,
        ),
        body: const Placeholder(),
      );
}
