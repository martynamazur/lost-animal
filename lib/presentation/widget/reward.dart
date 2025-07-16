import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/report_notifier.dart';

class Reward extends ConsumerStatefulWidget {
  const Reward({super.key});

  @override
  ConsumerState createState() => _RewardState();
}

class _RewardState extends ConsumerState<Reward> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Is a reward offered?', style: Theme.of(context).textTheme.bodyMedium),
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
                suffixText: 'PLN'
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            onSaved: (value){
              if(value != null && value.trim().isNotEmpty){
                final parsed = double.tryParse(value.trim());
                if (parsed != null) {
                  ref.read(reportNotifierProvider.notifier).updateReward(parsed);
                }
              }
            },
          )
      ],
    );
  }
}
