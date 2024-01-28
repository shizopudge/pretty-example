import 'package:flutter/material.dart';
import 'package:pretty_example/features/catalog/presentation/widgets/widgets.dart';

/// Экран "Фильтр"
@immutable
class FilterPage extends StatelessWidget {
  /// Создает экран "Фильтр"
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
          actions: [
            FilterResetButton(onTap: _resetFilter),
          ],
        ),
        body: FilterBody(
          onAllMaterialsTap: _onAllMaterialsTap,
          onSizeCardTap: _onSizeCardTap,
          onColorCardTap: _onColorCardTap,
          onMaterialCardTap: _onMaterialCardTap,
          onOnlyWithDiscountChanged: _onOnlyWithDiscountChanged,
        ),
        floatingActionButton: FilterApplyButton(
          onTap: () => _applyFilter(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  /// Применяет фильтр
  void _applyFilter(BuildContext context) => Navigator.of(context).pop();

  /// Сбрасывает фильтр
  Future<void> _resetFilter() => Future<void>.value();

  /// {@template on_all_materials_tap}
  /// Обработчик нажатия н кнопку "Все" в секции "Материал"
  /// {@endtemplate}
  Future<void> _onAllMaterialsTap() => Future<void>.value();

  /// {@template on_size_card_tap}
  /// Обработчик нажатия на карточку размера
  /// {@endtemplate}
  Future<void> _onSizeCardTap() => Future<void>.value();

  /// {@template on_color_card_tap}
  /// Обработчик нажатия на карточку цвета
  /// {@endtemplate}
  Future<void> _onColorCardTap() => Future<void>.value();

  /// {@template on_color_card_tap}
  /// Обработчик нажатия на карточку материала
  /// {@endtemplate}
  Future<void> _onMaterialCardTap() => Future<void>.value();

  /// {@template on_only_with_discount_changed}
  /// Обработчик на смену значения свитча "Только со скидкой"
  /// {@endtemplate}
  Future<void> _onOnlyWithDiscountChanged(bool isOnlyWithDiscount) =>
      Future<void>.value();
}
