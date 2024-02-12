import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingService extends GetxService {
  late final GetStorage _getStorage;

  final String _isAuthKey = "is_auth_key";
  final String _codeLangKey = "code_lang_key";
  final String _ltrKey = "ltr_key";

  Future<SettingService> init() async {
    _getStorage = GetStorage("settings");

    return this;
  }

  Future<void> changeIsAuth(bool isAuth) async =>
      await _getStorage.write(_isAuthKey, isAuth);

  bool get isAuth => _getStorage.read(_isAuthKey) ?? false;

  Future<void> setCodeLang(String codeLang) async =>
      _getStorage.write(_codeLangKey, codeLang);

  String getCodeLang() => _getStorage.read(_codeLangKey) ?? "en";

  Future<void> changeLtr(bool isLlr) async => _getStorage.write(_ltrKey, isLlr);

  bool get isLtr => _getStorage.read(_ltrKey) ?? true;
}
