import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../routes.dart';
import 'package:spaceX/utils/date.util.dart';
import 'package:spaceX/models/launch.model.dart';
import 'package:spaceX/screens/launch_details.screen.dart';

class LaunchCardWidget extends StatelessWidget {
  final LaunchModel launch;

  const LaunchCardWidget({Key key, this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.launchDetails,
                  arguments: LaunchDetailsScreenArgs(launch: launch));
            },
            child: Card(
              elevation: 8.0,
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: launch.smallMissionPatch != null
                            ? CachedNetworkImage(
                                imageUrl: launch.smallMissionPatch,
                                placeholder: (context, url) => Center(
                                  child: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                        'assets/images/default-image.jpg'),
                              )
                            : Image.asset('assets/images/default-image.jpg'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(6.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              launch.missionName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              launch.launchDate != ''
                                  ? formattedDateTime(
                                      dateTime: launch.launchDate)
                                  : '',
                            ),
                            FlatButton(
                              height: 25,
                              color: launch.status == 'success'
                                  ? Color(0xFF33AA44)
                                  : launch.status == 'failure'
                                      ? Color(0xFFAA3344)
                                      : Color(0xFF3344AA),
                              textColor: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () {},
                              child: Text(
                                launch.status,
                                style: TextStyle(fontSize: 10.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
