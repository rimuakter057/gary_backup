// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../utils/app_colors/app_colors.dart';
//
// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     super.key,
//     this.inputFormatters,
//     this.onFieldSubmitted,
//     this.textEditingController,
//     this.focusNode,
//     this.keyboardType = TextInputType.text,
//     this.textInputAction = TextInputAction.next,
//     this.cursorColor = AppColors.black,
//     this.inputTextStyle,
//     this.textAlignVertical = TextAlignVertical.center,
//     this.textAlign = TextAlign.start,
//     this.onChanged,
//     this.maxLines = 1,
//     this.validator,
//     this.hintText,
//     this.hintStyle,
//     this.fillColor = AppColors.fillTextField,
//     this.suffixIcon,
//     this.suffixIconColor,
//     this.fieldBorderRadius = 16,
//     this.fieldBorderColor = AppColors.boarderTextField,
//     this.isPassword = false,
//     this.isPrefixIcon = true,
//     this.readOnly = false,
//     this.maxLength,
//     this.prefixIcon,
//     this.onTap,
//     this.isDens = false,
//   });
//
//   final TextEditingController? textEditingController;
//   final FocusNode? focusNode;
//   final TextInputType keyboardType;
//   final TextInputAction textInputAction;
//   final Color cursorColor;
//   final TextStyle? inputTextStyle;
//   final TextAlignVertical? textAlignVertical;
//   final TextAlign textAlign;
//   final int? maxLines;
//   final void Function(String)? onChanged;
//   final void Function(String)? onFieldSubmitted;
//   final FormFieldValidator<String>? validator;
//   final String? hintText;
//   final TextStyle? hintStyle;
//   final Color? fillColor;
//   final Color? suffixIconColor;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final double fieldBorderRadius;
//   final Color fieldBorderColor;
//   final bool isPassword;
//   final bool isPrefixIcon;
//   final bool readOnly;
//   final int? maxLength;
//   final List<TextInputFormatter>? inputFormatters;
//   final VoidCallback? onTap;
//   final bool? isDens;
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//
//       onTap: widget.onTap,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       inputFormatters: widget.inputFormatters,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       readOnly: widget.readOnly,
//       controller: widget.textEditingController,
//       focusNode: widget.focusNode,
//       maxLength: widget.maxLength,
//       keyboardType: widget.keyboardType,
//       textInputAction: widget.textInputAction,
//       cursorColor: widget.cursorColor,
//       style:
//           widget.inputTextStyle ??
//           GoogleFonts.instrumentSans(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w500,
//             color: AppColors.textBlack,
//           ),
//       onChanged: widget.onChanged,
//       maxLines: widget.maxLines,
//       obscureText: widget.isPassword ? obscureText : false,
//       validator: widget.validator,
//       textAlign: widget.textAlign,
//       textAlignVertical: widget.textAlignVertical,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 22.h,
//           horizontal: 16.w,
//         ),
//         isDense: widget.isDens,
//         errorMaxLines: 2,
//         hintText: widget.hintText,
//         hintStyle:
//             widget.hintStyle ??
//             GoogleFonts.instrumentSans(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w500,
//               color: AppColors.hintText,
//             ),
//         fillColor: widget.fillColor,
//         filled: true,
//         prefixIcon: widget.prefixIcon,
//         suffixIcon: widget.isPassword
//             ? GestureDetector(
//                 onTap: toggle,
//                 child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Icon(
//                     obscureText ? Icons.visibility : Icons.visibility_off,
//                     color: AppColors.hintText,
//                   ),
//                 ),
//               )
//             : widget.suffixIcon,
//         suffixIconColor: widget.suffixIconColor,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
//           borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
//           gapPadding: 0,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
//           borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
//           gapPadding: 0,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
//           borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
//           gapPadding: 0,
//         ),
//       ),
//     );
//   }
//
//   void toggle() {
//     setState(() {
//       obscureText = !obscureText;
//     });
//   }
// }






import 'package:flutter/material.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatelessWidget {
  final String labelText;

  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixWidget;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText; // true/false directly
  final Color? backgroundColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? padding;

  const CustomTextField({
    super.key,
    required this.labelText,

    required this.controller,
    this.prefixIcon,
    this.suffixWidget,
    this.validator,
    this.keyboardType,
    this.obscureText = false, // default false
    this.backgroundColor,
    this.border,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.h,vertical: 6.w),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: GoogleFonts.instrumentSans(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          color: AppColors.textBlack,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText, // direct true/false
        controller: controller,
        validator: validator,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: labelText,
         // hintText: hintText,
          labelStyle: GoogleFonts.instrumentSans(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppColors.labelTextColor,
          ),

          border: border ?? InputBorder.none,

          prefixIcon: prefixIcon ,

          // icon box size
          prefixIconConstraints: BoxConstraints(
            minWidth: 24.w,
            minHeight: 24.h,
          ),

          prefixIconColor: AppColors.hintText,
          suffixIcon: suffixWidget,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
