import 'package:get/get.dart';
import 'package:pillyze/data/repositories/local_data_repository_impl.dart';

class DependencyCreator{
  static init(){
    Get.put(LocalDataRepositoryImpl());
  }
}