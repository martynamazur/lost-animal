import 'package:lostanimal/service/permission_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_permission_provider.g.dart';

@riverpod
PermissionService permissionService(Ref ref) {
  return PermissionService() ;
}
