// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      tokenType: json['token_type'] as String,
      expiresIn: json['expires_in'] as int,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
    };
