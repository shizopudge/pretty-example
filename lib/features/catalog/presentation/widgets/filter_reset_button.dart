import 'package:flutter/material.dart';

/// {@template filter_reset_button}
/// Кнопка "Сбросить" на экране "Фильтр"
/// {@endtemplate}
@immutable
class FilterResetButton extends StatelessWidget {
  /// Обработчик нажатия
  final VoidCallback onTap;

  /// {@macro filter_reset_button}
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
