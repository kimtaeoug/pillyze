import 'package:pillyze/app/util/logger_util.dart';

import 'local_helper.dart';

class Provider{
  static final Provider instance = Provider._();
  Provider._();
  factory Provider() => instance;

  Future requestLocal() async {
    try {
      PLog.i('requestLocal');
      return LocalHelper().request();
    } catch (e) {
      PLog.e(e);
      return Future.error(e);
    }
  }
}