import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/responsive/constrained_box.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controller/login_controller.dart';
import '../widgets/login/login_buttons.dart';
import '../widgets/login/login_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) =>
          Get.find<LoginController>().onPopInvoked(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConst.defaultPadding),
            child: MyResConstrainedBoxAlign(
              child: ListView(
                children: [
                  Image.asset(AppAssets.logo,
                      height: MediaQuery.sizeOf(context).height * 0.25),
                  const SizedBox(height: AppConst.defaultPadding),
                  Text(
                    localeLang(context).login,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 70),
                  const LoginFields(),
                  const LoginButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
