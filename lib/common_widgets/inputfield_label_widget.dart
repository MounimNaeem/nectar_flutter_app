import 'package:flutter/material.dart';
import 'package:grocery_app/theme/font_styles/light_font_style/light_font_style.dart';

class InputFieldLabel extends StatelessWidget {
  final String text;

  const InputFieldLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: glorySemiBold.copyWith(
           color: theme.hintColor),
    );
  }
}
