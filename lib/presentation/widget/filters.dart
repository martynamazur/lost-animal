import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/nawigation/app_router.dart';

import '../../provider/reports_notifier.dart';

class Filters extends ConsumerStatefulWidget {
  const Filters({super.key});

  @override
  ConsumerState createState() => _FiltersState();
}

class _FiltersState extends ConsumerState<Filters> {
  @override
  Widget build(BuildContext context) {
    final categoryName = ref.watch(reportsNotifierProvider.notifier).currentCategory;
    final isDescending = ref.watch(reportsNotifierProvider.notifier).currentToggle;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 8,
            children: [
              FilterChip(
                label: Text(categoryName?.name ?? 'All categories'),
                selected: categoryName != null,
                onSelected: (_) => context.router.push(
                    AnimalCategoryPickerRoute(
                      onCategorySelected: (category){
                        ref.read(reportsNotifierProvider.notifier).filterByCategory(category);
                        context.router.pop();
                      }
                    )
                ),
              ),
              FilterChip(
                label: Text(isDescending ? 'Newest' : 'Oldest'),
                onSelected: (_) => ref.read(reportsNotifierProvider.notifier).toggleSortOrder(),
                avatar: Icon(isDescending ? Icons.arrow_upward : Icons.arrow_downward),
              ),
              FilterChip(
                label: const Text('Filters'),
                selected: false,
                onSelected: (_) {
                  // logika filtrowania
                },
                avatar: const Icon(Icons.filter_list_alt),
              ),
            ],
          ),
        )
    );
  }
}
