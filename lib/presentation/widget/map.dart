import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../provider/location_permission_provider.dart';
import '../../provider/reports_notifier.dart';
import '../../service/location_service.dart';

class ReportsMap extends ConsumerStatefulWidget {
  const ReportsMap({super.key});

  @override
  ConsumerState createState() => _MapState();
}

class _MapState extends ConsumerState<ReportsMap> {

  GoogleMapController? _mapController;
  late final Future<LatLng?> _initLocation;

  @override
  void initState() {
    super.initState();
    _initLocation = _getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
    final markers = ref.watch(reportsNotifierProvider.notifier).getReportsMarks();

    return SizedBox(
      height: 400,
      child: FutureBuilder(
        future: _initLocation,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final center = snapshot.data ?? const LatLng(52.2297, 21.0122);
          return GoogleMap(
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
              },
              onMapCreated: (controller) => _mapController = controller,
              initialCameraPosition: CameraPosition(
                target: center,
                zoom: 17,
              ),
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              rotateGesturesEnabled: true,
              tiltGesturesEnabled: true,
              markers: Set.from(markers)

          );
        },

      ),
    );
  }

  Future<LatLng?> _getCurrentLocation() async {
    final granted = await ref.read(permissionServiceProvider).requestLocation();
    if (!granted) return null;

    final pos = await LocationService.getCurrentPositionSafe();
    if (pos == null) return null;

    final loc = LatLng(pos.latitude, pos.longitude);
    return loc;
  }
}
