import 'dart:developer' as developer;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../map/provider/location_permission_provider.dart';
import '../../map/widgets/map.dart';

import '../../reports/shared/widgets/filters.dart';
import '../../reports/user_report_list/presentation/widgets/report_list.dart';

import '../provider/reports_notifier.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _askPermission();
  }

  @override
  Widget build(BuildContext context) {
    final reports = ref.watch(reportsNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ReportsMap(),
            DraggableScrollableSheet(
              initialChildSize: 0.60,
              minChildSize: 0.1,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return Material(
                  color: Theme.of(context).colorScheme.surface,
                  elevation: 2,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 8, bottom: 8),
                              width: 40,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Filters(),
                          ],
                        ),
                      ),

                      SliverFillRemaining(
                        child: ReportList(
                          reports.whenData((state) => state.reports),
                          scrollController,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _askPermission() async {
    final perms = ref.read(permissionServiceProvider);
    final granted = await perms.requestLocation();
    if (!granted && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lokalizacja wymagana do mapy')),
      );
    }
  }
}
