import 'package:flutter/material.dart';

/// Список в каталоге
@immutable
class CatalogList extends StatelessWidget {
  /// Информация
  final List<Object> data;

  /// {@macro search_field_handle}
  final SliverOverlapAbsorberHandle searchFieldHandle;

  /// {@macro categories_handle}
  final SliverOverlapAbsorberHandle categoriesHandle;

  /// Создает список в каталоге
  const CatalogList({
    required this.data,
    required this.searchFieldHandle,
    required this.categoriesHandle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Поле поиска
          SliverOverlapInjector(handle: searchFieldHandle),

          // Категории
          SliverOverlapInjector(handle: categoriesHandle),

          // Пустой список
          // SliverFillRemaining(
          //   hasScrollBody: false,
          //   child: Center(
          //     child: Text(
          //       'Список пуст.',
          //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //             color: Colors.grey.shade600,
          //           ),
          //     ),
          //   ),
          // ),

          // Список элементов каталога
          SliverPadding(
            padding:
                const EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 16),
            sliver: SliverList.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) => const Placeholder(),
            ),
          ),
        ],
      );
}
