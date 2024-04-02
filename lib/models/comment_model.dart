import 'package:test_intern/models/board_model.dart';

class CommentModel {
  String? id;
  String? userId;
  String? taskId;
  String? content;
  List<String>? mention;
  String? reply;
  List<Emote>? emote;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  int? v;

  CommentModel({
    this.id,
    this.userId,
    this.taskId,
    this.content,
    this.mention,
    this.reply,
    this.emote,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  CommentModel copyWith({
    String? id,
    String? userId,
    String? taskId,
    String? content,
    List<String>? mention,
    String? reply,
    List<Emote>? emote,
    bool? isDelete,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return CommentModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      taskId: taskId ?? this.taskId,
      content: content ?? this.content,
      mention: mention ?? this.mention,
      reply: reply ?? this.reply,
      emote: emote ?? this.emote,
      isDelete: isDelete ?? this.isDelete,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'taskId': taskId,
      'content': content,
      'mention': mention,
      'reply': reply,
      'emote': emote,
    };
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      taskId: json['taskId'] as String?,
      content: json['content'] as String?,
      mention: (json['mention'] as List<dynamic>?)?.map((e) => e as String).toList(),
      reply: json['reply'] as String?,
      emote: (json['emote'] as List<dynamic>?)?.map((e) => Emote.fromJson(e as Map<String, dynamic>)).toList(),
      isDelete: json['isDelete'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  @override
  String toString() =>
      "CommentModel(id: $id,userId: $userId,taskId: $taskId,content: $content,mention: $mention,reply: $reply,emote: $emote,isDelete: $isDelete,createdAt: $createdAt,updatedAt: $updatedAt,v: $v)";

  @override
  int get hashCode =>
      Object.hash(id, userId, taskId, content, mention, reply, emote, isDelete, createdAt, updatedAt, v);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          taskId == other.taskId &&
          content == other.content &&
          mention == other.mention &&
          reply == other.reply &&
          emote == other.emote &&
          isDelete == other.isDelete &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          v == other.v;
  List<Emote> listReaction(String idUser, List<Emote> listEmote, String emoteCode) {
    if (listEmote.isEmpty) {
      listEmote.add(Emote(userId: idUser, emoteCode: emoteCode));
    } else {
      for (int i = 0; i < listEmote.length;) {
        if (listEmote[i].userId == idUser) {
          listEmote[i].emoteCode = emoteCode;
          break;
        } else {
          listEmote.add(Emote(userId: idUser, emoteCode: emoteCode));
          break;
        }
      }
    }
    return listEmote;
  }
}

class Emote {
  String? id;
  String? emoteCode;
  String? userId;

  Emote({
    this.id,
    this.emoteCode,
    this.userId,
  });

  Emote copyWith({
    String? id,
    String? emoteCode,
    String? userId,
  }) {
    return Emote(
      id: id ?? this.id,
      emoteCode: emoteCode ?? this.emoteCode,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'emoteCode': emoteCode,
      'userId': userId,
    };
  }

  factory Emote.fromJson(Map<String, dynamic> json) {
    return Emote(
      id: json['_id'] as String?,
      emoteCode: json['emoteCode'] as String?,
      userId: json['userId'] as String?,
    );
  }
  // truyền userId lấy emoteCode
  String getEmote(String userId, List<Emote> emoteComment) {
    for (int i = 0; i < emoteComment.length; i++) {
      if (emoteComment[i].userId == userId) {
        return emoteComment[i].emoteCode!;
      }
    }
    return "";
  }

  @override
  String toString() => "Emote(id: $id,emoteCode: $emoteCode,userId: $userId)";

  @override
  int get hashCode => Object.hash(id, emoteCode, userId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Emote &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          emoteCode == other.emoteCode &&
          userId == other.userId;
}

// list reaction truyền idUser kiểm tra nếu chua có thì add có r thì update

enum ReactionType { OK, LOVE, HAHA, CRY, WOW, ANGRY }

final reactionValues = EnumValues({
  'OK': ReactionType.OK,
  'LOVE': ReactionType.LOVE,
  'HAHA': ReactionType.HAHA,
  'CRY': ReactionType.CRY,
  'WOA': ReactionType.WOW,
  'ANGRY': ReactionType.ANGRY
});
