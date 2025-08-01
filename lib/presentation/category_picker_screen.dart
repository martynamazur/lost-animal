import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lostanimal/utils/format_text.dart';
import '../model/animal_category.dart';



final Map<AnimalCategory, IconData> animalCategoryIcons = {
  AnimalCategory.unknown: Icons.help_outline,
  AnimalCategory.dog: Icons.pets,
  AnimalCategory.cat: Icons.pets,
  AnimalCategory.bird: Icons.flight,
  AnimalCategory.rabbit: Icons.nature,
  AnimalCategory.reptile: Icons.eco,
  AnimalCategory.horse: Icons.directions_run,
  AnimalCategory.other: Icons.category,
};

@RoutePage()
class AnimalCategoryPickerScreen extends StatelessWidget {
  final void Function(AnimalCategory) onCategorySelected;

  const AnimalCategoryPickerScreen({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wybierz kategorię')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 16.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: AnimalCategory.values.map((category) {
              return Card(
                elevation: 2,
                child: InkWell(
                  onTap: () => onCategorySelected(category),
                  child: Column(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(animalCategoryIcons[category], size: 48, color: Colors.deepPurple[300]),
                      Text(
                        capitalize(category.name),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}