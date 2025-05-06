import 'package:e_commerce_app/core/cubits/modal_buttom_sheet_cubit/modal_bottom_sheet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageFallScreen extends StatefulWidget {
  final String image;
  const ImageFallScreen({super.key, required this.image});

  @override
  State<ImageFallScreen> createState() => _ImageFallScreenState();
}

class _ImageFallScreenState extends State<ImageFallScreen> {
  TransformationController controller = TransformationController();
  TapDownDetails? _doubleTapDetails;

  late ModalBottomSheetCubit _modalBottomSheetCubit;

  @override
  void didChangeDependencies() {
    _modalBottomSheetCubit = BlocProvider.of<ModalBottomSheetCubit>(context);
    _modalBottomSheetCubit.updateModalSheetState(true);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _modalBottomSheetCubit.updateModalSheetState(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      onDoubleTapDown: (details) {
        _doubleTapDetails = details;
      },
      onDoubleTap: () {
        if (controller.value != Matrix4.identity()) {
          controller.value = Matrix4.identity();
        } else {
          final position = _doubleTapDetails!.localPosition;
          final scale = 2.0;

          final x = -position.dx * (scale - 1);
          final y = -position.dy * (scale - 1);

          controller.value =
              Matrix4.identity()
                ..translate(x, y)
                ..scale(scale);
        }
      },
      child: InteractiveViewer(
        transformationController: controller,
        child: Hero(tag: widget.image, child: Image.network(widget.image)),
      ),
    );
  }
}
