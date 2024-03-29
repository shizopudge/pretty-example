import 'package:flutter/material.dart';

/// Карточка фильтра
@immutable
class FilterCard extends StatefulWidget {
  /// {@macro on_tap}
  final VoidCallback onTap;

  /// Текст
  final String text;

  /// Если true, то карточка строится как выбранная
  final bool isSelected;

  /// Создает карточку фильтра
  const FilterCard({
    required this.onTap,
    required this.text,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard>
    with SingleTickerProviderStateMixin {
  /// {@template animation_controller}
  /// Контроллер анимации
  /// {@endtemplate}
  late final AnimationController _animationController;

  /// {@template decoration_animation}
  /// Анимация докерации
  /// {@endtemplate}
  late Animation<Decoration> _decorationAnimation;

  /// {@template text_color_animation}
  /// Анимация цвета текста
  /// {@endtemplate}
  late final Animation<Color?> _textColorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.isSelected ? 1.0 : 0.0,
      duration: Durations.short3,
    );
    _textColorAnimation =
        ColorTween(begin: Colors.grey.shade800, end: Colors.white)
            .animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _decorationAnimation = DecorationTween(
      begin: _unselectedDecoration,
      end: _selectedDecoration(context),
    ).animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant FilterCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animate(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: DecoratedBoxTransition(
          decoration: _decorationAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: AnimatedBuilder(
              animation: _textColorAnimation,
              builder: (context, child) => Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: _textColorAnimation.value),
              ),
            ),
          ),
        ),
      );

  /// Декорация выбранной карточки
  Decoration _selectedDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(24),
      );

  /// Декорация не выбранной карточки
  Decoration get _unselectedDecoration => BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(24),
      );

  /// Анимирует виджет, если поле widget.isSelected изменилось
  Future<void> _animate(covariant FilterCard oldWidget) {
    final isSelectionChanged = oldWidget.isSelected != widget.isSelected;
    if (!isSelectionChanged) return Future<void>.value();
    if (widget.isSelected) {
      return _animationController.forward();
    } else {
      return _animationController.reverse();
    }
  }
}
