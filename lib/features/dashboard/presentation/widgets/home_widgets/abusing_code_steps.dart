import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/app_color.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class AbusingCodeSteps extends StatelessWidget {
  const AbusingCodeSteps(
      {super.key,
      required this.ico,
      required this.title,
      required this.subTitle});
  final String ico;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColor.greyBackground,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(AppConst.paddingSmall),
            child: Image.asset(ico),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          style: context.textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
