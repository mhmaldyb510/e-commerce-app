import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class PriceFilterBottomSheet extends StatefulWidget {
  const PriceFilterBottomSheet({super.key});

  @override
  State<PriceFilterBottomSheet> createState() => _PriceFilterBottomSheetState();
}

class _PriceFilterBottomSheetState extends State<PriceFilterBottomSheet> {
  final double minPrice = 0;
  final double maxPrice = 300;
  double _startValue = 0;
  double _endValue = 300;
  final TextEditingController _minController = TextEditingController(text: "0");
  final TextEditingController _maxController = TextEditingController(
    text: "300",
  );

  double _calculateLabelPosition(
    double value,
    double min,
    double max,
    BuildContext context,
  ) {
    // Get available width for the slider (accounting for padding)
    double availableWidth =
        MediaQuery.of(context).size.width - 76; // 20px padding on each side

    // Calculate position percentage
    double percentage = (value - min) / (max - min);

    // Calculate position
    double position = percentage * availableWidth;

    // Adjust to center the label on the thumb
    // Subtract half the estimated text width
    return position;
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 25),
          Divider(
            color: const Color(0xff131F46),
            thickness: 3,
            indent: MediaQuery.of(context).size.width / 2 - 60,
            endIndent: MediaQuery.of(context).size.width / 2 - 60,
          ),
          const SizedBox(height: 7),
          Text(
            S.of(context).filterBy,
            style: TextStyles.bodyLargeBold.copyWith(
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),

          const SizedBox(height: 19),

          // Price label
          Row(
            children: [
              const Icon(Iconsax.tag_outline, color: AppColors.kPrimaryColor),
              const SizedBox(width: 8),
              Text(
                S.of(context).price,
                style: TextStyles.bodySmallBold.copyWith(
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Min and Max price text fields
          Row(
            children: [
              // Min price field
              Expanded(
                child: TextField(
                  controller: _minController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    double newValue = double.parse(value.isEmpty ? '0' : value);
                    if (newValue <= _endValue && newValue >= minPrice) {
                      setState(() {
                        _startValue = newValue;
                      });
                    } else {
                      _minController.text = _startValue.toInt().toString();
                    }
                  },
                ),
              ),

              const SizedBox(width: 14),

              // To label
              Text(
                S.of(context).to,
                style: TextStyles.bodyLargeBold.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),

              const SizedBox(width: 14),

              // Max price field
              Expanded(
                child: TextField(
                  controller: _maxController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    double newValue = double.parse(value.isEmpty ? '0' : value);
                    if (newValue >= _startValue && newValue <= maxPrice) {
                      setState(() {
                        _endValue = newValue;
                      });
                    } else {
                      _maxController.text = _endValue.toInt().toString();
                    }
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Range labels and slider
          SizedBox(
            height: 22,
            child: Stack(
              children: [
                Positioned(
                  left:
                      Intl.getCurrentLocale() == 'ar'
                          ? null
                          : _calculateLabelPosition(
                                _startValue,
                                minPrice,
                                maxPrice,
                                context,
                              ) +
                              40,
                  right:
                      Intl.getCurrentLocale() == 'ar'
                          ? _calculateLabelPosition(
                                _startValue,
                                minPrice,
                                maxPrice,
                                context,
                              ) +
                              10
                          : null,
                  child: Text(
                    '\$${_startValue.toInt()}',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left:
                      Intl.getCurrentLocale() == 'ar'
                          ? null
                          : _calculateLabelPosition(
                            _endValue,
                            minPrice,
                            maxPrice,
                            context,
                          ),
                  right:
                      Intl.getCurrentLocale() == 'ar'
                          ? _calculateLabelPosition(
                            _endValue,
                            minPrice,
                            maxPrice,
                            context,
                          )
                          : null,

                  child: Text(
                    '\$${_endValue.toInt()}',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: Colors.green[800],
              inactiveTrackColor: Colors.green[100],
              thumbColor: Colors.green[800],
              overlayColor: Colors.green.withValues(alpha: 32),
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
              rangeThumbShape: const RoundRangeSliderThumbShape(
                enabledThumbRadius: 8,
              ),
              rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
              rangeValueIndicatorShape:
                  const PaddleRangeSliderValueIndicatorShape(),
            ),
            child: RangeSlider(
              min: minPrice,
              max: maxPrice,
              values: RangeValues(_startValue, _endValue),
              onChanged: (RangeValues values) {
                setState(() {
                  _startValue = values.start;
                  _endValue = values.end;
                  _minController.text = _startValue.toInt().toString();
                  _maxController.text = _endValue.toInt().toString();
                });
              },
            ),
          ),

          const SizedBox(height: 19),

          // Apply filter button
          CustomButton(
            text: S.of(context).filter,
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
