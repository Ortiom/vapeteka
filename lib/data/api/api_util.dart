import 'package:vapeteka/data/api/request/get_registration_body.dart';
import 'package:vapeteka/data/api/service/registration_service.dart';
import 'package:vapeteka/data/mapper/registration_mapper.dart';
import 'package:vapeteka/domain/model/registraton.dart';

class ApiUtil {
  final SunriseService _sunriseService;

  ApiUtil(this._sunriseService);

  Future<Day> getDay({
    required double latitude,
    required double longitude,
  }) async {
    final body = GetDayBody(latitude: latitude, longitude: longitude);
    final result = await _sunriseService.getDay(body);
    return DayMapper.fromApi(result);
  }
}
