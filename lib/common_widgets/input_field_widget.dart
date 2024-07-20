import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/theme/font_styles/light_font_style/light_font_style.dart';
import 'package:grocery_app/theme/light_base_theme.dart';

class InputField extends StatefulWidget {
  final String? hint;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final String? prefixImage;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscure;
  final bool? enable;
  final bool? readOnlyField;
  final bool? textAlignCenter;
  final int? maxLines;
  final FocusNode? focusNode;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool? verticalAlign;
  final bool? isDecorationEnable;
  final bool? isUnderLineBorder;
  final Color? borderColor;
  final Color? focusColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final double borderRadius;
  final Widget? suffixWidget;
  final Function(String)? onSubmit;
  final int? maxLength;
  final EdgeInsetsDirectional? contentPadding;
  final double borderWidth;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final BoxConstraints? suffixBoxConstraints;

  const InputField(
      {super.key,
      this.focusNode,
      this.suffixBoxConstraints,
      this.isDecorationEnable = true,
      this.verticalAlign = false,
      this.prefixWidget,
      this.hint,
      this.prefixImage,
      this.prefixIcon,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.enable = true,
      this.readOnlyField,
      this.textAlignCenter = false,
      this.maxLines,
      this.borderColor,
      this.focusColor = inputFieldBorderColor,
      this.onChange,
      this.inputFormatters,
      this.textInputAction = TextInputAction.done,
      this.onTap,
      this.borderRadius = 100,
      this.suffixWidget,
      this.validator,
      this.maxLength,
      this.contentPadding,
      this.onSubmit,
      this.borderWidth = 2.0,
      this.textStyle,
      this.fillColor,
      this.isUnderLineBorder,
      this.hintStyle});

  @override
  _AuthInputFieldState createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<InputField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscure!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      readOnly:
          (widget.readOnlyField != null) ? widget.readOnlyField! : false,
      focusNode: widget.focusNode,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmit,
      maxLength: widget.maxLength,
      cursorColor: Theme.of(context).primaryColor,
      maxLines: widget.maxLines ?? 1,
      onChanged: widget.onChange,
      enabled: widget.enable,
      controller: widget.controller,
      textAlign:
          widget.textAlignCenter == true ? TextAlign.center : TextAlign.start,
      onTap: widget.onTap,
      textAlignVertical: (obscure)
          ? (widget.controller!.text.isNotEmpty)
              ? TextAlignVertical.bottom
              : TextAlignVertical.center
          : TextAlignVertical.center,
      style:
          widget.textStyle ?? placeHolderStyle14.copyWith(color: blackColor),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: obscure,
      obscuringCharacter: '*',
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        // label: Text('Email'),
        focusColor: primaryColor,
        hintText: widget.hint,
        counterText: "",
        isDense: true,
        hintStyle: widget.hintStyle ?? placeHolderStyle14.copyWith(color: Theme.of(context).hintColor),
        // Theme.of(context).textTheme.titleLarge!.copyWith(
        //     color: darkThemeTextLightColor, fontWeight: FontWeight.w400,),
        // isCollapsed: true,
        //contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        contentPadding:
        // (obscure)
        //     ? (widget.controller!.text.isNotEmpty)
        //         ? const EdgeInsets.only(bottom: 9, left: 15, right: 15)
        //         : const EdgeInsets.symmetric(vertical: 17, horizontal: 15)
        //     :
        widget.contentPadding ??
                const EdgeInsets.symmetric(vertical: 17, horizontal: 0),
        filled: true,
        fillColor: widget.fillColor ?? Colors.transparent,
        border: widget.isDecorationEnable ?? false
            ? widget.isUnderLineBorder ?? false
                ? underLineBorder()
                : inputBorder(color: inputFieldBorderColor)
            : InputBorder.none,
        enabledBorder: widget.isDecorationEnable ?? false
            ? widget.isUnderLineBorder ?? false
                ? underLineBorder()
                : inputBorder(color: inputFieldBorderColor)
            : InputBorder.none,
        errorBorder: widget.isDecorationEnable ?? false
            ? widget.isUnderLineBorder ?? false
                ? underLineBorder()
                : inputBorder(color: inputFieldBorderColor)
            : InputBorder.none,
        focusedErrorBorder: widget.isUnderLineBorder ?? false
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1,
                )),
        focusedBorder: widget.isUnderLineBorder ?? false
            ? underLineFocusBorder(color: primaryColor)
            : inputFocusBorder(color: primaryColor),
        disabledBorder: widget.isDecorationEnable ?? false
            ? inputBorder(color: inputFieldBorderColor)
            : InputBorder.none,
        prefixIconConstraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width * 0.5,
          maxWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        suffixIconConstraints:
            widget.suffixWidget == null && widget.obscure == false
                ? BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.width * 0.5,
                    maxWidth: MediaQuery.of(context).size.width * 0.5,
                  )
                : widget.suffixBoxConstraints != null
                    ? widget.suffixBoxConstraints
                    : null,
        prefixIcon: widget.prefixWidget ??
            (widget.prefixIcon != null
                ? Container(
                    height: 24.sp,
                    width: 24.sp,
                    margin: const EdgeInsets.only(right: 4, left: 15),
                    child: Icon(
                      widget.prefixIcon,
                      color: Theme.of(context).indicatorColor,
                    ),
                  )
                : widget.prefixImage != null
                    ? Container(
                        height: 24.sp,
                        width: 24.sp,
                        margin: const EdgeInsetsDirectional.only(
                            end: 15, start: 15),
                        child: SvgPicture.asset(
                          widget.prefixImage!,
                        ))
                    : null),
        suffixIcon: widget.suffixWidget != null
            ? Container(
                margin: const EdgeInsetsDirectional.only(end: 0),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: widget.suffixWidget,
              )
            : (widget.obscure == false
                ? const SizedBox()
                : InkWell(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: obscure
                        ?  Icon(
                            Icons.visibility_off_outlined,
                            color: Theme.of(context).hintColor,
                          )
                        :  Icon(Icons.visibility_outlined,
                            color: Theme.of(context).hintColor,),

                    /// use this code if we use custom icon
                    // Container(
                    //   height: 8,
                    //   width: 10,
                    //   margin: const EdgeInsets.only(right: 12),
                    //   child: Center(
                    //     child: SvgPicture.asset(
                    //       obscure ? "assets/email.svg" : "assets/open_eye.svg",
                    //       width: 16,
                    //     ),
                    //   ),
                    // ),
                  )),
      ),
    );
  }

  inputBorder({Color? color}) {
    return UnderlineInputBorder(
        // borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: widget.borderColor ?? color ?? inputFieldBorderColor,
          width: widget.borderWidth,
        ));
  }

  errorBorder({Color? color}) {
    return UnderlineInputBorder(
        // borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: widget.borderColor ?? color ?? Colors.transparent,
          width: 1,
        ));
  }

  underLineBorder({Color? color}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).dividerColor),
    );
  }

  // underLineErrorBorder({Color? color}){
  //   return UnderlineInputBorder()
  // }

  underLineFocusBorder({Color? color}) {
    return UnderlineInputBorder(
        //borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
      color: widget.focusColor ?? Colors.transparent,
      width: widget.borderWidth,
    ));
  }

  inputFocusBorder({Color? color}) {
    return UnderlineInputBorder(
        // borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: widget.focusColor ?? inputFieldBorderColor,
          width: widget.borderWidth,
        ));
  }
}
