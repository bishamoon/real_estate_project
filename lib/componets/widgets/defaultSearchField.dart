import 'package:flutter/material.dart';
import 'package:real_estate/componets/appColors.dart';

Widget defaultSearchField({
  required String hintText,
  required TextEditingController controller,
  String? initialValue,
  TextAlign textAlign = TextAlign.start,
  TextDirection? textDirection,
  TextInputType? keyboardType,
  bool obscureText = false,
  bool readOnly = false,
  bool enableInteractiveSelection = true,
  bool? enabled = true,
  required String? Function(String?) validator,
  Function(String)? onChanged,
  ValueChanged<String>? onFieldSubmitted,
  VoidCallback? onTap,
  double? width,
  double? height,
  double borderRadius = 10,
  Widget? prefix,
  Widget? suffix,
  int? minLines,
  int? maxLines,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white),
      child: TextFormField(
        textAlign: textAlign,
        textDirection: textDirection,
        minLines: minLines,
        maxLines: maxLines,
        initialValue: initialValue,
        readOnly: readOnly,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        // cursorHeight: 20,
        autofocus: false,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        enableInteractiveSelection: enableInteractiveSelection,
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: prefix,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.gray,
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
          ),
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          //! add the fixed border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide:
                BorderSide(color: Colors.white, width: 2), //<-- SEE HERE
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide:
                BorderSide(color: Colors.white, width: 2), //<-- SEE HERE
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                color: AppColors.primaryColor, width: 2), //<-- SEE HERE
          ),
        ),
      ),
    ),
  );
}
