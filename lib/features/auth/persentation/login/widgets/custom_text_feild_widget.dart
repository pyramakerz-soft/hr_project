import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class CustomFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.atendanceGreyDark,
        ),
        fillColor: AppColors.atendanceGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20.0,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.atendanceGreyDark,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
