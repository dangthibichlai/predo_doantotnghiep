import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_intern/services/preferences.dart';


class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // Token Device
  String get getTokenDevice {
    return _sharedPreference.getString(Preferences.tokenDevice) ?? '';
  }

  void setTokenDevice(String tokenDevice) {
    _sharedPreference.setString(Preferences.tokenDevice, tokenDevice);
  }

  // splash: ----------------------------------------------------------
  bool get getSplash {
    return _sharedPreference.getBool(Preferences.isSplash) ?? false;
  }

  void setSplash({required bool status}) {
    _sharedPreference.setBool(Preferences.isSplash, status);
  }

  // General Methods: Access token
  String get getJwtToken {
    return _sharedPreference.getString(Preferences.jwtToken) ?? '';
  }

  void setJwtToken(String authToken) {
    _sharedPreference.setString(Preferences.jwtToken, authToken);
  }

  // General Methods: Access token
  String get refreshToken {
    return _sharedPreference.getString(Preferences.refreshToken) ?? '';
  }

  void setRefreshToken(String refreshToken) {
    _sharedPreference.setString(Preferences.refreshToken, refreshToken);
  }

  // fcm token
  String get getFcmToken {
    return _sharedPreference.getString(Preferences.fcmToken) ?? '';
  }

  void setFcmToken(String fcmToken) {
    _sharedPreference.setString(Preferences.fcmToken, fcmToken);
  }

  //locale
  void setLocale(String locale) {
    _sharedPreference.setString(Preferences.locale, locale);
  }

  // locale
  String get getLocale {
    return _sharedPreference.getString(Preferences.locale) ?? '';
  }

  ///
  /// Time zone.
  ///
  String get getTimeZoneName {
    return _sharedPreference.getString(Preferences.idTimeZoneName) ?? '';
  }

  void setTimeZoneName({required String idTimeZoneName}) {
    _sharedPreference.setString(Preferences.idTimeZoneName, idTimeZoneName);
  }

  Future<bool> removeRefreshToken() {
    return _sharedPreference.remove(Preferences.refreshToken);
  }

  Future<bool> removeJwtToken() {
    return _sharedPreference.remove(Preferences.jwtToken);
  }

  // Loggin: ----------------------------------------------------------
  bool get getLogger {
    return _sharedPreference.getBool(Preferences.idLogger) ?? false;
  }

  void setLogger({required bool idLogger}) {
    _sharedPreference.setBool(Preferences.idLogger, idLogger);
  }

  Future<void> removeLogger() async {
    _sharedPreference.remove(Preferences.idLogger);
  }

  ///
  /// Set id user.
  ///
  String get getIdUser {
    return _sharedPreference.getString(Preferences.idUser) ?? '';
  }

  void setIdUser({required String idUser}) {
    _sharedPreference.setString(Preferences.idUser, idUser);
  }

  void removeIdUser() {
    _sharedPreference.remove(Preferences.idUser);
  }

  // splash: ----------------------------------------------------------
  bool get getPremium {
    return _sharedPreference.getBool(Preferences.isPremium) ?? false;
  }

  void setPremium({required bool isPremium}) {
    _sharedPreference.setBool(Preferences.isPremium, isPremium);
  }

  // Play sound: ----------------------------------------------------------
  bool get getPlaySound {
    return _sharedPreference.getBool(Preferences.isPlaySound) ?? true;
  }

  void setPlaySound({required bool status}) {
    _sharedPreference.setBool(Preferences.isPlaySound, status);
  }

  // Text bubble: ----------------------------------------------------------
  int get getTextBubble {
    return _sharedPreference.getInt(Preferences.isTextBubble) ?? 0;
  }

  void setTextBubble({required int status}) {
    _sharedPreference.setInt(Preferences.isTextBubble, status);
  }

  // Count my audio: ----------------------------------------------------------
  int get getMyAudio {
    return _sharedPreference.getInt(Preferences.isCountMyAudio) ?? 0;
  }

  void setMyAudio({required int count}) {
    _sharedPreference.setInt(Preferences.isCountMyAudio, count);
  }

  // Show record tip
  bool get getShowRecordTip {
    return _sharedPreference.getBool(Preferences.isShowRecordTip) ?? true;
  }

  void setShowRecordTip({required bool isShow}) {
    _sharedPreference.setBool(Preferences.isShowRecordTip, isShow);
  }

  // How many time app opened
  int getOpenAppCount() {
    return _sharedPreference.getInt(Preferences.openAppCount) ?? 0;
  }

  Future<bool> setOpenAppCount(int openApp) {
    return _sharedPreference.setInt(Preferences.openAppCount, openApp);
  }

  // How many time app save file
  int getSaveFileCount() {
    return _sharedPreference.getInt(Preferences.saveFileCount) ?? 0;
  }

  Future<bool> setSaveFileCount(int saveFile) {
    return _sharedPreference.setInt(Preferences.saveFileCount, saveFile);
  }

  // check user rated app or not.
  bool get getIsRatedApp {
    return _sharedPreference.getBool(Preferences.isRatedApp) ?? false;
  }

  void setIsRatedApp({required bool isRate}) {
    _sharedPreference.setBool(Preferences.isRatedApp, isRate);
  }
}
