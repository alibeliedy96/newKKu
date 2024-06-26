import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class TrackingBusView extends StatefulWidget {
  const TrackingBusView({super.key});

  @override
  State<TrackingBusView> createState() => _TrackingBusViewState();
}

class _TrackingBusViewState extends State<TrackingBusView> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: 350.h,
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);}
      ),
    );
  }
}
