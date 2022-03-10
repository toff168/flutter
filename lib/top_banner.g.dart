// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopBanner _$TopBannerFromJson(Map<String, dynamic> json) => TopBanner(
      json['errno'] as int,
      json['request_id'] as String,
      json['timestamp'] as int,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopBannerToJson(TopBanner instance) => <String, dynamic>{
      'errno': instance.errno,
      'request_id': instance.requestId,
      'timestamp': instance.timestamp,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      Ad.fromJson(json['ad'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ad': instance.ad,
    };

Ad _$AdFromJson(Map<String, dynamic> json) => Ad();

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{};
