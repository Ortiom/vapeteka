import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:vapeteka/constants/url.dart';
import 'package:vapeteka/models/login_models/login.dart';
import 'package:vapeteka/models/login_models/register.dart';
import 'package:vapeteka/models/login_models/register_with_card.dart';
import 'package:vapeteka/models/login_models/sms_code.dart';
import 'package:vapeteka/services/response_result.dart';
import 'package:vapeteka/services/rest_service.dart';
import 'package:vapeteka/services/shared_preferences.dart';

class ApiController extends GetxController {
  RestService restService = RestService();
  bool loading = false.obs();
  String number = ''.obs();
  String token = ''.obs();
  int qrCode = 0.obs();

  Future<Result> registrationReq(Register model) async {
    loading = true;
    update();
    FormData formData = FormData.fromMap({
      'first_name': model.firstName,
      'last_name': model.lastName,
      'middle_name': model.middleName,
      'password': model.password,
      'conf_password': model.passConfirm,
      'phone_number': model.phoneNumber,
      'birthday': model.birthday,
    });
    final request = restService.request(
      registerUrl,
      method: post,
      data: formData,
    );
    var result = await request;
    if (result.status == Status.success) {
      number = model.phoneNumber!;
      loading = false;
      update();
    } else if (result.status == Status.error) {
      loading = false;
      update();
    }
    return result;
  }

  Future<Result> registrationWithCardReq(RegWithCard model) async {
    loading = true;
    update();
    FormData formData = FormData.fromMap({
      'qr_code': model.qrCode,
      'phone_number': model.phoneNumber,
      'password': model.password,
      'conf_password': model.passConfirm,
      'birthday': model.birthday,
    });
    final request = restService.request(
      regWithCardUrl,
      method: post,
      data: formData,
    );
    var result = await request;
    if (result.status == Status.success) {
      loading = false;
      update();
    } else if (result.status == Status.error) {
      loading = false;
      update();
    }
    return result;
  }

  Future<Result> loginReq(Login model) async {
    loading = true;
    update();
    FormData formData = FormData.fromMap({
      'phone_number': model.phoneNumber,
      'password': model.password,
    });
    final request = restService.request(
      loginUrl,
      method: post,
      data: formData,
    );
    var result = await request;
    if (result.status == Status.success) {
      token = result.data['token'];
      print(token);
      PreferencesService.setToken(token);
      loading = false;
      update();
    } else if (result.status == Status.error) {
      loading = false;
      update();
    }
    return result;
  }

  Future<Result> smsCodeReq(SmsCode model) async {
    loading = true;
    update();
    FormData formData = FormData.fromMap({
      'phone_number': number,
      'code': model.code,
    });
    final request = restService.request(
      smsCodeUrl,
      method: post,
      data: formData,
    );
    var result = await request;
    if (result.status == Status.success) {
      loading = false;
      update();
    } else if (result.status == Status.error) {
      loading = false;
      update();
    }
    return result;
  }

  Future<Result> qrCodeReq() async {
    loading = true;
    final request = restService.request(
      qrCodeUrl,
      method: get,
      token: token,
    );
    var result = await request;
    print(result.errorText);
    if (result.status == Status.success) {
      qrCode = result.data['qr_code']['qr_code'];
      loading = false;
      update();
    } else if (result.status == Status.error) {
      loading = false;
      update();
    }
    return result;
  }
}
