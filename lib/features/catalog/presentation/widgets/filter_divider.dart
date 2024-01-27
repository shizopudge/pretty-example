import 'package:flutter/material.dart';

/// {@template filter_divider}
/// Разделитель на экране "Фильтр"
/// {@endtemplate}
@immutable
class FilterDivider extends StatelessWidget {
  /// Отступы
  final EdgeInsets padding;

  /// {@macro filter_divider}
  const FilterDivider({
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
