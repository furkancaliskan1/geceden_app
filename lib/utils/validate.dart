import 'package:intl_phone_field/phone_number.dart';

class Validate {
  static String? phone(PhoneNumber? value) {

    final regex = RegExp(r'^[+][(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]$');

    if (value == null || value.number.isEmpty) {
      return '* Bu alan boş bırakılamaz';
    }
    if (!regex.hasMatch(value.number)) {
      return '* Lütfen geçerli bir numara giriniz';
    }
    return null;
  }

  static String? name(String? value){

    final regex = RegExp(r'[^a-z A-ZçÇğĞıİöÖşŞüÜ]');
    
    if (value == null || value.isEmpty) {
      return '* Bu alan boş bırakılamaz';
    }
    if (regex.hasMatch(value)) {
      return '* Sadece harf giriniz';
    }
    return null;
  }

  static String? gender(String? value)
  {
    if (value == null || value.isEmpty) {
      return '* Bu alan boş bırakılamaz';
    }
    return null;
  }

  static String? date(String? value, {required bool isGreaterThan18})
  {
    if (value == null || value.isEmpty) {
      return '* Bu alan boş bırakılamaz';
    }
    if (!isGreaterThan18) {
      return '* Yaşınız 18 den büyük olmalı.';
    }
    return null;
  }
}