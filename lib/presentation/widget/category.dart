import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/animal_category.dart';
import '../../provider/report_notifier.dart';

class Category extends ConsumerStatefulWidget {
  const Category({super.key});

  @override
  ConsumerState createState() => _CategoryState();
}

class _CategoryState extends ConsumerState<Category> {
  @override
  Widget build(BuildContext context) {
    final selectedCategory = ref.watch(
      reportNotifierProvider.select((state) => state.category),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: FilledButton.tonal(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => _showBottomSheetCategory(selectedCategory),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedCategory != AnimalCategory.unknown
                      ? selectedCategory.name
                      : 'Choose category',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showBottomSheetCategory(AnimalCategory selectedCategory) {
    final categories = AnimalCategory.values;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8.0,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Choose category',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                
                    return Card(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(
                          _iconForCategory(category),
                          color: isSelected
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        title: Text(
                          category.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        onTap: () {
                          ref
                              .read(reportNotifierProvider.notifier)
                              .updateCategory(category);
                          context.router.pop();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _iconForCategory(AnimalCategory category) {
    switch (category) {
      case AnimalCategory.dog:
        return Icons.pets;
      case AnimalCategory.cat:
        return Icons.pets;
      default:
        return Icons.device_unknown;
    }
  }
}
