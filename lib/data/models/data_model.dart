import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_model.g.dart';
part 'data_model.freezed.dart';

@freezed
class DataModel with _$DataModel{
  factory DataModel({
      required double x,
      required double y
  }) = _DataModel;
  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);
}
