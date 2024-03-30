import 'package:test_intern/presentation/pages/feed_back/feed_back_controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class FeedBackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedBackController>(() => FeedBackController());
  }
}
