import 'package:flutter/material.dart';
import 'package:movie_line/src/class/hymn.dart';

class FavoriteIcon extends StatelessWidget {
  final Hymn hymn;

  const FavoriteIcon({super.key, required this.hymn});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        hymn.favorite ? Icons.favorite : Icons.favorite_border,
        size: 30,
        color: Colors.red,
      ),
      onPressed: () {
        // Aquí va la lógica para cambiar el estado de favorito del himno
      },
    );
  }
}
