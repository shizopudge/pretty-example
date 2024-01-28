import 'package:flutter/material.dart';

/// Разделитель секций на экране "Фильтр"
@immutable
class FilterSectionDivider extends StatelessWidget {
  /// Отступы
  final EdgeInsets padding;

  /// Создает разделитель секций на экране "Фильтр"
  const FilterSectionDivider({
    required this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Divider(
          height: 1,
          color: Colors.grey.shade400,
        ),
      );
}
