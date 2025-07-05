import 'package:auto_route/auto_route.dart';
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
    final selectedCategory = ref.watch(
      reportMissingNotifierProvider.select((state) => state.category),
    );
    return Column(
      children: [
        Text('Category'),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: () => _showBottomSheetCategory(selectedCategory),
              child: Text(selectedCategory != AnimalCategory.unknown ? selectedCategory.name :  'Choose category')
          ),
        )
      ],
    );
  }
  void _showBottomSheetCategory(AnimalCategory selectedCategory){
    final categories = AnimalCategory.values;

    showModalBottomSheet(
        context: context,
        builder: (context){
          return SingleChildScrollView(
            child: Column(
              children: [
                Text('Choose category'),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: categories.map((category){
                    final isSelected = category == selectedCategory;
                    return Container(
                      color: isSelected? Colors.blueGrey[100] : null,
                      child: ListTile(
                        title: Text(category.name),
                        onTap: () async{
                          ref.read(reportMissingNotifierProvider.notifier).updateCategory(category);
                          context.router.pop();
                        },
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        }
    );
  }
}
