import 'package:json_annotation/json_annotation.dart';

part 'top_banner.g.dart';


@JsonSerializable()
class TopBanner extends Object {

  @JsonKey(name: 'errno')
  int errno;

  @JsonKey(name: 'request_id')
  String requestId;

  @JsonKey(name: 'timestamp')
  int timestamp;

  @JsonKey(name: 'data')
  Data data;

  TopBanner(this.errno,this.requestId,this.timestamp,this.data,);

  factory TopBanner.fromJson(Map<String, dynamic> srcJson) => _$TopBannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopBannerToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'ad')
  Ad ad;

  Data(this.ad,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Ad extends Object {

  Ad();

  factory Ad.fromJson(Map<String, dynamic> srcJson) => _$AdFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AdToJson(this);

}


