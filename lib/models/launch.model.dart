import 'package:flutter/foundation.dart';

class LaunchModel {
  final String id;
  final String status;
  final String details;
  final String rocketId;
  final String launchDate;
  final String launchPadId;
  final String missionName;
  final String smallMissionPatch;
  final String largeMissionPatch;

  LaunchModel({
    @required this.id,
    @required this.status,
    @required this.details,
    @required this.rocketId,
    @required this.launchDate,
    @required this.launchPadId,
    @required this.missionName,
    @required this.smallMissionPatch,
    @required this.largeMissionPatch,
  });

  LaunchModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        status = json['upcoming']
            ? 'upcoming'
            : json['success']
                ? 'success'
                : 'failure',
        details = json['details'],
        rocketId = json['rocket'],
        launchDate = json['date_utc'],
        launchPadId = json['launchpad'],
        missionName = json['name'],
        smallMissionPatch = json['links']['patch']['small'],
        largeMissionPatch = json['links']['patch']['large'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'details': details,
        'rocketId': rocketId,
        'launchDate': launchDate,
        'launchPadId': launchPadId,
        'missionName': missionName,
        'smallMissionPatch': smallMissionPatch,
        'largeMissionPatch': largeMissionPatch,
      };
}
