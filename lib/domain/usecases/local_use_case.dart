import 'package:fl_chart/fl_chart.dart';
import 'package:pillyze/app/util/logger_util.dart';
import 'package:pillyze/data/models/data_model.dart';
import 'package:pillyze/domain/repositories/local_data_repository.dart';

class LocalUseCase{
  final LocalDataRepository repository;
  LocalUseCase({required this.repository});

  Future<List<FlSpot>> read()async{
    List<DataModel>? result = await repository.readAll();
    if(result != null && (result.isNotEmpty == true)){
      return result.map((e) => FlSpot(e.x, e.y)).toList();
    }else{
      PLog.e('Result : $result');
      return [];
    }
  }
}