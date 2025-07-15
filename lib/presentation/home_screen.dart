import 'dart:developer' as developer;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/report_list.dart';
import 'package:lostanimal/presentation/widget/map.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';
import 'package:lostanimal/provider/location_permission_provider.dart';


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
    final categoryName = ref.watch(reportsNotifierProvider.notifier).currentCategory;
    final isAscending = ref.watch(reportsNotifierProvider.notifier).currentToggle;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ReportsMap(),
            Expanded(
              child: DraggableScrollableSheet(
                initialChildSize: 0.60,
                minChildSize: 0.1,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          width: 40,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),

                        //FILTRY
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                decoration: inputBorder,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(categoryName != null ? categoryName.toString() : 'All categories'),
                                  )),

                              Container(
                                decoration: inputBorder,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Newest first'),
                                  )),
                              IconButton(onPressed: () async{
                                  ref.read(reportsNotifierProvider.notifier).toggleSortOrder();
                                  developer.log('Is Ascending $isAscending');
                                },
                                  icon: Icon( isAscending ?  Icons.arrow_upward : Icons.arrow_downward)
                              ),


                              Icon(Icons.filter_list_alt)

                            ],
                          ),
                        ),
                        // Lista zgłoszeń
                        Expanded(
                          child: ReportList(
                              reports.whenData((state) => state.reports),
                              scrollController
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
