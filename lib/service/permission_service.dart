import 'dart:developer' as developer;

import 'package:permission_handler/permission_handler.dart';

class PermissionService{


  Future<bool> requestPermission(Permission permission) async {

    //await Permission.locationWhenInUse.request();

    final status = await permission.status;
    final showRationale = await permission.shouldShowRequestRationale;

    developer.log('status: $status, showRationale: $showRationale');


    if (status.isDenied && !showRationale) {
      final result = await permission.request();
      developer.log('request() result: $result');
      return result.isGranted;
    }


    if (status.isDenied && showRationale) {
      final result = await permission.request();
      developer.log('request after rationale result: $result');
      return result.isGranted;
    }


    if (status.isPermanentlyDenied) {
      developer.log('permission permanently denied – opening settings');
      await openAppSettings();
      return false;
    }


    if (status.isGranted) return true;

    developer.log('permission not granted: $status');
    return false;
  }


  Future<bool> requestLocation() async {
    return await requestPermission(Permission.location);
  }
}