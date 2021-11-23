import 'package:vapeteka/data/repository/registration_repository.dart';
import 'package:vapeteka/domain/repository/registration_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static DayRepository? _dayRepository;

  static DayRepository dayRepository() {
    _dayRepository ??= DayDataRepository(
      ApiModule.apiUtil(),
    );
    return _dayRepository!;
  }
}
