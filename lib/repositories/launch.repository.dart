import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spaceX/constants/api.dart';
import 'package:spaceX/models/launch.model.dart';
import 'package:spaceX/models/rocket.model.dart';
import 'package:spaceX/services/api_service.dart';
import 'package:spaceX/models/launchPad.model.dart';
import 'package:spaceX/services/data_cache.service.dart';

class LaunchRepository {
  final APIService apiService;
  final DataCacheService dataCacheService;

  LaunchRepository({
    @required this.apiService,
    @required this.dataCacheService,
  });

  Future<List<LaunchModel>> getAllLaunches() async {
    try {
      final List<dynamic> data =
          await apiService.fetchEndpointData(endpoint: Endpoint.launches);

      final allLaunches = <LaunchModel>[];

      data.forEach((launch) {
        allLaunches.insert(allLaunches.length, LaunchModel.fromJson(launch));
      });

      // save to cache
      await dataCacheService.setData('allLaunches', json.encode(allLaunches));

      return allLaunches;
    } catch (e) {
      rethrow;
    }
  }

  List<LaunchModel> getAllLaunchesCachedData() {
    final allLaunches = <LaunchModel>[];
    String allLaunchesCachedData = dataCacheService.getData('allLaunches');

    if (allLaunchesCachedData != null) {
      final List<dynamic> data = jsonDecode(allLaunchesCachedData);
      data.forEach((launch) {
        allLaunches.insert(
          allLaunches.length,
          LaunchModel(
            id: launch['id'],
            status: launch['status'],
            details: launch['details'],
            rocketId: launch['rocketId'],
            launchDate: launch['launchDate'],
            launchPadId: launch['launchPadId'],
            missionName: launch['missionName'],
            smallMissionPatch: launch['smallMissionPatch'],
            largeMissionPatch: launch['largeMissionPatch'],
          ),
        );
      });
    }

    return allLaunches;
  }

  Future<RocketModel> getRocket({@required rocketId}) async {
    try {
      final dynamic data = await apiService.fetchEndpointData(
          endpoint: Endpoint.rocket, urlParams: {'id': rocketId});

      return RocketModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<LaunchPadModel> getLaunchPad({@required launchPadId}) async {
    try {
      final dynamic data = await apiService.fetchEndpointData(
          endpoint: Endpoint.launchPad, urlParams: {'id': launchPadId});

      return LaunchPadModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
