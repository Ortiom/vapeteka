// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "enter": "ENTER",
  "register": "Register",
  "register_card": "I have a card",
  "card_number": "Enter the card number",
  "phone_number": "Phone number",
  "password": "Password",
  "repeat_password": "Repeat password",
  "name": "Name",
  "surname": "Surname",
  "middle_name": "Patronymic",
  "birthdate": "Date of birth",
  "code": "Confirmation code",
  "check_sms": "CHECK",
  "discount": "Discounts",
  "home": "Home",
  "basket": "Basket",
  "settings": "Settings",
  "catalog": "Catalog",
  "code_type": "Code type",
  "barcode": "Barcode",
  "qr_code": "QR code",
  "change_lng": "Change the language",
  "russian": "Russian",
  "english": "English",
  "exit": "Exit",
  "current_discount": "Current discount",
  "product": "Product",
  "products": "Products",
  "add": "ADD",
  "order": "ORDER",
  "great": "GREAT",
  "amount": "Amount",
  "price": "Price",
  "select_quantity": "Select quantity",
  "tenge": "tenge",
  "items": "items",
  "order_created": "Your order has been created!",
  "order_details": "Our staff will contact you by phone to coordinate the order and clarify the terms of delivery."
};
static const Map<String,dynamic> ru = {
  "enter": "ВОЙТИ",
  "register": "Зарегистрироваться",
  "register_card": "У меня есть карта",
  "card_number": "Введите номер карты",
  "phone_number": "Номер телефона",
  "password": "Пароль",
  "repeat_password": "Повторите пароль",
  "name": "Имя",
  "surname": "Фамилия",
  "middle_name": "Отчество",
  "birthdate": "Дата рождения",
  "code": "Код подтверждения",
  "check_sms": "ПРОВЕРИТЬ",
  "discount": "Акции",
  "home": "Главная",
  "basket": "Корзина",
  "settings": "Настройки",
  "catalog": "Каталог",
  "code_type": "Тип кода",
  "barcode": "Штрих-код",
  "qr_code": "QR код",
  "change_lng": "Сменить язык",
  "russian": "Русский",
  "english": "Английский",
  "exit": "Выйти",
  "current_discount": "Текущая скидка",
  "product": "Товар",
  "products": "Товары",
  "add": "Добавить",
  "order": "ЗАКАЗАТЬ",
  "great": "ОТЛИЧНО",
  "amount": "Количество",
  "price": "Цена",
  "select_quantity": "Выберите количество",
  "tenge": "тенге",
  "items": "шт",
  "order_created": "Ваш заказ создан!",
  "order_details": "Наши сотрудники свяжутся с Вами по контактному телефону для согласования заказа и уточнения условий доставки."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
