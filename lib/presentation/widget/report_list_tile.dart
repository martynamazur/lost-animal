import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';

import '../../model/animal_category.dart';
import '../../model/report_model.dart';

class ListReportTile extends ConsumerStatefulWidget {
  final Report report;
  final void Function()? addToFavourite;
  const ListReportTile(this.report,{this.addToFavourite, super.key});

  @override
  ConsumerState createState() => _ListReportTileState();
}

class _ListReportTileState extends ConsumerState<ListReportTile> {

  @override
  Widget build(BuildContext context) {
    final hasPicture = widget.report.pictures.isNotEmpty;

    return Container(
      decoration: inputBorder,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 8,
          children: [
            hasPicture ?
            CachedNetworkImage(
              height: 100,
              width: 100,
              imageUrl: widget.report.pictures[0],
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fitWidth,
            )
                : Container(
              height: 100,
              width: 100,
              color: Colors.grey[300],
              child: const Icon(Icons.photo, color: Colors.grey),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.report.type.isNotEmpty) Text(widget.report.type),
                if (widget.report.category != AnimalCategory.unknown) Text(widget.report.category.toString()),
                Text(widget.report.missingSince.toString()),
                if (widget.report.hasChip != null) Text('Chip: ${widget.report.hasChip! ? "Tak" : "Nie"}'),
                if (widget.report.cityName?.isNotEmpty == true) Text('Lokalizacja: ${widget.report.cityName}'),

              ],
            )
          ],
        ),
      ),
    );
  }
}
