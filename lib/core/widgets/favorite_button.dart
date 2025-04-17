import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      padding: const EdgeInsets.all(3),
      icon:
          isFavorite
              ? const Icon(Iconsax.heart_bold, color: Colors.red)
              : const Icon(Iconsax.heart_outline),
    );
  }
}
