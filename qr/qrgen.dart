import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:location/location.dart';

class GetLocation {
  Location _location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionStatus;
  late LocationData _locationData;

  //*=====================REQUEST-SERVICE======================//
  service() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        print("service Error");
      }
    }

    _permissionStatus = await _location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await _location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        print("Permission Error");
      }
    }
    _locationData = await _location.getLocation();
  }
}

class QrGen extends StatefulWidget {
  const QrGen({super.key});

  @override
  State<QrGen> createState() => _QrGenState();
}

class _QrGenState extends State<QrGen> {
  @override
  Widget build(BuildContext context) {
    GetLocation getLocation = GetLocation();
    var x = getLocation._locationData;
    print("$x");
    String _data = "";
    return Scaffold(
      body: Center(child: Container(width: 200, child: QrImage(data: _data))),
    );
  }
}
