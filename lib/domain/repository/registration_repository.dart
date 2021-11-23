import 'package:meta/meta.dart';
import 'package:vapeteka/domain/model/registraton.dart';

abstract class DayRepository {
  Future<Day> getDay({
    @required double latitude,
    @required double longitude,
  });
}
