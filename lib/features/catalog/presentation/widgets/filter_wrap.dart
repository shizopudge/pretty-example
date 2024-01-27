import 'package:flutter/material.dart';

/// {@template filter_wrap}
/// Wrap на экране "Фильтр"
/// {@endtemplate}
@immutable
class FilterWrap extends StatelessWidget {
  /// Количество элементов
  final int itemCount;

  /// Конструктор
  final IndexedWidgetBuilder itemBuilder;

  /// {@macro filter_wrap}
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
