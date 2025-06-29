import 'package:get/get.dart';
import 'package:loyalty_points/features/dashboard/presentation/screens/order_details_screen.dart';
import 'package:loyalty_points/features/dashboard/presentation/screens/points_details_screen.dart';
import 'package:loyalty_points/features/dashboard/presentation/screens/update_profile_screen.dart';

import '../../../../features/auth/presentation/screens/waiting_screen.dart';
import '../../../../features/dashboard/presentation/screens/add_new_code_screen.dart';
import '../../../../features/dashboard/presentation/screens/bar_code_scanner_screen.dart';
import '../../../../features/dashboard/presentation/screens/code_added_screen.dart';
import '../../../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../../../features/auth/presentation/screens/login_screen.dart';
import '../../../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../../../features/dashboard/presentation/screens/edit_password_screen.dart';
import '../../../../features/dashboard/presentation/screens/profile_details_screen.dart';
import '../../../../features/redeem/presentation/screens/checkout_screen.dart';
import '../../../../features/redeem/presentation/screens/redeem_success_screen.dart';
import '../../../../features/redeem/presentation/screens/replacement_screen.dart';
import '../../bindings/add_new_code_bindings.dart';
import '../../bindings/checkout_bindings.dart';
import '../../bindings/profile_bindings.dart';
import '../../bindings/update_password_bindings.dart';
import '../../bindings/update_profile_bindings.dart';
import '../../bindings/home_bindings.dart';
import '../../bindings/login_bindings.dart';
import '../../bindings/sign_up_bindings.dart';
import '../../middleware/login_middleware.dart';

abstract final class AppRoute {
  const AppRoute();

  static const String login = "/login";
  static const String signUp = "/sign-up";
  static const String home = "/home";
  static const String waiting = "/waiting";
  static const String newBarcode = "/new-barcode";
  static const String barCodeScanner = "/barcode-scanner";
  static const String codeAddedScreen = "/code-added";
  static const String checkoutScreen = "/checkout";
  static const String redeemScreen = "/redeem";
  static const String successRedeemScreen = "/success-redeem";
  static const String editProfile = "/edit-profile";
  static const String profileDetails = "/profile-details";
  static const String editPassword = "/edit-password";
  static const String pointsDetails = "/points-details";
  static const String ordersDetails = "/orders-details";


  // static const String OrderDetails = '/OrderDetails';

  static List<GetPage> get pages => [
        GetPage(
          name: login,
          page: () => const LoginScreen(),
          binding: LoginBindings(),
          middlewares: [LoginMiddleWare(Get.find<AuthLocalDataSource>())],
        ),
        GetPage(
          name: signUp,
          binding: SignUpBindings(),
          page: () => const SignUpScreen(),
        ),
        GetPage(
          name: home,
          page: () => const DashboardScreen(),
          bindings: [HomeBindings(), AddNewCodeBindings()],
        ),
        GetPage(
          name: waiting,
          page: () => const WaitingScreen(),
        ),
        GetPage(
          name: newBarcode,
          page: () => const AddNewCodeScreen(),
        ),
        GetPage(
          name: barCodeScanner,
          page: () => const BarcodeScannerScreen(),
        ),
        GetPage(
          name: codeAddedScreen,
          page: () => const CodeAddedScreen(),
        ),
        GetPage(
          name: checkoutScreen,
          page: () => const CheckoutScreen(),
          binding: CheckoutBindings(),
        ),
        GetPage(
          name: redeemScreen,
          page: () => const ReplacementScreen(),
        ),
        GetPage(
          name: successRedeemScreen,
          page: () => const RedeemSuccessScreen(),
        ),
        GetPage(
          name: profileDetails,
          page: () => const ProfileDetailsScreen(),
          binding: ProfileBindings(),
        ),
        GetPage(
          name: editProfile,
          page: () => const UpdateProfileScreen(),
          binding: UpdateProfileBindings(),
        ),
        GetPage(
          name: editPassword,
          page: () => const EditPasswordScreen(),
          binding: UpdatePasswordBindings(),
        ),
        GetPage(
          name: pointsDetails,
          page: () => PointsDetailsScreen(points: Get.arguments),
        ),
        GetPage(
          name: ordersDetails,
          page: () => OrdersDetailsScreen(order: Get.arguments),
        ),
      ];
}
