import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';

Location _location = Location();
late bool _service;
late PermissionStatus _permissionStatus;
late LocationData _locationData;

Future getLocate() async {
  _service = await _location.serviceEnabled();
  if (!_service) {
    _service = await _location.requestService();
  }

  _permissionStatus = await _location.hasPermission();
  if (_permissionStatus == PermissionStatus.denied) {
    _permissionStatus = await _location.requestPermission();
    if (_permissionStatus == PermissionStatus.granted) {
      return FlutterError("Permission failed");
    }
  }

  _locationData = await _location.getLocation();
}

double? getlati() {
  return _locationData.latitude;
}

double? getlong() {
  return _locationData.longitude;
}

class QrGen extends StatelessWidget {
  const QrGen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? lati = getlati();
    double? long = getlong();
    DateTime x = DateTime.now();
    x.minute + 10;
    print(x);
    DateFormat('HH:mm::ss').format(x);
    final String _data =
        "65109010303\nคุณ\nฤกษ์พศวัฒน์ สัจจาพันธุ์\nKhun.\nROEKPASAWAT SAJJAPAN\n900\n\n$lati\n$long\n";
    return Scaffold(
      body: Center(
        child: QrImage(
          data: _data,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
