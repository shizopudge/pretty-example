import 'package:flutter/material.dart';
import 'package:pretty_example/features/catalog/presentation/pages/pages.dart';
import 'package:pretty_example/features/catalog/presentation/widgets/widgets.dart';

/// {@template catalog_page}
/// Экран "Каталог"
/// {@endtemplate}
@immutable
class CatalogPage extends StatefulWidget {
  /// {@macro catalog_page}
  const CatalogPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  /// {@template search_controller}
  /// Контроллер поиска
  /// {@endtemplate}
  late final TextEditingController _searchController;

  /// {@template search_field_focus_node}
  /// Фокус поля поиска
  /// {@endtemplate}
  late final FocusNode _searchFieldFocusNode;

  /// {@template search_field_handle}
  /// [SliverOverlapAbsorberHandle] для поля поиска
  /// {@endtemplate}
  late final SliverOverlapAbsorberHandle _searchFieldHandle;

  /// {@template categories_handle}
  /// [SliverOverlapAbsorberHandle] для категорий
  /// {@endtemplate}
  late final SliverOverlapAbsorberHandle _categoriesHandle;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFieldFocusNode = FocusNode();
    _searchFieldHandle = SliverOverlapAbsorberHandle();
    _categoriesHandle = SliverOverlapAbsorberHandle();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFieldFocusNode.dispose();
    _searchFieldHandle.dispose();
    _categoriesHandle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Каталог'),
          actions: [
            FilterButton(onTap: _goToFilterPage),
          ],
          surfaceTintColor: Colors.transparent,
        ),
        body: CatalogTabsWrapper(
          onTabChanged: _onTabChanged,
          tabsCount: 12,
          builder: (context, controller) => CatalogBody(
            onRefresh: _onRefresh,
            onScroll: _onScroll,
            onCategoryTap: _onCategoryTap,
            onSearchFieldTap: _onSearchFieldTap,
            onSearchFieldSuffixTap: _onSearchFieldSuffixTap,
            tabController: controller,
            searchController: _searchController,
            searchFieldFocusNode: _searchFieldFocusNode,
            searchFieldHandle: _searchFieldHandle,
            categoriesHandle: _categoriesHandle,
          ),
        ),
      );

  /// Переходит на экран "Фильтр"
  Future<void> _goToFilterPage() => Navigator.of(context).push<void>(
        MaterialPageRoute(
          builder: (context) => const FilterPage(),
        ),
      );

  /// {@macro on_tab_changed}
  Future<void> _onTabChanged(int index) => Future<void>.value();

  /// {@template on_refresh}
  /// Обработчик на обновление
  /// {@endtemplate}
  Future<void> _onRefresh() => Future<void>.delayed(
        const Duration(milliseconds: 1500),
      );

  /// {@template on_category_tap}
  /// Обработчик нажатия на категорию
  /// {@endtemplate}
  Future<void> _onCategoryTap(Object value) => Future<void>.value();

  /// {@template on_search_field_tap}
  /// Обработчик нажатия на поле поиска
  /// {@endtemplate}
  Future<void> _onSearchFieldTap() => Future<void>.value();

  /// {@template on_search_field_suffix_tap}
  /// Обработчик нажатия на кнопку-суффикс поля поиска
  /// {@endtemplate}
  Future<void> _onSearchFieldSuffixTap() async {
    final isSearchQueryEmpty = _searchController.text.isEmpty;
    if (!isSearchQueryEmpty) {
      _searchController.clear();
    } else {
      return Future<void>.value();
    }
  }

  /// {@template on_scroll}
  /// Обработчик на скролл
  /// {@endtemplate}
  bool _onScroll(ScrollUpdateNotification notification) {
    if (notification.depth != 1) return true;
    final isAtEdge = notification.metrics.atEdge;
    final offset = notification.metrics.pixels;
    if (offset > 0.0 && isAtEdge) {
      // Здесь будет вызов логики с пагинацией
    }
    return true;
  }
}
