import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/model/report_missing_model.dart';
import 'package:lostanimal/model/report_seen_model.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';

import '../../model/report.dart';

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
    final hasPicture = widget.report.pictures != null && widget.report.pictures!.isNotEmpty;

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
              imageUrl: widget.report.pictures![0],
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
                Text(widget.report.type),
                Text(widget.report.category.toString()),
                Text(widget.report.missingSince.toString()),
                Text('Chip : ${widget.report.hasChip}'),
                Text('Localization : ${widget.report.cityName}'),

                if(widget.report.reward != null)
                  Text('Reward: ${widget.report.reward}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
