// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GalleryNotifier)
const galleryNotifierProvider = GalleryNotifierProvider._();

final class GalleryNotifierProvider
    extends $AsyncNotifierProvider<GalleryNotifier, List<String>> {
  const GalleryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'galleryNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$galleryNotifierHash();

  @$internal
  @override
  GalleryNotifier create() => GalleryNotifier();
}

String _$galleryNotifierHash() => r'9c186eac6553a309ddcc51745056f8846e1d0470';

abstract class _$GalleryNotifier extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
