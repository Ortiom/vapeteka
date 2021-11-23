import 'package:vapeteka/domain/state/registration_state.dart';
import 'package:vapeteka/internal/dependencies/repository_module.dart';

class HomeModule {
  static RegController regController() {
    return RegController(
      dayRepository: RepositoryModule.dayRepository(),
    );
  }
}
