import 'package:pillyze/data/models/data_model.dart';
import 'package:pillyze/data/providers/provider.dart';
import 'package:pillyze/domain/repositories/local_data_repository.dart';

class LocalDataRepositoryImpl extends LocalDataRepository {
  @override
  Future<List<DataModel>?> readAll() async {
    try{
      return await Provider.instance.requestLocal();
    }catch(e){
      return Future.error(e);
    }
  }
}