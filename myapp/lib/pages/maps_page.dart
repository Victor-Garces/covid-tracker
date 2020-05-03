import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  MapController mapController;
  double zoom;
  LatLng point = LatLng(18.449922, -69.974949);

  @override
  void initState() {
    super.initState();
    zoom = 17;
    mapController = MapController();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.getLocation().then((location) {
      setState(() {
        point.latitude = location.latitude;
        point.longitude = location.longitude;
        mapController.move(point, zoom);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getMap(),
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context, point);
        },
        icon: Icon(Icons.check),
        label: Text('Confirmar'),
      ),
    );
  }

  Widget getMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        onTap: (value) {
          setState(() {
            point = value;
          });
        },
        center: point,
        zoom: zoom,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(markers: [
          Marker(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: 40,
            width: 40,
            point: point,
            builder: (ctx) => Icon(
              Icons.location_on,
              size: 40,
            ),
          ),
        ]),
      ],
    );
  }
}
