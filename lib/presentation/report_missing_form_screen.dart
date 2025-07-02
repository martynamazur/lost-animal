import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/model/animal_category.dart';
import 'package:lostanimal/provider/gallery_notifier.dart';
import 'package:lostanimal/provider/report_missing_notifier.dart';

import '../model/gender.dart';

@RoutePage()
class ReportMissingFormScreen extends ConsumerStatefulWidget {
  const ReportMissingFormScreen({super.key});

  @override
  ConsumerState createState() => _ReportMissingFormScreenState();
}

class _ReportMissingFormScreenState extends ConsumerState<ReportMissingFormScreen> {
  final keyForm = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    _buildImageGallery(),
                    _buildCategory(),
                    _buildBreed(),
                    _buildGender(),
                    _chip(),
                    _colorationDescription(),
                    _selectDateAndTime(),
                    _reward(),
                    _description()
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

  Widget _buildImageGallery(){
    final imageUrls = ref.watch(reportMissingNotifierProvider.select((form) => form.pictures));
    final galleryState = ref.watch(galleryNotifierProvider);
    return Column(
      children: [
        Text('Add pictures'),
        galleryState.when(
            data: (imageList){
             return ListView.builder(
               itemCount: imageList.length,
               shrinkWrap: true,
               itemBuilder: (context,index){
                 final url = imageList[index];
                 return CachedNetworkImage(
                   height: 50,
                   width: 50,
                   imageUrl: url,
                   placeholder: (context, url) => CircularProgressIndicator(),
                   errorWidget: (context, url, error) => Icon(Icons.error),
                 );
               }
             );
            },
            error: (_,_) => Text('something went wrong'),
            loading: () => Center(child: CircularProgressIndicator())
        ),
        OutlinedButton(
            onPressed: () async => await ref.read(galleryNotifierProvider.notifier).addImage(),
            child: Text('Click here')
        )

      ],
    );
  }

  Widget _description(){
    final descriptionController = TextEditingController();
    return Column(
      children: [
        Text('Description'),
        TextFormField(
          controller: descriptionController,
          maxLines: 5,
          decoration: InputDecoration(),
          onSaved: (_){
            final description = descriptionController.text;
            ref.read(reportMissingNotifierProvider.notifier).updateAdditionalInfo(description);
          },
        )
      ],
    );
  }

  Widget _reward(){
    final rewardAmount = ref.watch(reportMissingNotifierProvider.select((form) => form.reward));
    bool switchValue = false;
    return Column(
      children: [
        Switch(
            value: switchValue,
            onChanged: (value){
              setState(() {
                switchValue = value;
              });
            }
        ),
        if(switchValue)
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Price',
              prefixText: 'PLN'
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
          )
      ],
    );
  }

  Widget _selectDateAndTime(){
    return OutlinedButton(onPressed: () => _selectDateTime(), child: Text('Choose'));
  }
  Future<void> _selectDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        // Przypisz selectedDateTime do odpowiedniego pola formularza
      }
    }
  }


  Widget _colorationDescription(){
    return Column(
      children: [
        Text('What is its coat color'),
        TextFormField(
          decoration: InputDecoration(label: Text('Describe...')),
        )
      ],
    );
  }

  Widget _chip(){
    final switchValue = ref.watch(reportMissingNotifierProvider.select((form) => form.hasChip));
    return Column(
      children: [
        Text('Has it been microchipped?'),
        Switch(
            value: switchValue,
            onChanged: (value){
              ref.read(reportMissingNotifierProvider.notifier).updateHasChip(value);
            }
        )
      ],
    );
  }

  Widget _buildGender(){
    final selectedGender = ref.watch(reportMissingNotifierProvider.select((form) => form.gender));
    return Column(
      children: [
        Text('Wybierz płeć'),
        DropdownButtonFormField<Gender>(
          value: selectedGender,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          items: Gender.values.map((gender) {
            return DropdownMenuItem<Gender>(
              value: gender,
              child: Text(gender.name),
            );
          }).toList(),
          onChanged: (newGender) {
            if (newGender != null) {
              ref.read(reportMissingNotifierProvider.notifier).updateGender(newGender);
            }
          },
          validator: (value) {
            if (value == null) {
              return 'Proszę wybrać płeć';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildBreed(){
    return Column(
      children: [
        Text('Breed'),
        TextFormField(
          decoration: InputDecoration(labelText: 'Breed'),
        )
      ],
    );
  }

  Widget _buildCategory(){
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
