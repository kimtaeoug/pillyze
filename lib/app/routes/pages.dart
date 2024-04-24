import 'package:get/get.dart';
import 'package:pillyze/app/routes/bindings.dart';
import 'package:pillyze/app/routes/routes.dart';
import 'package:pillyze/presentation/view/home/home_page.dart';
import 'package:pillyze/presentation/view/loading/loading_page.dart';

final pages = [
  GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: PBindings(route: Routes.HOME)),
  GetPage(
      name: Routes.LOADING,
      page: () => const LoadingPage())
];
