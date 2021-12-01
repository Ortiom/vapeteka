import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:vapeteka/constants/url.dart';
import 'package:vapeteka/models/login_models/login.dart';
import 'package:vapeteka/models/login_models/register.dart';
import 'package:vapeteka/models/login_models/register_with_card.dart';
import 'package:vapeteka/models/login_models/sms_code.dart';
import 'package:vapeteka/services/response_result.dart';
import 'package:vapeteka/services/rest_service.dart';

class ApiController extends GetxController {
  RestService restService = RestService();
  bool loading = false.obs();
  String number = ''.obs();

  Future<Result> registration(Register model) async {
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
    print(formData.fields);
    final firstStep = restService.request(
      REGISTER,
      method: post,
      data: formData,
    );
    var result = await firstStep;
    print(result.statusCode);
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

  Future<Result> registrationWithCard(RegWithCard model) async {
    loading = true;
    update();
    FormData formData = FormData.fromMap({
      'qr_code': model.qrCode,
      'phone_number': model.phoneNumber,
      'password': model.password,
      'conf_password': model.passConfirm,
      'birthday': model.birthday,
    });
    print(formData.fields);
    final firstStep = restService.request(
      REG_WITH_CARD,
      method: post,
      data: formData,
    );
    var result = await firstStep;
    print(result.errorText);
    if (result.status == Status.success) {
      loading = false;
      update();
    } else if (result.status == Status.error) {
      loading = false;
      update();
    }
    return result;
  }

  Future<Result> login(Login model) async {
    loading = true;
    update();
    FormData formData = FormData.fromMap({
      'phone_number': model.phoneNumber,
      'password': model.password,
    });
    print(formData.fields);
    final firstStep = restService.request(
      LOGIN,
      method: post,
      data: formData,
    );
    var result = await firstStep;
    print(result.errorText);
    if (result.status == Status.success) {
      loading = false;
      update();
    } else if (result.status == Status.error) {
      loading = false;
      update();
    }
    return result;
  }

  Future<Result> smsCode(SmsCode model) async {
    loading = true;
    update();
    FormData formData = FormData.fromMap({
      'phone_number': number,
      'code': model.code,
    });
    print(formData.fields);
    final firstStep = restService.request(
      SMS_CODE,
      method: post,
      data: formData,
    );
    var result = await firstStep;
    print(result.errorText);
    if (result.status == Status.success) {
      print(result.data);
      loading = false;
      update();
    } else if (result.status == Status.error) {
      loading = false;
      update();
    }
    return result;
  }
}
