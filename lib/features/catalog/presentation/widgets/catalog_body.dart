import 'package:flutter/material.dart';
import 'package:pretty_example/features/catalog/presentation/widgets/widgets.dart';

/// {@template catalog_body}
/// Тело экрана "Каталог"
/// {@endtemplate}
@immutable
class CatalogBody extends StatelessWidget {
  /// {@macro on_refresh}
  final RefreshCallback onRefresh;

  /// {@macro on_scroll}
  final NotificationListenerCallback<ScrollUpdateNotification> onScroll;

  /// {@macro on_category_tap}
  final ValueSetter<Object> onCategoryTap;

  /// {@macro on_search_field_tap}
  final VoidCallback onSearchFieldTap;

  /// {@macro on_search_field_suffix_tap}
  final VoidCallback onSearchFieldSuffixTap;

  /// {@macro tab_controller}
  final TabController tabController;

  /// {@macro search_controller}
  final TextEditingController searchController;

  /// {@macro search_field_focus_node}
  final FocusNode searchFieldFocusNode;

  /// {@macro search_field_handle}
  final SliverOverlapAbsorberHandle searchFieldHandle;

  /// {@macro categories_handle}
  final SliverOverlapAbsorberHandle categoriesHandle;

  /// {@macro catalog_body}
  const CatalogBody({
    required this.onRefresh,
    required this.onScroll,
    required this.onCategoryTap,
    required this.onSearchFieldTap,
    required this.onSearchFieldSuffixTap,
    required this.tabController,
    required this.searchController,
    required this.searchFieldFocusNode,
    required this.searchFieldHandle,
    required this.categoriesHandle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => NestedScrollView(
        floatHeaderSlivers: true,
        physics: const AlwaysScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // Поле поиска
          SliverOverlapAbsorber(
            handle: searchFieldHandle,
            sliver: SliverPersistentHeader(
              floating: true,
              delegate: SearchField(
                onTap: onSearchFieldTap,
                onSuffixTap: onSearchFieldSuffixTap,
                searchController: searchController,
                searchFieldFocusNode: searchFieldFocusNode,
              ),
            ),
          ),

          // Категории
          SliverOverlapAbsorber(
            handle: categoriesHandle,
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: CatalogCategories(
                innerBoxIsScrolled: innerBoxIsScrolled,
                tabController: tabController,
              ),
            ),
          ),
        ],
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: onScroll,
          child: RefreshIndicator(
            onRefresh: onRefresh,
            displacement: 110,
            notificationPredicate: (notification) => notification.depth == 1,
            child: TabBarView(
              controller: tabController,
              children: List.generate(
                tabController.length,
                (index) => CatalogList(
                  data: List.generate(12, (index) => Object()),
                  categoriesHandle: categoriesHandle,
                  searchFieldHandle: searchFieldHandle,
                ),
              ),
            ),
          ),
        ),
      );
}
