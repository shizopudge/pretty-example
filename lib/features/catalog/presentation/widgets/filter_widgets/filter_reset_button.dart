import 'package:flutter/material.dart';

/// Кнопка "Сбросить" на экране "Фильтр"
@immutable
class FilterResetButton extends StatelessWidget {
  /// Обработчик нажатия
  final VoidCallback onTap;

  /// Создает кнопку "Сбросить" на экране "Фильтр"
  const FilterResetButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onTap,
        child: Text(
          'Сбросить',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      );
}
