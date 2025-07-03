import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/gallery_notifier.dart';

class BuildImageGallery extends ConsumerStatefulWidget {
  const BuildImageGallery({super.key});

  @override
  ConsumerState createState() => _BuildImageGalleryState();
}

class _BuildImageGalleryState extends ConsumerState<BuildImageGallery> {
  @override
  Widget build(BuildContext context) {
    final galleryState = ref.watch(galleryNotifierProvider);
    return Column(
      children: [
        Text('Add pictures'),
        galleryState.when(
            data: (imageList){
              return ListView.builder(
                  itemCount: imageList.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    final url = imageList[index];
                    return CachedNetworkImage(
                      height: 100,
                      width: 100,
                      imageUrl: url,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  }
              );
            },
            error: (_,_) => Text('something went wrong'),
            loading: () => Center(child: CircularProgressIndicator())
        ),
        OutlinedButton(
            onPressed: () async => await ref.read(galleryNotifierProvider.notifier).addImage(),
            child: Text('Click here')
        )
      ],
    );
  }
}
