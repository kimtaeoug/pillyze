import 'package:flutter/cupertino.dart';
import 'package:pillyze/app/util/logger_util.dart';

///
/// Widget 관련 util
///
class WidgetUtil {
  static Size? size(GlobalKey key) {
    try {
      if (key.currentContext != null) {
        RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
        Size size = box.size;
        return size;
      } else {
        throw Exception('key.currentContext is null');
      }
    } catch (e) {
      PLog.e(e);
    }
    return null;
  }
}
