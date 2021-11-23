import 'package:get/get.dart';
import 'package:vapeteka/domain/model/registraton.dart';
import 'package:vapeteka/domain/repository/registration_repository.dart';

class RegController extends GetxController {
  RegController({this.dayRepository});

  late final DayRepository? dayRepository;

  Day day = Day().obs();
  bool isLoading = false.obs();

  Future<void> getDay({
    required double latitude,
    required double longitude,
  }) async {
    isLoading = true;
    final data =
        await dayRepository!.getDay(latitude: latitude, longitude: longitude);
    day = data;
    isLoading = false;
  }
}
