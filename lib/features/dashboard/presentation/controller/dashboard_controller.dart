import 'dart:io';

import 'package:get/get.dart';

import '../../../../app_info.dart';
import '../../../../core/status/status.dart';
import '../../../../core/utils/config/controller/config_controller.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/helper/show_my_snack_bar.dart';
import '../../../../core/utils/services/push_notification_service.dart';
import '../../../../core/utils/types/dashboard_tabs.dart';
import '../../../auth/data/models/user_model.dart';
import '../../domain/repositories/dashboard_repositories.dart';

const int initSelectedPage = 0;

abstract class DashboardController extends GetxController {
  DashboardController();
  bool get isLoadingUserData;

  UserModel? get user;

  int get selectedScreen;
  void changeHomeScreen(int selected);

  Future<void> getAllData([bool isReload = false]);

  Future<void> updateFCMToken();

  Future<void> getUserData([bool isReload = false]);

  Future<void> logOut();

  void onPopInvoked();
}

class DashboardControllerImp extends DashboardController {
  final DashboardRepositories repo;
  final ConfigController configController;
  DashboardControllerImp({
    required this.repo,
    required this.configController,
  });

  bool _isLoadingUserData = true;

  @override
  bool get isLoadingUserData => _isLoadingUserData;

  UserModel? _user;

  @override
  UserModel? get user => _user;

  int _selectedScreen = initSelectedPage;
  @override
  int get selectedScreen => _selectedScreen;

  @override
  void changeHomeScreen(int selected) {
    _selectedScreen = selected;
    update([AppString.updateSelectedScreen]);
  }

  @override
  void onReady() {
    getAllData();
    super.onReady();
  }

  @override
  Future<void> getAllData([bool isReload = false]) async {
    await Future.wait([
      configController.getConfigData(isReload),
      getUserData(isReload),
    ]);
    if (user != null) updateFCMToken();
  }

  @override
  Future<void> updateFCMToken() async {
    return handleResponseInController<void>(
      status: await repo.updateFCMTokenAndTopic(
        NotificationService.deviceToken ??
            await NotificationService.getDeviceToken(),
      ),
      onSuccess: (_) {},
    );
  }

  @override
  Future<void> getUserData([bool isReload = false]) async {
    final List<String> ids = [
      AppString.updateHomeUser,
      AppString.updateBalance,
      AppString.updateProfileDetails,
    ];
    if (!isReload) {
      _isLoadingUserData = true;
      update(ids);
    }

    Status<UserModel?>? realStatus;

    repo.getUserData().listen(
      (status) {
        if (status is Success<UserModel?>) {
          realStatus ??= status;
          _user = status.data;
          _isLoadingUserData = false;
          update(ids);
        } else {
          realStatus = status;
        }
      },
      onDone: () {
        if (realStatus is Failure<UserModel?>) {
          handleFailureStatus(realStatus as Failure<UserModel>);
        }
        _isLoadingUserData = false;
        update(ids);
      },
    );
  }

  @override
  Future<void> logOut() async {
    return ShowMyDialog.loading(
      () async => await handleResponseInController<void>(
        status: await repo.logout(),
        onSuccess: (_) {
          Get.offAllNamed(AppRoute.login);
        },
      ),
    );
  }

  DateTime _back = DateTime.now();
  @override
  void onPopInvoked() async {
    if (_selectedScreen != initSelectedPage) {
      if (_selectedScreen == DashboardTabsEnum.addPoints.index) return;
      return changeHomeScreen(initSelectedPage);
    }

    if (DateTime.now().difference(_back) < const Duration(seconds: 2)) {
      if (!AppInfo.isDebugMode) exit(0);
    }
    ShowMySnackBar.call(
      localeLang().pressAgainToExit,
      duration: const Duration(seconds: 2),
    );
    _back = DateTime.now();
  }
}
