import 'dart:developer';

import 'package:test_intern/models/comment_model.dart';
import 'package:test_intern/presentation/pages/task/task_detail.controller.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:test_intern/resources/export/core_export.dart';

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
    }
  }

  void listen_to(String taskId) {
    socket.onConnect(
      (_) {
        print("Socket connected");
        _onListenChannels(taskId);
      },
    );
  }

  void _onListenChannels(String taskId) {
    if (!socket.hasListeners('predo_update_comment')) {
      socket.on('predo_update_comment', (data) async {
        data = CommentModel.fromJson(data as Map<String, dynamic>);
        log("taskID: $taskId");
        log("dataID: ${data.taskId}");
        if (data.taskId == taskId) {
          // cập nhật lại comment
          if (Get.isRegistered<TaskDetailController>()) {
            final taskDetailController = Get.find<TaskDetailController>();
            taskDetailController.getComments();
          }
        }
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
      EndPoints.SOCKET_URL,
      io.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          // .setExtraHeaders({'authorization': 'Bearer ${sl.get<SharedPreferenceHelper>().getJwtToken}'}) // headers
          .enableAutoConnect()
          .build(),
    );
  }

  void resetSocket() {
    log("Reset socket");
    socket.io.disconnect(); // Reconnect the socket manually.
  }
}
