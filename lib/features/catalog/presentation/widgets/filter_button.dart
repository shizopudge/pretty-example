import 'package:flutter/material.dart';

/// {@template filter_button}
/// Кнопка "Фильтр"
/// {@endtemplate}
@immutable
class FilterButton extends StatelessWidget {
  /// {@template on_tap}
  /// Обработчик нажатия
  /// {@endtemplate}
  final VoidCallback onTap;

  /// {@macro filter_button}
  const FilterButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onTap,
        constraints: BoxConstraints.tight(const Size.square(48)),
        tooltip: 'Фильтр',
        icon: Icon(
          Icons.filter_alt_outlined,
          size: 32,
          color: Colors.grey.shade800,
        ),
      );
}
