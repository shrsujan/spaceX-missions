import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:spaceX/constants/api.dart';
import 'package:spaceX/utils/string.dart';

class APIService {
  final API api;

  APIService(this.api);

  Future fetchEndpointData({
    @required Endpoint endpoint,
    Map<String, dynamic> urlParams,
  }) async {
    try {
      final uri = api.endpointUri(endpoint);
      final resolvedUri = urlParams != null
          ? interpolate(uri.toString(), urlParams)
          : uri.toString();

      final response = await http.get(resolvedUri);

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        return data;
      }
      throw response;
    } catch (_) {
      rethrow;
    }
  }
}
