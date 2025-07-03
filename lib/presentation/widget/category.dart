import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/animal_category.dart';
import '../../provider/report_missing_notifier.dart';

class Category extends ConsumerStatefulWidget {
  const Category({super.key});

  @override
  ConsumerState createState() => _CategoryState();
}

class _CategoryState extends ConsumerState<Category> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Category'),
        OutlinedButton(
            onPressed: () => _showBottomSheetCategory(),
            child: Text('Choose category')
        )
      ],
    );
  }
  void _showBottomSheetCategory(){
    final categories = AnimalCategory.values;
    final selectedCategory = ref.watch(
      reportMissingNotifierProvider.select((state) => state.category),
    );

    showModalBottomSheet(
        context: context,
        builder: (context){
          return Column(
            children: [
              Text('Choose category'),
              ListView(
                children: categories.map((category){
                  return ListTile(
                    title: Text(category.name),
                    onTap: (){
                      ref.read(reportMissingNotifierProvider.notifier).updateCategory(category);
                    },
                  );
                }).toList(),
              )
            ],
          );
        }
    );
  }
}
