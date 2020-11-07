import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaceX/models/launchPad.model.dart';

import 'package:spaceX/utils/date.util.dart';
import 'package:spaceX/models/launch.model.dart';
import 'package:spaceX/models/rocket.model.dart';
import 'package:spaceX/repositories/launch.repository.dart';
import 'package:spaceX/utils/widgets/alert_dialog.util.dart';
import 'package:spaceX/widgets/display_info.widget.dart';

class LaunchDetailsScreenArgs {
  LaunchDetailsScreenArgs({@required this.launch});

  final LaunchModel launch;
}

class LaunchDetailsScreen extends StatefulWidget {
  final LaunchModel launch;

  const LaunchDetailsScreen({
    Key key,
    @required this.launch,
  }) : super(key: key);

  @override
  _LaunchDetailsScreenState createState() => _LaunchDetailsScreenState(launch);
}

class _LaunchDetailsScreenState extends State<LaunchDetailsScreen> {
  final LaunchModel _launch;
  LaunchRepository _launchRepository;
  RocketModel _rocket;
  LaunchPadModel _launchPad;

  @override
  void initState() {
    super.initState();

    _launchRepository = Provider.of<LaunchRepository>(context, listen: false);
    _getRocketInfo();
    _getLaunchPadInfo();
  }

  Future _getRocketInfo() async {
    try {
      final RocketModel rocket =
          await _launchRepository.getRocket(rocketId: _launch.rocketId);
      setState(() => {_rocket = rocket});
    } on SocketException {
      showAlertDialog(
          context: context,
          title: 'Connection Error',
          content: 'Could not retrieve data. Please try again later.',
          defaultActionText: 'OK');
    } catch (_) {
      rethrow;
    }
  }

  Future _getLaunchPadInfo() async {
    try {
      final LaunchPadModel launchPad = await _launchRepository.getLaunchPad(
          launchPadId: _launch.launchPadId);
      setState(() => {_launchPad = launchPad});
    } catch (_) {
      rethrow;
    }
  }

  _LaunchDetailsScreenState(this._launch);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launch details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 350,
                height: 350,
                child: _launch.largeMissionPatch != null
                    ? CachedNetworkImage(
                        imageUrl: _launch.largeMissionPatch,
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/images/default-image.jpg'),
                      )
                    : Image.asset('assets/images/default-image.jpg'),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _launch.missionName,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DisplayInfoWidget(
                      title: 'Launch date',
                      value: formattedDateTime(dateTime: _launch.launchDate),
                    ),
                    if (_launchPad != null)
                      DisplayInfoWidget(
                        title: 'Launch site',
                        value: _launchPad.name,
                      ),
                    DisplayInfoWidget(
                      title: 'Status',
                      value: _launch.status,
                    ),
                    if (_launch.details != null)
                      DisplayInfoWidget(
                        title: 'Details',
                        value: _launch.details,
                      )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (_rocket != null)
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Rocket Infomation',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20.0,
                        ),
                      ),
                      DisplayInfoWidget(
                        title: 'Rocket name',
                        value: _rocket.name,
                      ),
                      DisplayInfoWidget(
                        title: 'Country',
                        value: _rocket.country,
                      ),
                      DisplayInfoWidget(
                        title: 'Manufacturer',
                        value: _rocket.manufacturer,
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
