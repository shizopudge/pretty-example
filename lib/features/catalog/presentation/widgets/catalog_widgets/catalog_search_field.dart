import 'package:flutter/material.dart';

/// Поле поиска на экране "Каталог"
@immutable
class CatalogSearchField extends SliverPersistentHeaderDelegate {
  /// {@macro on_search_field_tap}
  final VoidCallback onTap;

  /// {@macro on_search_field_suffix_tap}
  final VoidCallback onSuffixTap;

  /// {@macro search_controller}
  final TextEditingController searchController;

  /// {@macro search_field_focus_node}
  final FocusNode searchFieldFocusNode;

  /// Создает поле поиска на экране "Каталог"
  const CatalogSearchField({
    required this.onTap,
    required this.onSuffixTap,
    required this.searchController,
    required this.searchFieldFocusNode,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
          child: AnimatedBuilder(
            animation: _listenable,
            builder: (context, child) => TextField(
              onTap: onTap,
              controller: searchController,
              focusNode: searchFieldFocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              textAlignVertical: TextAlignVertical.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey.shade900),
              scrollPadding: EdgeInsets.zero,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.all(20),
                hintText: 'Поиск...',
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: _hintTextColor(context)),
                focusedBorder: _activeBorder(context),
                enabledBorder: _inactiveBorder,
                suffixIconConstraints: BoxConstraints.tight(const Size(48, 40)),
                suffixIcon: _SuffixButton(
                  onTap: onSuffixTap,
                  isQueryEmpty: _isQueryEmpty,
                  isSearchFieldFocused: _isSearchFieldFocused,
                ),
              ),
            ),
          ),
        ),
      );

  /// Цвет текста подсказки
  Color _hintTextColor(BuildContext context) => _isSearchFieldFocused
      ? Theme.of(context).primaryColor
      : Colors.grey.shade900;

  /// Граница в фокусе
  InputBorder _activeBorder(BuildContext context) => OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(24),
      );

  /// Обычная граница
  InputBorder get _inactiveBorder => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(24),
      );

  /// Слушаемые элементы
  Listenable get _listenable =>
      Listenable.merge([searchController, searchFieldFocusNode]);

  /// {@template is_query_empty}
  /// Если [isQueryEmpty] == true, значит поле поиска пустое
  /// {@endtemplate}
  bool get _isQueryEmpty => searchController.text.isEmpty;

  /// {@template is_search_field_focused}
  /// Если [_isSearchFieldFocused] == true, значит поле поиска в фокусе
  /// {@endtemplate}
  bool get _isSearchFieldFocused => searchFieldFocusNode.hasFocus;

  @override
  double get maxExtent => 82;

  @override
  double get minExtent => 82;

  @override
  bool shouldRebuild(covariant CatalogSearchField oldDelegate) =>
      oldDelegate.onTap != onTap ||
      oldDelegate.onSuffixTap != onSuffixTap ||
      oldDelegate.searchController != searchController ||
      oldDelegate.searchFieldFocusNode != searchFieldFocusNode;
}

/// {@template suffix_button}
/// Кнопка суффикс поля поиска
/// {@endtemplate}
@immutable
class _SuffixButton extends StatelessWidget {
  /// {@macro on_tap}
  final VoidCallback onTap;

  /// {@macro is_query_empty}
  final bool isQueryEmpty;

  /// {@macro is_search_field_focused}
  final bool isSearchFieldFocused;

  /// {@macro suffix_button}
  const _SuffixButton({
    required this.onTap,
    required this.isQueryEmpty,
    required this.isSearchFieldFocused,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: IconButton(
          onPressed: onTap,
          tooltip: _tooltip,
          icon: AnimatedSwitcher(
            duration: Durations.short3,
            child: Icon(
              _iconData,
              key: ValueKey<String>(_tooltip),
              size: 24,
              color: _iconColor(context),
            ),
          ),
        ),
      );

  /// Подсказка
  String get _tooltip => isQueryEmpty ? 'Поиск' : 'Очистить';

  /// Иконка
  IconData get _iconData =>
      isQueryEmpty ? Icons.search_rounded : Icons.close_rounded;

  /// Цвет иконки
  Color _iconColor(BuildContext context) =>
      isSearchFieldFocused ? Theme.of(context).primaryColor : Colors.black;
}
