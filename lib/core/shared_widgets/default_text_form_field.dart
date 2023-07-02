import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  TextEditingController controller;
  final String? lable;
  final bool? isPassword;
  final double? height;
  final TextInputAction? buttonInputStyle;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;
  final bool? fillTextFormField;
  DefaultTextFormField({
    super.key,
    required this.controller,
    this.lable,
    this.height,
    this.isPassword,
    this.buttonInputStyle,
    this.keyboardType,
    this.suffixIcon,
    this.fillTextFormField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable ?? "",
          style: context.textList.displayMedium!.copyWith(
            color: AppColors.blackTextColor,
            fontSize: 16,
            fontFamily: 'customArabic',
          ),
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword ?? false,
            style: context.textList.bodySmall!.copyWith(
              color: context.isDarkMode
                  ? AppColors.blackTextColor
                  : AppColors.whiteColor,
              fontFamily: 'customArabic',
            ),
            textInputAction: buttonInputStyle,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
            ),
          ),
        ),
        SizedBox(
          height: height ?? context.height * 0.02,
        ),
      ],
    );
  }
}
