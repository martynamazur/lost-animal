import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lostanimal/features/reports/forms/report_notifier.dart';

class Reward extends ConsumerStatefulWidget {
  const Reward({super.key});

  @override
  ConsumerState createState() => _RewardState();
}

class _RewardState extends ConsumerState<Reward> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: Text(
            'Is a reward offered?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue = value;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
        ),

        if (switchValue)
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Price',
              suffixText: 'PLN',
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            onSaved: (value) {
              if (value != null && value.trim().isNotEmpty) {
                final parsed = double.tryParse(value.trim());
                if (parsed != null) {
                  ref
                      .read(reportNotifierProvider.notifier)
                      .updateReward(parsed);
                }
              }
            },
          ),
      ],
    );
  }
}
