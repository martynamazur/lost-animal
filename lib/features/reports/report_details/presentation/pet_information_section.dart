import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../shared/utils/count_passed_time.dart';
import '../../../../shared/utils/format_data.dart';
import '../../../../shared/widgets/details_outlined_card.dart';
import '../../../../shared/widgets/section_header.dart';

class PetInformationSection extends StatelessWidget {
  const PetInformationSection({
    super.key,
    required this.hasChip,
    required this.category,
    required this.reward,
    required this.missingSince,
  });
  final bool hasChip;
  final String category;
  final String reward;
  final DateTime missingSince;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Pet Information'),
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: DetailsOutlinedCard(icon: Icons.pets, text: category),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailsOutlinedCard(
                icon: FontAwesomeIcons.microchip,
                text: 'Chip: ${hasChip == true ? "Yes" : "No"}',
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: DetailsOutlinedCard(
                icon: Icons.monetization_on_outlined,
                text: 'Reward: $reward',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailsOutlinedCard(
                icon: Icons.schedule,
                text: 'Missing: ${formatElapsedTime(missingSince)} ago',
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        DetailsOutlinedCard(
          icon: Icons.calendar_today,
          text: 'Reported: ${formatDate(missingSince)}',
        ),
      ],
    );
  }
}
