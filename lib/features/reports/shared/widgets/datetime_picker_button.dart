import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lostanimal/features/home/provider/reports_notifier.dart';

import 'package:lostanimal/features/reports/forms/report_notifier.dart';

class DateTimePickerButton extends ConsumerStatefulWidget {
  const DateTimePickerButton({super.key});

  @override
  ConsumerState<DateTimePickerButton> createState() =>
      _DateTimePickerButtonState();
}

class _DateTimePickerButtonState extends ConsumerState<DateTimePickerButton> {
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    final selectedDateTime = ref.watch(
      reportNotifierProvider.select((state) => state.missingSince),
    );

    final theme = Theme.of(context);
    final dateText = selectedDateTime.isUtc
        ? selectedDateTime
        : 'Choose date and time';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date and time of disappearance',
          style: theme.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () => _selectDateTime(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDateTime.toString(),
                style: theme.textTheme.bodyLarge,
              ),
              const Icon(Icons.calendar_today_outlined),
            ],
          ),
        ),
      ],
    );
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

        ref
            .read(reportNotifierProvider.notifier)
            .updateMissingSince(selectedDateTime);
      }
    }
  }
}
