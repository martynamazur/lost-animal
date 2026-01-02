import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/features/reports/report_details/presentation/pet_information_section.dart';
import 'package:lostanimal/shared/widgets/info_container.dart';
import 'package:lostanimal/shared/widgets/loading_state.dart';
import 'package:lostanimal/shared/widgets/error_state.dart';
import 'package:lostanimal/shared/widgets/contact_bar_container.dart';
import 'package:lostanimal/features/gallery/widgets/image_gallery.dart';
import 'package:lostanimal/features/reports/widgets/report_status_badge.dart';
import 'package:lostanimal/features/reports/report_details/provider/report_details_notifier.dart';

@RoutePage()
class ReportDetailsScreen extends ConsumerStatefulWidget {
  final String reportId;
  final String reportAuthorDisplayName;

  const ReportDetailsScreen(
    this.reportId,
    this.reportAuthorDisplayName, {
    super.key,
  });

  @override
  ConsumerState createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends ConsumerState<ReportDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reportState = ref.watch(
      reportDetailsNotifierProvider(widget.reportId),
    );
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Report Details'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      body: SafeArea(
        child: reportState.when(
          data: (report) {
            if (report == null) {
              return ErrorState(
                message: 'Report not found',
                onRetry: () => context.router.pop(),
                retryButtonText: 'Go Back',
              );
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReportStatusBadge(type: report.type.name),

                        const SizedBox(height: 20),

                        if (report.pictures.isNotEmpty) ...[
                          ImageGallery(imageUrls: report.pictures),
                          const SizedBox(height: 24),
                        ],

                        PetInformationSection(
                          hasChip: report.hasChip ?? false,
                          category: report.category.name,
                          reward: report.reward.toString(),
                          missingSince: report.missingSince,
                        ),

                        if (report.coloration.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          InfoContainer(
                            icon: Icons.color_lens,
                            sectionTitle: 'Description',
                            content: report.coloration,
                            iconColor: theme.colorScheme.primary,
                          ),
                        ],

                        const SizedBox(height: 12),

                        if (report.additionalInfo.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          InfoContainer(
                            icon: Icons.info_outline,
                            sectionTitle: 'Additional Information',
                            content: report.additionalInfo,
                            iconColor: theme.colorScheme.secondary,
                          ),
                        ],
                        const SizedBox(height: 24),

                        InfoContainer(
                          icon: Icons.location_on_outlined,
                          sectionTitle: 'Location',
                          content: 'Location details coming soon',
                          iconColor: theme.colorScheme.primary,
                        ),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),

                if (currentUserId != report.userId)
                  ContactBarContainer(
                    reportId: widget.reportId,
                    authorId: report.userId,
                    displayNameAuthor: report.reportAuthorDisplayName,
                    isEnabled: true,
                  ),
              ],
            );
          },
          error: (error, stackTrace) => ErrorState(
            message: error.toString(),
            onRetry: () => context.router.pop(),
            retryButtonText: 'Go Back',
          ),
          loading: () =>
              const LoadingState(message: 'Loading report details...'),
        ),
      ),
    );
  }
}
