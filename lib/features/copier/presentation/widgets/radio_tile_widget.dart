import 'package:flutter/material.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';


class RadioTileWidget extends StatelessWidget {
  const RadioTileWidget({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(

      padding: EdgeInsets.all(8),
      borderColor: AppColors.primaryShade,
      backgroundColor: AppColors.primaryShade100,
      child:       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text("360 Degrees Markets",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.titleSmall
          ),
          Container(
            height: 24,
            width: 24,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:isSelected? AppColors.primary:AppColors.greySwitch,
                width: 2,
              ),
            ),
            child: isSelected
                ? Container(
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected? AppColors.primary:AppColors.greySwitch,
              ),
            )
                : null,
          ),

        ],
      ),
    );
  }
}