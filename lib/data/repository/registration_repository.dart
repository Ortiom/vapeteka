import 'package:vapeteka/data/api/api_util.dart';
import 'package:vapeteka/domain/model/registraton.dart';
import 'package:vapeteka/domain/repository/registration_repository.dart';

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  @override
  Future<Day> getDay({double? latitude, double? longitude}) {
    return _apiUtil.getDay(latitude: latitude!, longitude: longitude!);
  }
}
