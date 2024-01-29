import 'package:flutter/material.dart';

/// Секция фильтра
@immutable
class FilterSection extends StatelessWidget {
  /// Заголовок
  final String title;

  /// Дочерний виджет
  final Widget child;

  /// Обработчик нажатия на кнпоку "Все"
  final VoidCallback? onAllTap;

  /// Создает секцию фильтра
  const FilterSection({
    required this.title,
    required this.child,
    this.onAllTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Заголовок
    final title = Text(
      this.title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.black),
    );

    // Обработчик нажатия на кнопку "Все"
    final onAllTap = this.onAllTap;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Если onAllTap передан, тогда строиться строка с заголовком и
        // кнопкой "Все", иначе строиться просто заголовок
        if (onAllTap != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: title),
                _AllButton(onTap: onAllTap),
              ],
            ),
          ),
        ] else ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: title,
          )
        ],
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
          child: child,
        ),
      ],
    );
  }
}

/// {@template all_button}
/// Кнопка "Все"
/// {@endtemplate}
@immutable
class _AllButton extends StatelessWidget {
  /// Обработчик нажатия
  final VoidCallback onTap;

  /// {@macro all_button}
  const _AllButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          fixedSize: const Size.fromHeight(52),
        ),
        child: Row(
          children: [
            Text(
              'Все',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      );
}
