enum Endpoint { launches, rocket, launchPad }

class API {
  static const String v = 'v4';
  static final String host = 'api.spacexdata.com';

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _paths[endpoint],
      );

  static const Map<Endpoint, String> _paths = {
    Endpoint.launches: '$v/launches',
    Endpoint.rocket: '$v/rockets/:id',
    Endpoint.launchPad: '$v/launchpads/:id',
  };
}
