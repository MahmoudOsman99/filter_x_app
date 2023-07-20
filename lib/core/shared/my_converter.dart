import 'package:cloud_firestore/cloud_firestore.dart';

class MyConverter {
  static DateTime convertFromTimestampToDateTime(Timestamp timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
}
