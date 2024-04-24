import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pillyze/app/config/constants.dart';
import 'package:pillyze/app/util/logger_util.dart';
import 'package:pillyze/data/models/data_model.dart';

class LocalHelper {
  LocalHelper();

  Future request() async {
    try {
      PLog.i('LocalHelper request is invoked');
      List rawData =
          await json.decode(await rootBundle.loadString(LOCAL_DATA_PATH));
      return rawData.map((e) => DataModel.fromJson(e)).toList();
    } catch (e, s) {
      PLog.e('$e\n$s');
      return null;
    }
  }
}
