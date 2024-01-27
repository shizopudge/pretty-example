import 'package:flutter/material.dart';

/// {@template filter_section}
/// Секция фильтра
/// {@endtemplate}
@immutable
class FilterSection extends StatelessWidget {
  /// Заголовок
  final String title;

  /// Дочерний виджет
  final Widget child;

  /// Обработчик нажатия на кнпоку "Все"
  final VoidCallback? onAllTap;

  /// {@macro filter_section}
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Если onAllTap передан, тогда строиться строка с заголовком и
          // кнопкой "Все", иначе строиться просто заголовок
          if (onAllTap != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: title),
                _AllButton(onTap: onAllTap),
              ],
            ),
          ] else ...[
            title
          ],
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: child,
          ),
        ],
      ),
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
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
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
