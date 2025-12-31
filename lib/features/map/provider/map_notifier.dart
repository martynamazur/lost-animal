import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/report_model.dart';
import '../../../shared/utils/marker_utils.dart';
import '../../reports/provider/reports_notifier.dart';

part 'map_notifier.g.dart';

/*
State as what ?
List of Markers ?
build fetching only report list from another notifier ?
 */

@riverpod
class MapNotifier extends _$MapNotifier {
  double _currentZoom = 10.0;

  @override
  FutureOr<List<Marker>> build() async {
    final reports = await ref.watch(reportsNotifierProvider.future);
    return _createMarkers(reports.reports);
  }

  Future<List<Marker>> _createMarkers(List<Report> reports) async {
    return await Future.wait(
      reports.map((report) async {
        final hasImage = report.pictures.isNotEmpty;

        BitmapDescriptor markerColor = BitmapDescriptor.defaultMarkerWithHue(
          report.type == 'seen'
              ? BitmapDescriptor.hueBlue
              : BitmapDescriptor.hueRose,
        );

        BitmapDescriptor markerIcon;
        if (hasImage) {
          try {
            markerIcon = await createCustomMarkerWithRoundedImage(
              report.type,
              report.pictures.first,
            );
          } catch (_) {
            markerIcon = markerColor; // fallback
          }
        } else {
          markerIcon = markerColor;
        }

        return Marker(
          markerId: MarkerId(report.id!),
          position: LatLng(report.latitude!, report.longitude!),
          infoWindow: InfoWindow(
            title: report.type,
            snippet: report.cityName ?? '',
          ),
          icon: markerIcon,
        );
      }),
    );
  }

  /*
  void updateZoomLevel(double zoom) {
    _currentZoom = zoom;
    _generateMarkers();
  }

  int _getIconSizeForZoom(double zoom) {
    if (zoom < 8) return 30;   // daleko → bardzo małe
    if (zoom < 12) return 50;  // średnie
    return 100;                // blisko → duże
  }

   */

  /// Dodaje jeden nowy marker do istniejącej listy
  Future<void> addMarker(Report report) async {
    final currentMarkers = state.value ?? [];
    final newMarker = (await _createMarkers([report])).first;

    state = AsyncValue.data([...currentMarkers, newMarker]);
  }

  /// Odświeża markery z nowymi raportami (np. po filtrach)
  Future<void> refreshMarkers(List<Report> reports) async {
    state = const AsyncValue.loading();
    final newMarkers = await _createMarkers(reports);
    state = AsyncValue.data(newMarkers);
  }
}
