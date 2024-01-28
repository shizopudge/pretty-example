import 'package:flutter/material.dart';

/// Переключатель "Только со скидкой" на экране "Фильтр"
@immutable
class FilterOnlyWithDiscountSwitch extends StatelessWidget {
  /// {@macro on_only_with_discount_changed}
  final ValueChanged<bool> onChanged;

  /// Если true, то switch включен
  final bool isEnabled;

  /// Создает переключатель "Только со скидкой" на экране "Фильтр"
  const FilterOnlyWithDiscountSwitch({
    required this.onChanged,
    required this.isEnabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Только со скидкой',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(width: 12),
            Switch.adaptive(
              value: isEnabled,
              onChanged: onChanged,
            ),
          ],
        ),
      );
}
