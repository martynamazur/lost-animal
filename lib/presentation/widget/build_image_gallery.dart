import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import '../../provider/gallery_notifier.dart';
import '../../provider/report_notifier.dart';

class BuildImageGallery extends ConsumerStatefulWidget {
  const BuildImageGallery({super.key});

  @override
  ConsumerState createState() => _BuildImageGalleryState();
}

class _BuildImageGalleryState extends ConsumerState<BuildImageGallery> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final galleryState = ref.watch(galleryNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dodaj zdjęcia',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        galleryState.when(
          data: (imageList) => Wrap(
            spacing: 16,
            runSpacing: 16,
            children: imageList.map((url) => ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                height: 100,
                width: 100,
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: colorScheme.surfaceVariant,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  color: colorScheme.errorContainer,
                  child: Icon(Icons.error, color: colorScheme.onError),
                ),
              ),
            )).toList(),
          ),
          error: (_, __) => Text(
            'Coś poszło nie tak',
            style: TextStyle(color: colorScheme.error),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () async {
            await ref.read(galleryNotifierProvider.notifier).addImage();
            final imageUrls = ref.read(galleryNotifierProvider).asData?.value ?? [];
            developer.log('Image urls $imageUrls');
            ref.read(reportNotifierProvider.notifier).updatePictures(imageUrls);

          },
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            minimumSize: const Size.fromHeight(48),
          ),
          child: Text(
            'Dodaj zdjęcie',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}