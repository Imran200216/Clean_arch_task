// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      id: (json['id'] as num?)?.toInt(),
      body: json['body'] as String?,
      postId: (json['postId'] as num?)?.toInt(),
      likes: (json['likes'] as num?)?.toInt(),
      userEntity: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'postId': instance.postId,
      'likes': instance.likes,
      'user': instance.userEntity,
    };
