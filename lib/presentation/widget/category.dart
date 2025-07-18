import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
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
        Text('Category', style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: () => _showBottomSheetCategory(selectedCategory),
              child: Text(selectedCategory != AnimalCategory.unknown ? selectedCategory.name :  'Choose category',
                  style: Theme.of(context).textTheme.bodyMedium)
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
                          ref.read(reportNotifierProvider.notifier).updateCategory(category);
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
