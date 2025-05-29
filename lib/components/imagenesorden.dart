import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GaleriaImagenes extends StatelessWidget {
  final List<String> imagePaths;

  const GaleriaImagenes({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 3, // número de columnas
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(horizontal: 90),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        final path = imagePaths[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(path, fit: BoxFit.cover),
        );
      },
    );
  }
}
