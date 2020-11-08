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

  try {
    final dateTimeObj = DateTime.parse(dateTime);

    return formatter.format(dateTimeObj);
  } catch (_) {
    return '';
  }
}
