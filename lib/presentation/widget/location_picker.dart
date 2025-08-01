import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';
import 'package:lostanimal/provider/report_notifier.dart';
import 'package:lostanimal/service/location_service.dart';

import '../../provider/location_permission_provider.dart';

//TODO: Move logic to Notifier provider
class LocationPicker extends ConsumerStatefulWidget {
  const LocationPicker({ super.key});

  @override
  ConsumerState createState() => _LocationPickerState();
}

class _LocationPickerState extends ConsumerState<LocationPicker> {
  LatLng? _pickedLocation;
  GoogleMapController? _mapController;

  late final Future<LatLng?> _initLocation;
  final TextEditingController _cityController = TextEditingController();

  Set<Marker> _markers = {};
  late final _initialCenter;

  @override
  void initState(){
    super.initState();
    _initLocation = _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Column(
        spacing: 12,
        children: [
          Text('Tap on the map to select a location.', style: Theme.of(context).textTheme.bodyMedium,),
          if (_pickedLocation != null)
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Miasto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: colorScheme.surfaceVariant,
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 400,
              child: FutureBuilder(
                future: _initLocation,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final center = snapshot.data ?? const LatLng(52.2297, 21.0122);
                  return  GoogleMap(
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
            
                      onTap: (position) async{
                        final double lng = position.longitude;
                        final double lat = position.latitude;
                        developer.log('Latifude $lat');
                        developer.log('Long $lng');
                        final cityName = await LocationService.getCityName(lat, lng);
            
            
                        final Marker marker = Marker(
                          markerId: const MarkerId('picked'),
                          position: position
                        );
            
                        _mapController!.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
                        setState(() {
                          _pickedLocation = position;
                          if(cityName != null){
                            setState(() {
                              _cityController.text = cityName;
                              _markers = {marker};
                            });
                          }
                        });
                        if (cityName == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Nie udało się rozpoznać miejscowości')),
                          );
                        }
                        ref.read(reportNotifierProvider.notifier).updateLocation(lat, lng, _cityController.text);
            
                      },
                      markers: _markers
            
                  );
                },
            
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<LatLng?> _getCurrentLocation() async {
    final granted = await ref.read(permissionServiceProvider).requestLocation();
    if (!granted) return null;

    final pos = await LocationService.getCurrentPositionSafe();
    if (pos == null) return null;

    final loc = LatLng(pos.latitude, pos.longitude);
    setState(() {
      _initialCenter = loc;
      _markers.add(Marker(markerId: const MarkerId('user-location'), position: loc));
    });


    final cityName = await LocationService.getCityName(pos.latitude, pos.longitude);
    if (cityName != null) {
      ref.read(reportNotifierProvider.notifier).updateLocation(pos.latitude,pos.longitude, cityName);
      developer.log('City name getCurrentLoc $cityName');
    }
    return loc;
  }


}
