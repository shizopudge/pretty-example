import 'package:flutter/material.dart';
import 'package:pretty_example/features/catalog/presentation/widgets/widgets.dart';

/// Тело экрана "Фильтр"
@immutable
class FilterBody extends StatelessWidget {
  /// {@macro on_all_materials_tap}
  final VoidCallback onAllMaterialsTap;

  /// {@macro on_size_card_tap}
  final VoidCallback onSizeCardTap;

  /// {@macro on_color_card_tap}
  final VoidCallback onColorCardTap;

  /// {@macro on_color_card_tap}
  final VoidCallback onMaterialCardTap;

  /// {@macro on_only_with_discount_changed}
  final ValueChanged<bool> onOnlyWithDiscountChanged;

  /// Создает тело экрана "Фильтр"
  const FilterBody({
    required this.onAllMaterialsTap,
    required this.onSizeCardTap,
    required this.onColorCardTap,
    required this.onMaterialCardTap,
    required this.onOnlyWithDiscountChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // Тело экрана
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Размер
                  FilterSection(
                    title: 'Размер',
                    child: FilterWrap(
                      itemCount: 12,
                      itemBuilder: (context, index) => FilterCard(
                        onTap: onSizeCardTap,
                        text: '41',
                        isSelected: index == 1,
                      ),
                    ),
                  ),

                  // Разделитель
                  const FilterSectionDivider(
                      padding: EdgeInsets.symmetric(vertical: 16)),

                  // Цвет
                  FilterSection(
                    title: 'Цвет',
                    child: FilterWrap(
                      itemCount: 7,
                      itemBuilder: (context, index) => FilterCard(
                        onTap: onColorCardTap,
                        text: 'Белый',
                        isSelected: index == 0,
                      ),
                    ),
                  ),
                  // Разделитель
                  const FilterSectionDivider(padding: EdgeInsets.only(top: 16)),

                  // Материал
                  FilterSection(
                    title: 'Материал',
                    onAllTap: () {},
                    child: FilterWrap(
                      itemCount: 12,
                      itemBuilder: (context, index) => FilterCard(
                        onTap: onMaterialCardTap,
                        text: 'Хлопок',
                        isSelected: index == 4,
                      ),
                    ),
                  ),

                  // Разделитель
                  const FilterSectionDivider(
                      padding: EdgeInsets.symmetric(vertical: 16)),

                  // Только со скидкой
                  FilterOnlyWithDiscountSwitch(
                      onChanged: onOnlyWithDiscountChanged, isEnabled: true),
                ],
              ),
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
