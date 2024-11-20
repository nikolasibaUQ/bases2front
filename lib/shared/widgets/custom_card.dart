import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.content,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.padding,
    this.boxShadow,
    this.border,
    this.margin,
  });
  final Widget content;
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? margin;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Center(
      child: Container(
        padding: padding,
        margin: margin,
        height: height,
        width: width ?? responsive.wp(85),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            color: color ?? MyColors.darkWhite,
            boxShadow: boxShadow,
            border: border),
        child: content,
      ),
    );
  }
}
