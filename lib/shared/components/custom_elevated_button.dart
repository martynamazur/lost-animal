import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final Size? minimumSize;
  final TextStyle? textStyle;
  final Widget? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.minimumSize,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        minimumSize: minimumSize ?? const Size(88, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        textStyle: textStyle,
      ),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [icon!, const SizedBox(width: 8), Text(text)],
            )
          : Text(text),
    );
  }
}
