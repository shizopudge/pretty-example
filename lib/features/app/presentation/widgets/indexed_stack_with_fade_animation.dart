import 'package:flutter/material.dart';

/// [IndexedStack] с анимацией выцветания
@immutable
class IndexedStackWithFadeAnimation extends StatefulWidget {
  /// Текущий индекс
  final int currentIndex;

  /// Дочерние виджеты
  final List<Widget> children;

  /// Созадет [IndexedStack] с анимацией выцветания
  const IndexedStackWithFadeAnimation({
    required this.currentIndex,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  State<IndexedStackWithFadeAnimation> createState() =>
      _IndexedStackWithFadeAnimationState();
}

class _IndexedStackWithFadeAnimationState
    extends State<IndexedStackWithFadeAnimation>
    with SingleTickerProviderStateMixin {
  /// {@macro animation_controller}
  late final AnimationController _animationController;

  /// {@template fade_aniamtion}
  /// Fade анимация
  /// {@endtemplate}
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.short4,
      value: 0.0,
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Запускает анимацию при иницилизации виджета
    _animationController.forward(from: 0.0);
  }

  @override
  void didUpdateWidget(covariant IndexedStackWithFadeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animate(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _fadeAnimation,
        child: IndexedStack(
          index: widget.currentIndex,
          children: widget.children,
        ),
      );

  /// Анимирует виджет
  void _animate(covariant IndexedStackWithFadeAnimation oldWidget) {
    final isIndexChanged = oldWidget.currentIndex != widget.currentIndex;
    if (!isIndexChanged) return;
    _animationController.forward(from: 0.0);
  }
}
