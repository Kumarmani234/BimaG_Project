// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderTextField extends StatelessWidget {
  String titleText, hintText;
  final onValidate, onChange, onEditingComplete;
  TextEditingController controller;
  final Color borderColor;
  TextInputType? textInputType;
  int? maxLength, minLine, maxLine;
  bool? obscureText;
  bool? enabled;
  bool isDark;
  bool? readOnly;
  Widget? prefixIcon;
  Widget? suffixIcon;
  double? spacing;
  List<TextInputFormatter>? inputFormatters;
  TextCapitalization? textCapitalization;
  bool isfill;

  final onTap;
  String? suffixText;

  BorderTextField(
      {required this.hintText,
      required this.titleText,
      this.onValidate,
      required this.controller,
      this.borderColor = const Color.fromRGBO(132, 132, 147, 1.0),
      this.textInputType,
      this.maxLength,
      this.isDark = false,
      this.obscureText,
      this.onChange,
      this.onEditingComplete,
      this.prefixIcon,
      this.spacing,
      this.suffixIcon,
      this.minLine,
      this.maxLine,
      this.enabled,
      this.inputFormatters,
      this.onTap,
      this.readOnly,
      this.suffixText,
      this.textCapitalization,
      this.isfill = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (titleText.isNotEmpty)
          Text(
            titleText,
            style: Ts.regular12(AppColors.grey5),
          ),
        if (titleText.isNotEmpty)
          SizedBox(
            height: spacing ?? 10.h,
          ),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly ?? false,
          inputFormatters: inputFormatters,
          controller: controller,
          validator: onValidate,
          onEditingComplete: onEditingComplete,
          maxLength: maxLength ?? 30,
          minLines: minLine ?? 1,
          maxLines: maxLine ?? 1,
          enabled: enabled ?? true,
          keyboardType: textInputType ?? TextInputType.text,
          obscureText: obscureText ?? false,
          style: Ts.medium15(AppColors.secondaryColor),
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          onChanged: onChange,
          decoration: InputDecoration(
              hintText: hintText,
              counterText: '',
              prefixIcon: prefixIcon,
              hintStyle: Ts.regular15(AppColors.grey4),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: borderColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: borderColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              fillColor: isfill ? AppColors.white : Colors.transparent,
              filled: isfill,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              suffixIcon: suffixIcon,
              suffixText: suffixText),
        ),
      ],
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

class form_field_with_btn extends StatelessWidget {
  const form_field_with_btn({
    super.key,
    required this.field_label,
    required this.hint_text,
    this.onValidate,
  });
  final String field_label;
  final String hint_text;
  final onValidate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              field_label,
              style: Ts.regular12(
                AppColors.grey5,
              ),
            ),
            Spacer(),
            Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Don\'t Know Pincode',
                    style: Ts.regular14(AppColors.primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        SizedBox(
          child: TextFormField(
            validator: onValidate,
            decoration: InputDecoration(
              hintStyle: Ts.medium15(AppColors.secondaryColor),
              contentPadding: EdgeInsets.only(left: 10.w),
              hintText: hint_text,
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 14.h, right: 5.w),
                child: Text(
                  'Sirsi, Rajasthan, India',
                  style: Ts.regular14(AppColors.grey5),
                ),
              ),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey4,
                  width: 1.w,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
