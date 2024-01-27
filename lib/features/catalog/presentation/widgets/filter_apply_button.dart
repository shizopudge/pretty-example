import 'package:flutter/material.dart';

/// {@template filter_apply_button}
/// Кнопка "Применить" на экране "Фильтр
/// {@endtemplate}
@immutable
class FilterApplyButton extends StatelessWidget {
  /// {@macro on_tap}
  final VoidCallback onTap;

  /// {@macro filter_apply_button}
  const FilterApplyButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          top: false,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              fixedSize: const Size(180, 56),
            ),
            child: const Text(
              'Применить',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
}
