import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputOutline extends StatelessWidget {
  const InputOutline({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.obscureText,
    this.keyboardType,
    this.readOnly,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String title;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final String? Function(String? value)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder normalBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 75.h,
          child: TextFormField(
            obscureText: obscureText ?? false,
            enableInteractiveSelection: true,
            enabled: true,
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            onTap: onTap,
            keyboardType: keyboardType,
            focusNode: focusNode,
            readOnly: readOnly != null ? readOnly! : false,
            maxLines: maxLines,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              alignLabelWithHint: true,
              filled: true,
              fillColor: const Color(0xFFF0F1F5),
              border: normalBorder,
              enabledBorder: normalBorder,
              focusedBorder: normalBorder,
              errorBorder: normalBorder,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 15.w,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.7),
              ),
              prefixIcon: prefixIcon,
              prefixIconConstraints: BoxConstraints(
                maxHeight: 42.h,
                maxWidth: 42.h,
              ),
              suffixIcon: suffixIcon,
              suffixIconConstraints: BoxConstraints(
                maxHeight: 42.h,
                maxWidth: 42.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
