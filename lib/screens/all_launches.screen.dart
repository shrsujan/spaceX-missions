import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spaceX/models/launch.model.dart';
import 'package:spaceX/widgets/launch_card.widget.dart';
import 'package:spaceX/repositories/launch.repository.dart';
import 'package:spaceX/utils/widgets/alert_dialog.util.dart';

class AllLaunchesScreen extends StatefulWidget {
  @override
  _AllLaunchesScreenState createState() => _AllLaunchesScreenState();
}

class _AllLaunchesScreenState extends State<AllLaunchesScreen> {
  bool _isLoading = true;
  List<LaunchModel> _allLaunches = [];
  LaunchRepository _launchRepository;

  @override
  void initState() {
    super.initState();

    _launchRepository = Provider.of<LaunchRepository>(context, listen: false);
    _allLaunches = _launchRepository.getAllLaunchesCachedData();

    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final List<LaunchModel> allLaunches =
          await _launchRepository.getAllLaunches();
      setState(() => {_allLaunches = allLaunches});
    } on SocketException {
      showAlertDialog(
          context: context,
          title: 'Connection Error',
          content: 'Could not retrieve data. Please try again later.',
          defaultActionText: 'OK');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SpaceX Missions'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            if (_allLaunches.length > 0)
              for (var launch in _allLaunches) LaunchCardWidget(launch: launch)
            else if (_isLoading)
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Column(
                    children: [
                      Text('You may be cut-off from the internet.'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Please contact support or try again later.')
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
