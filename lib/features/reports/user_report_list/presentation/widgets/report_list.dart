import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../shared/models/report_model.dart';
import '../../../../../shared/report_list_tile_skeleton.dart';
import 'report_list_tile.dart';

class ReportList extends ConsumerWidget {
  final AsyncValue list;
  final ScrollController? controller;

  ReportList(this.list, this.controller, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: list.when(
          data: (reports) {
            if (reports.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  controller: controller,
                  itemCount: reports.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Report report = reports[index];
                    return ListReportTile(report);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 12);
                  },
                ),
              );
            } else {
              return Center(child: Text('Empty'));
            }
          },
          error: (_, _) => Text('Something went wrong'),
          loading: () {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                controller: controller,
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const ListReportTileSkeleton();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 12);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
