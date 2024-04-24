import 'package:pillyze/data/models/data_model.dart';

abstract class LocalDataRepository{
  Future<List<DataModel>?> readAll();
}
