import 'package:test_intern/models/comment_model.dart';

class EmoteComment {
  final String value;
  final String emote;
  EmoteComment({required this.value, required this.emote});
}

// truyền vào value của reaction để lấy emote tương ứng
String? getEmoteComment(String value) {
  return emoteComment.firstWhere((element) => element.value == value).emote;
}

List<EmoteComment> emoteComment = [
  EmoteComment(value: reactionValues.reverse[ReactionType.OK] ?? '', emote: "👌"),
  EmoteComment(value: reactionValues.reverse[ReactionType.LOVE] ?? '', emote: "❤️"),
  EmoteComment(value: reactionValues.reverse[ReactionType.HAHA] ?? '', emote: "😂"),
  EmoteComment(value: reactionValues.reverse[ReactionType.WOW] ?? '', emote: "😮"),
  EmoteComment(value: reactionValues.reverse[ReactionType.CRY] ?? '', emote: "😢"),
  EmoteComment(value: reactionValues.reverse[ReactionType.ANGRY] ?? '', emote: "😡"),
];
