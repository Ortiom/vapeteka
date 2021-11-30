import 'dart:core';

class Register {
  Register({
    this.firstName,
    this.lastName,
    this.middleName,
    this.password,
    this.passConfirm,
    this.phoneNumber,
    this.birthday,
  });
  String? firstName;
  String? lastName;
  String? middleName;
  String? password;
  String? passConfirm;
  String? phoneNumber;
  String? birthday;
}
