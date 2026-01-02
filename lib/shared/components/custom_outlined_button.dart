import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final Size? minimumSize;
  final TextStyle? textStyle;
  final Widget? icon;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth,
    this.minimumSize,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: isEnabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        minimumSize: minimumSize ?? const Size(88, 36),
        side: BorderSide(
          color: borderColor ?? theme.colorScheme.outline,
          width: borderWidth ?? 1.0,
        ),
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
