import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/account/model/switch_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchOptionTile extends StatefulWidget {
  final SwitchOption option;

  const SwitchOptionTile({super.key, required this.option});

  @override
  State<SwitchOptionTile> createState() => _SwitchOptionTileState();
}

class _SwitchOptionTileState extends State<SwitchOptionTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.option.value = !widget.option.value;
        });
      },
      minTileHeight: 22,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        widget.option.icon,
        size: 20,
        color: AppColors.kPrimaryColor,
      ),
      title: Text(
        widget.option.title,
        style: TextStyles.bodySmallBold.copyWith(
          color: AppColors.grayscale400,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: widget.option.value,
          activeTrackColor: AppColors.kPrimaryColor,
          onChanged:
              (value) => setState(() {
                widget.option.value = value;
              }),
        ),
      ),
    );
  }
}
