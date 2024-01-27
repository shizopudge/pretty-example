import 'package:flutter/material.dart';

/// {@template filter_body}
/// Тело экрана "Фильтр"
/// {@endtemplate}
@immutable
class FilterBody extends StatelessWidget {
  /// {@macro filter_body}
  const FilterBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // Тело экрана
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Placeholder(),
            ),
          ),

          // Отступ снизу, чтобы контент не оставался позади кнопки "Применить"
          SliverPadding(
            padding: EdgeInsets.only(
                bottom: 96 + MediaQuery.of(context).padding.bottom),
          ),
        ],
      );
}
