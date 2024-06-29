import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({required this.image, super.key});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
          );
        },
      ),
    );
  }
}
