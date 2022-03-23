import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  Map({Key? key, required this.name, required this.position}) : super(key: key);

  String name;
  LatLng position;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  static const _initialCamaraPosition = CameraPosition(
    target: LatLng(18.502066, -69.8364374),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;

  Set<Marker> markers = {};

  myMarker() async {
    markers.add(
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(widget.position.latitude, widget.position.longitude),
        infoWindow: InfoWindow(
          title: widget.name,
        ),
      ),
    );
  }

  @override
  void initState() {
    myMarker();
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCamaraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(
                    widget.position.latitude,
                    widget.position.longitude,
                  ),
                  zoom: 11,
                ),
              ),
            );
          });
        },
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
