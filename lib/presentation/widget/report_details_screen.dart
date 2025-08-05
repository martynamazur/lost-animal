import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostanimal/presentation/widget/bottom_contact_bar.dart';
import 'package:lostanimal/presentation/widget/details_filled_card.dart';
import 'package:lostanimal/presentation/widget/details_outlined_card.dart';
import 'package:lostanimal/presentation/widget/image_gallery.dart';
import 'package:lostanimal/provider/report_provider.dart';
import 'package:lostanimal/utils/count_passed_time.dart';
import 'package:lostanimal/utils/format_data.dart';

import '../../model/report_model.dart';

@RoutePage()
class ReportDetailsScreen extends ConsumerStatefulWidget {
  final String reportId;
  const ReportDetailsScreen(this.reportId, {super.key});

  @override
  ConsumerState createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends ConsumerState<ReportDetailsScreen> {
  

  @override
  Widget build(BuildContext context) {
    final report = ref.watch(getReportByIdProvider(reportId: widget.reportId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: report.when(
            data: (report){
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 8,
                            children: [
                              DetailsFilledCard(
                                type: report?.type,
                                  icon: Icons.search_rounded,
                                  text: report!.type.toUpperCase(),

                              ),

                              ImageGallery(imageUrls: report.pictures),

                              Row(
                                children: [
                                  Expanded(
                                    child: DetailsOutlinedCard(
                                        icon: Icons.pets,
                                        text: report.category.name
                                    ),
                                  ),
                                  Expanded(
                                    child: DetailsOutlinedCard(
                                        icon: FontAwesomeIcons.microchip,
                                        text: 'Chip: ${report.hasChip! ? "Yes" : "No"}'
                                    ),
                                  ),
                                ],
                              ),


                               IntrinsicHeight(
                                 child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: SizedBox(
                                          height: double.infinity,
                                          child: DetailsOutlinedCard(
                                              icon: Icons.monetization_on_outlined,
                                              text: 'Reward ${report.reward!}'
                                          ),
                                        ),
                                      ),
                                 
                                 
                                      Flexible(
                                          child: SizedBox(
                                            height: double.infinity,
                                            child: DetailsOutlinedCard(
                                                icon: Icons.timelapse_sharp,
                                                text: 'Missing since ${formatElapsedTime(report.missingSince)} ago'
                                            ),
                                          )
                                      ),
                                 
                                    ]
                                                               ),
                               ),

                              DetailsOutlinedCard(
                                icon: Icons.remove_red_eye_outlined,
                                text: 'Reported: ${formatDate(report.missingSince)}',
                              ),

                              if(report.coloration !=null || report.coloration!.isNotEmpty )
                                DetailsFilledCard(icon: Icons.color_lens, text:'Fur colors & special marks: ${report.coloration}' ),


                              if(report.additionalInfo !=null || report.additionalInfo!.isNotEmpty)
                                DetailsFilledCard(icon: Icons.info_outline, text: '${report.additionalInfo}')
                          

                              //TODO: Location widget

                          
                            ]),
                        )
                    ),
                    BottomContactBar()

                  ],
                ),
              );
            },
            error: (error, stackTrace) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Błąd'),
                  content: Text('Something went wrong'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
              context.router.pop();
              return const SizedBox.shrink();

            },
            loading: () => const Center(child: CircularProgressIndicator()),
        )
      ),

    );
  }


}
