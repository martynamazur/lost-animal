import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/permission_service.dart';

part 'location_permission_provider.g.dart';

@riverpod
PermissionService permissionService(Ref ref) {
  return PermissionService();
}
