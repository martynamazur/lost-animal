import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? minimumSize;
  final TextStyle? textStyle;
  final Widget? icon;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.minimumSize,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isEnabled ? onPressed : null,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
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
