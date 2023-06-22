// To parse this JSON data, do
//
//     final getVideos = getVideosFromJson(jsonString);

import 'dart:convert';

GetVideos getVideosFromJson(String str) => GetVideos.fromJson(json.decode(str));

String getVideosToJson(GetVideos data) => json.encode(data.toJson());

class GetVideos {
  GetVideos({
    required this.data,
  });

  List<Datum> data;

  factory GetVideos.fromJson(Map<String, dynamic> json) => GetVideos(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  static List<GetVideos> decode(Map<String, dynamic> emote) =>
      emote["data"].map<GetVideos>((item) => GetVideos.fromJson(item)).toList();
}

class Datum {
  Datum({
    required this.videoId,
    required this.videoTitle,
    required this.videoLink,
    required this.videoImg,
    required this.videoStatus,
  });

  String videoId;
  String videoTitle;
  String videoLink;
  String videoImg;
  String videoStatus;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        videoId: json["video_id"],
        videoTitle: json["video_title"],
        videoLink: json["video_link"],
        videoImg: json["video_img"],
        videoStatus: json["video_status"],
      );

  Map<String, dynamic> toJson() => {
        "video_id": videoId,
        "video_title": videoTitle,
        "video_link": videoLink,
        "video_img": videoImg,
        "video_status": videoStatus,
      };
}
