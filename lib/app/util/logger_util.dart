import 'package:logger/logger.dart';

class PLog{
  static final Logger logger = Logger(
    printer: PrettyPrinter()
  );
  static void e(Object message){
    logger.e(message);
  }
  static void i(Object message){
    logger.i(message);
  }
  static void d(Object message){
    logger.d(message);
  }
}