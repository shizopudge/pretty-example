import 'package:flutter/material.dart';
import 'package:pretty_example/features/catalog/presentation/widgets/widgets.dart';

/// {@template filter_page}
/// Экран "Фильтр"
/// {@endtemplate}
@immutable
class FilterPage extends StatelessWidget {
  /// {@macro filter_page}
  const FilterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Фильтр'),
          scrolledUnderElevation: 8.0,
          shadowColor: Colors.black.withOpacity(.3),
          surfaceTintColor: Colors.transparent,
        ),
        body: const FilterBody(),
        floatingActionButton: FilterApplyButton(
          onTap: () => _applyFilter(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  /// Применяет фильтр
  void _applyFilter(BuildContext context) => Navigator.of(context).pop();
}
