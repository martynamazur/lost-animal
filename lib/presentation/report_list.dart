import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/report_list_tile.dart';
import 'package:lostanimal/provider/user_missing_reports_notifier.dart';

import '../model/report.dart';

class ReportList extends ConsumerWidget {
  final AsyncValue list;
  const ReportList(this.list, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: list.when(
              data: (reports){
                if(reports.isNotEmpty){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.separated(
                      itemCount: reports.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        final report = reports[index];
                        final myReport = ReportMissing(
                          category: report.category,
                          hasChip: report.hasChip,
                          missingSince: report.missingSince,
                          pictures: report.pictures,
                        );
                        return ListReportTile(myReport);
                      }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 12);
                    },
                    ),
                  );
                }else{
                  return Center(child: Text('Empty'));
                }
              },
              error: (_,_) => Text('Something went wrong'),
              loading: () => Center(child:CircularProgressIndicator())
          )
      ),
    );
  }
}
