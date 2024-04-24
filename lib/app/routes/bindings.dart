import 'package:get/get.dart';
import 'package:pillyze/app/routes/routes.dart';
import 'package:pillyze/data/repositories/local_data_repository_impl.dart';
import 'package:pillyze/domain/usecases/local_use_case.dart';
import 'package:pillyze/presentation/controllers/data_controller.dart';

class PBindings extends Bindings {
  final String route;

  PBindings({required this.route});

  @override
  void dependencies() {
    switch (route) {
      case Routes.HOME:
        Get.put(LocalUseCase(repository: Get.find<LocalDataRepositoryImpl>()));
        Get.put(DataController(Get.find()));
        break;
    }
  }
}
