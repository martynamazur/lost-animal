import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/shared/models/animal_category.dart';
import 'package:lostanimal/shared/models/report_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lostanimal/shared/utils/format_data.dart';

import '../../../../../core/router/app_router.dart';

class ListReportTile extends ConsumerStatefulWidget {
  final Report report;
  final void Function()? addToFavourite;
  const ListReportTile(this.report, {this.addToFavourite, super.key});

  @override
  ConsumerState createState() => _ListReportTileState();
}

class _ListReportTileState extends ConsumerState<ListReportTile> {
  @override
  Widget build(BuildContext context) {
    final hasPicture = widget.report.pictures.isNotEmpty;

    return InkWell(
      onTap: () => context.router.push(
        ReportDetailsRoute(
          reportId: widget.report.id!,
          reportAuthorDisplayName: widget.report.reportAuthorDisplayName,
        ),
      ),
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            spacing: 16,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: hasPicture
                    ? CachedNetworkImage(
                        imageUrl: widget.report.pictures[0],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        child: const Icon(
                          Icons.photo,
                          color: Colors.grey,
                          size: 48,
                        ),
                      ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: widget.report.type == 'missing'
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          child: Text(
                            widget.report.type.name,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),

                        if (widget.report.category != AnimalCategory.unknown)
                          Text(
                            widget.report.category.name.toUpperCase(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                      ],
                    ),

                    _infoRow(
                      Icons.timelapse_sharp,
                      formatDate(widget.report.missingSince),
                    ),

                    if (widget.report.hasChip != null)
                      _infoRow(
                        FontAwesomeIcons.microchip,
                        'Chip: ${widget.report.hasChip! ? "Yes" : "No"}',
                      ),

                    if (widget.report.cityName?.isNotEmpty == true)
                      _infoRow(Icons.location_on, widget.report.cityName!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      spacing: 4,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
