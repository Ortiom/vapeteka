import 'package:vapeteka/data/api/api_util.dart';
import 'package:vapeteka/data/api/service/registration_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(SunriseService());
    return _apiUtil!;
  }
}
