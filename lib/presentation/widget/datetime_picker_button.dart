import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimePickerButton extends ConsumerWidget {
  final void Function(DateTime) onDateTimeSelected;
  const DateTimePickerButton(this.onDateTimeSelected, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(onPressed: () => _selectDateTime(context), child: Text('Choose'));
  }
  Future<void> _selectDateTime(BuildContext context) async {
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
        onDateTimeSelected(selectedDateTime);
      }
    }
  }
}
