import 'package:flutter/material.dart';

/// Категории каталога
@immutable
class CatalogCategories extends SliverPersistentHeaderDelegate {
  /// {@template inner_box_is_scrolled}
  /// Возвращает true, если список элементов каталога прокручен
  /// {@endtemplate}
  final bool innerBoxIsScrolled;

  /// {@macro tab_controller}
  final TabController tabController;

  /// Создает категории каталога
  const CatalogCategories({
    required this.innerBoxIsScrolled,
    required this.tabController,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      DecoratedBox(
        decoration: BoxDecoration(boxShadow: _shadows(innerBoxIsScrolled)),
        child: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: TabBar(
            dividerHeight: 0,
            isScrollable: true,
            controller: tabController,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            padding: const EdgeInsets.all(16),
            splashFactory: NoSplash.splashFactory,
            overlayColor:
                const MaterialStatePropertyAll<Color>(Colors.transparent),
            splashBorderRadius: BorderRadius.circular(24),
            physics: const ClampingScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: List.generate(
              tabController.length,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Text('Категория'),
              ),
            ),
          ),
        ),
      );

  /// Тени
  List<BoxShadow>? _shadows(bool innerBoxIsScrolled) => innerBoxIsScrolled
      ? [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            offset: const Offset(0, 1),
            blurRadius: 1.5,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            offset: const Offset(0, 1.5),
            blurRadius: 2,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.07),
            offset: const Offset(0, 2),
            blurRadius: 3,
            spreadRadius: 1.5,
          ),
        ]
      : null;

  @override
  double get maxExtent => 68;

  @override
  double get minExtent => 68;

  @override
  bool shouldRebuild(covariant CatalogCategories oldDelegate) =>
      oldDelegate.innerBoxIsScrolled != innerBoxIsScrolled ||
      oldDelegate.tabController != tabController;
}
