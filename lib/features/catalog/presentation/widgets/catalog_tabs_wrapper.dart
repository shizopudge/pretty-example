import 'package:flutter/material.dart';

/// {@template tab_controller_widget_builder}
/// Тип функции конструктора виджета с таб контроллером
/// {@endtemplate}
typedef TabControllerWidgetBuilder = Widget Function(
    BuildContext context, TabController controller);

/// {@template catalog_tabs_wrapper}
/// Обертка с табами каталога
/// {@endtemplate}
@immutable
class CatalogTabsWrapper extends StatefulWidget {
  /// {@macro on_tab_changed}
  final ValueChanged<int> onTabChanged;

  /// Количество табов
  final int tabsCount;

  /// {@macro tab_controller_widget_builder}
  final TabControllerWidgetBuilder builder;

  /// {@macro catalog_tabs_wrapper}
  const CatalogTabsWrapper({
    required this.onTabChanged,
    required this.tabsCount,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogTabsWrapper> createState() => _CatalogTabsWrapperState();
}

class _CatalogTabsWrapperState extends State<CatalogTabsWrapper>
    with SingleTickerProviderStateMixin {
  /// {@template tab_controller}
  /// Контроллер табов
  /// {@endtemplate}
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabsCount, vsync: this)
      ..addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_onTabChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder.call(context, _tabController);

  /// {@template on_tab_changed}
  /// Обработчик на смену таба
  /// {@endtemplate}
  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    widget.onTabChanged.call(_tabController.index);
  }
}
