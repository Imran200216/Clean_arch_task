import 'package:json_annotation/json_annotation.dart';
import 'package:post_clean_arch/features/comments/domain/entities/comments_entity.dart';
import 'user_model.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class CommentsModel extends CommentsEntity {
  final int? id;

  final String? body;

  final int? postId;

  final int? likes;

  @JsonKey(name: 'user')
  final UserModel? userEntity;

  CommentsModel({this.id, this.body, this.postId, this.likes, this.userEntity})
    : super(id, body, postId, likes, userEntity);

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}
