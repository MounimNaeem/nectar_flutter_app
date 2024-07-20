import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatefulWidget {
  final String btnText;
  final double? height;
  final double? width;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Function() onTap;
  final TextStyle textStyle;
  final double? radius;
  final Color? bgColor;
  final BorderSide? borderSide;

  const ButtonWidget(
      {this.bgColor,
      this.radius,
      this.height,
      this.borderSide,
      this.width,
      required this.btnText,
      required this.onTap,
      this.horizontalPadding,
      this.verticalPadding,
      required this.textStyle});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  void handleButtonTap() {
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: handleButtonTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: widget.bgColor ?? theme.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          widget.btnText,
          style: widget.textStyle,
        )),
      ),
    );
  }
}
