import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

String formattedDateTime({@required String dateTime, bool showTime = true}) {
  if (dateTime == null) {
    return '';
  }

  final formatter = DateFormat.yMd();
  if (showTime) {
    formatter.add_Hms();
  }

  return formatter.format(DateTime.parse(dateTime));
}
