import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';

class BodyMap extends StatefulWidget {
  const BodyMap({Key? key}) : super(key: key);

  @override
  State<BodyMap> createState() => _BodyMapState();
}

class _BodyMapState extends State<BodyMap> {
  late final String avatar;
  String mapTheme = '';
  late final LatLng _center;

  final Completer<GoogleMapController> mapController = Completer();

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapTheme);
    mapController.complete(controller);
  }

  // TODO custom Marker
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    //Get my position
    addCustomIcon();
    _center = const LatLng(48.872293, 2.365574);
    //Get friends position

    //Set map theme
    DefaultAssetBundle.of(context)
        .loadString('assets/maptheme/snap_theme.json')
        .then((value) {
      mapTheme = value;
    });
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(5, 5)), 'assets/images/bitmoji2.png')
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        markers: {
          Marker(
            markerId: const MarkerId("marker1"),
            position: _center,
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            // To do: custom marker icon
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker2"),
            position: const LatLng(48.894293, 2.465674),
            icon: markerIcon,
          ),
        },
    );
  }
}
