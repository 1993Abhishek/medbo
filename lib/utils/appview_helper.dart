import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

void mPrint(Object object, {String tag = "", bool printOn = true}) {
  if (!printOn) return;
  debugPrint("[$tag] :: $object");
}
Widget vSpacing(double dimen) {
  return Container(
    height: dimen,
    width: 0,
  );
}

Widget hSpacing(double dimen) {
  return Container(
    height: 0,
    width: dimen,
  );
}
showToast({@required String message}) {
  Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
}