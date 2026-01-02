import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
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
  final bool underline;

  const CustomTextButton({
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
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled ? onPressed : null,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minimumSize: minimumSize ?? const Size(64, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        textStyle: textStyle?.copyWith(
          decoration: underline ? TextDecoration.underline : null,
        ),
      ),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon!,
                const SizedBox(width: 8),
                Text(
                  text,
                  style: underline
                      ? const TextStyle(decoration: TextDecoration.underline)
                      : null,
                ),
              ],
            )
          : Text(
              text,
              style: underline
                  ? const TextStyle(decoration: TextDecoration.underline)
                  : null,
            ),
    );
  }
}
