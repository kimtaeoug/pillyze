import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:pillyze/app/util/dialog_util.dart';
import 'package:pillyze/app/util/logger_util.dart';
import 'package:pillyze/domain/usecases/local_use_case.dart';

class DataController extends GetxController {
  final LocalUseCase useCase;

  DataController(this.useCase);

  final RxList<FlSpot> _dataList = <FlSpot>[].obs;
  final RxBool _loading = true.obs;

  List<FlSpot> get data => _dataList.value;

  bool get loading => _loading.value;

  void requestData() async {
    try {
      if (_loading.value) {
        _dataList.clear();
        _dataList.value = await useCase.read();
        findMinMax();
        _dataList.refresh();
        _loading.value = false;
      }
    } catch (e, s) {
      _loading.value = true;
      DialogUtil.show();
      PLog.e('$e\n$s');
    }
  }

  RxDouble _minValueY = 0.0.obs;
  RxDouble _maxValueY = 0.0.obs;

  double get minValueY => _minValueY.value;

  double get maxValueY => _maxValueY.value;

  //y축 최소, 최대 찾기
  void findMinMax() {
    for (int i = 0; i < _dataList.length; i++) {
      double y = _dataList[i].y;
      if (i == 0) {
        _maxValueY.value = y;
        _minValueY.value = y;
      } else {
        if (y > _maxValueY.value) {
          _maxValueY.value = y;
        }
        if (y < _minValueY.value) {
          _minValueY.value = y;
        }
      }
    }
  }
}
