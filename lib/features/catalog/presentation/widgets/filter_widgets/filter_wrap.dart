import 'package:flutter/material.dart';

/// Wrap на экране "Фильтр"
@immutable
class FilterWrap extends StatelessWidget {
  /// Количество элементов
  final int itemCount;

  /// Конструктор
  final IndexedWidgetBuilder itemBuilder;

  /// Создает wrap на экране "Фильтр"
  const FilterWrap({
    required this.itemCount,
    required this.itemBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 8,
        runSpacing: 12,
        children: List.generate(
          itemCount,
          (index) => itemBuilder.call(context, index),
        ),
      );
}
