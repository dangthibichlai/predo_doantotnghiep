mixin CommonHelper {
  static Future<void> onTapHandler({required Function callback}) async {
    callback();
  }
}
