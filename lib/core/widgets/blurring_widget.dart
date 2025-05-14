import 'dart:ui';

import 'package:flutter/material.dart';

class BlurringWidget extends StatelessWidget {
  const BlurringWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        color: Colors.black.withAlpha(0), // Transparent overlay
      ),
    );
  }
}
