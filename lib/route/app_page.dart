import 'package:get/get.dart';
import 'package:my_app/route/app_route.dart';
import 'package:my_app/view/dashboard/dashboard_binding.dart';
import 'package:my_app/view/dashboard/dashboard_screen.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
  ];
}
