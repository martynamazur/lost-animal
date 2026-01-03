import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.status;
    final showRationale = await permission.shouldShowRequestRationale;

    if (status.isDenied && !showRationale) {
      final result = await permission.request();
      return result.isGranted;
    }

    if (status.isDenied && showRationale) {
      final result = await permission.request();
      return result.isGranted;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    if (status.isGranted) return true;

    return false;
  }

  Future<bool> requestLocation() async {
    return await requestPermission(Permission.location);
  }
}
