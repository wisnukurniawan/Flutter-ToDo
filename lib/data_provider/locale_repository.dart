import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data_provider/locale_mapper.dart';
import 'package:flutter_todo_list/data_provider/preference/locale_provider.dart';

class LocaleRepository {
  const LocaleRepository(this._localeProvider);

  final LocaleProvider _localeProvider;

  Stream<Locale> getLocale() {
    return _localeProvider.getLocale().map(LocaleMapper.toLocale);
  }

  Future<bool> setLocale(Locale locale) async {
    return _localeProvider.setLocale(locale.languageCode);
  }
}
