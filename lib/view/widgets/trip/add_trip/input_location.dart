import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputLocation extends StatelessWidget {
  const InputLocation({
    super.key,
    required this.hintText,
    required this.icon,
    required this.suffixIcon,
    required this.controller,
    required this.onSave,
    this.keyboardType,
  });

  final String hintText;
  final Widget icon;
  final Widget suffixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function(String?) onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.w,
          child: icon,
        ),
        SizedBox(
          width: 300.w,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.name,
            onFieldSubmitted: onSave,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.transparent,
              hintText: hintText,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: const BorderSide(
                  color: Color(0xFFE1E1E1),
                ),
                gapPadding: 8.r,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: const BorderSide(
                  color: Color(0xFFE1E1E1),
                ),
                gapPadding: 8.r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
