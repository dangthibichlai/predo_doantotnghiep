import 'package:test_intern/resources/end-point.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIO {
  io.Socket socket = io.io(
      EndPoints.SOCKET_URL,
      io.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          // .setExtraHeaders({'authorization': 'Bearer ${sl.get<SharedPreferenceHelper>().getJwtToken}'}) // headers
          .enableAutoConnect()
          .build());

  ///
  /// _init
  ///
  void init() {
    if (socket.disconnected) {
      socket.connect();
      socket.onConnect(
        (_) {
          print("Socket connected");
          _onListenChannels();
        },
      );
    }
  }

  void _onListenChannels() {
    if (!socket.hasListeners('56sero_cancel_user_rescue')) {
      socket.on('p56sero_cancel_user_rescue', (data) async {
        // if (data != null) {
        //   final userRescuesModel =
        //       UserRescuesModel.fromMap(data as Map<String, dynamic>);
        //   if (userRescuesModel.userId?.id ==
        //           sl<SharedPreferenceHelper>().getIdUser &&
        //       userRescuesModel.status == RescuesEnum.FAILED) {
        //     // Nếu đang ở màn hình map thì trở về lại trang chủ.
        //     if (Get.currentRoute == HomeRouters.mapRescuePage) {
        //       Get.back();
        //     }

        //     // Đặt lại cứu hộ.
        //     if (Get.isRegistered<HomeController>()) {
        //       final homeController = Get.find<HomeController>();
        //       homeController.onReorderRescue(
        //         userRescuesModel: userRescuesModel,
        //       );
        //     }
        //   }
        // }
      });
    }

    if (!socket.hasListeners('p56sero_confirm_user_rescue')) {
      socket.on('p56sero_confirm_user_rescue', (data) async {
        // if (data != null) {
        //   final userRescuesModel =
        //       UserRescuesModel.fromMap(data as Map<String, dynamic>);
        //   if (userRescuesModel.userId?.id ==
        //               sl<SharedPreferenceHelper>().getIdUser &&
        //           userRescuesModel.status == RescuesEnum.CONFIRMED ||
        //       userRescuesModel.status == RescuesEnum.COMPLETED) {
        //     // Load lại thông tin đơn cứu hộ.
        //     if (Get.isRegistered<HomeController>()) {
        //       final homeController = Get.find<HomeController>();
        //       homeController.getUserRescuesCurrent();
        //     }

        //     // Nếu có ngừoi xác nhận đơn.
        //     if (userRescuesModel.status == RescuesEnum.CONFIRMED) {
        //       if (Get.isDialogOpen == true) {
        //         Get.back();
        //       }
        //       if (Get.currentRoute == HomeRouters.mapRescuePage) {
        //         Get.back();
        //       }
        //       // Hiển thị dialog có người nhận đơn cứu hộ.
        //       if (Get.isRegistered<HomeController>()) {
        //         final homeController = Get.find<HomeController>();
        //         homeController.showDialogHasConfirmRecues();
        //       }
        //     }
        //   }
        // }
      });
    }

    // if (!socket.hasListeners(EndPoints.COMPLETE_RECUE)) {
    //   socket.on(EndPoints.COMPLETE_RECUE, (data) async {
    // if (data != null) {
    //   final userRescuesModel =
    //       UserRescuesModel.fromMap(data as Map<String, dynamic>);
    //   if (userRescuesModel.userId?.id ==
    //           sl<SharedPreferenceHelper>().getIdUser &&
    //       userRescuesModel.status == RescuesEnum.COMPLETED &&
    //       Get.isRegistered<HomeController>()) {
    //     final homeController = Get.find<HomeController>();
    //     if (homeController.userRescuesModel.value?.status != null) {
    //       homeController.userRescuesModel.value?.status =
    //           RescuesEnum.COMPLETED;
    //     }
    //     homeController.getUserRescuesCurrent();
    //   }
    // }
    //  });
    // }

    // if (!socket.hasListeners(EndPoints.NEW_MESSAGE)) {
    //   socket.on(EndPoints.NEW_MESSAGE, (data) async {
    // if (data != null) {
    //   final MessageModel message =
    //       MessageModel.fromMap(data as Map<String, dynamic>);

    //   if (Get.isRegistered<ConversationController>() &&
    //       (message.senderId?.id == sl<SharedPreferenceHelper>().getIdUser ||
    //           message.receiverId ==
    //               sl<SharedPreferenceHelper>().getIdUser)) {
    //     final conversationController = Get.find<ConversationController>();

    //     /// Kiểm tra có trò chuyên mới chưa đọc không.
    //     if (Get.isRegistered<DashBoardController>()) {
    //       final dashBoardController = Get.find<DashBoardController>();
    //       dashBoardController.onGetDataNotification();
    //     }

    //     // Cập nhật lại conversation.
    //     conversationController.getConversation(isRefresh: true);
    //   }

    //   /// Nếu đang ở màn hình chat thì load lại tin nhắn mới.
    //   if (Get.currentRoute == CommunityRouters.CHAT &&
    //       Get.isRegistered<ChatController>() &&
    //       message.senderId?.id != sl<SharedPreferenceHelper>().getIdUser &&
    //       message.receiverId == sl<SharedPreferenceHelper>().getIdUser) {
    //     final chatController = Get.find<ChatController>();
    //     chatController.getMessage(isRefresh: true);
    //   }
    // }
    //  });
    //}
  }

  ///
  /// Reset socket.
  ///
  void reSetSocket() {
    socket = io.io(
      'wss://socket1.izisoft.io',
      io.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          // .setExtraHeaders({'authorization': 'Bearer ${sl.get<SharedPreferenceHelper>().getJwtToken}'}) // headers
          .enableAutoConnect()
          .build(),
    );
  }
}
