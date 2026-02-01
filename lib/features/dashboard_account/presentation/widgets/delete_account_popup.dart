import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: AppColors.deletePopBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.borderRadius(30),
            ),
          ),
          child: Padding(
            padding: ResponsiveHelper.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Delete this account?', style: context.bodyMedium),
                SizedBox(height: ResponsiveHelper.height(8)),
                Text(
                  'A message should be a short,\ncomplete sentence.',
                  textAlign: TextAlign.center,
                  style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: ResponsiveHelper.height(24)),
                // Delete Button
                SizedBox(
                  width: double.infinity,
                  height: ResponsiveHelper.height(55),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ResponsiveHelper.borderRadius(30),
                        ),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppText.deleteAccount,
                      style: context.bodyMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ResponsiveHelper.height(12)),
                // Cancel Button
                SizedBox(
                  width: double.infinity,
                  height: ResponsiveHelper.height(55),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ResponsiveHelper.borderRadius(30),
                        ),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      AppText.cancel,
                      style: context.bodyMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
