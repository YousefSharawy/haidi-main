part of 'workshop_widgets_imports.dart';

class LocationSalonView extends StatelessWidget {
  // final BoutiqueModel model;

  const LocationSalonView();

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controller = Completer();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                double.parse('24.774265'),
                double.parse('46.738586'),
              ),
              zoom: 16.4746,
            ),
            onMapCreated: (GoogleMapController controller1) {
              controller.complete(controller1);
            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: true,
            buildingsEnabled: true,
            compassEnabled: true,
            mapToolbarEnabled: true,
          ),
          ImageIcon(AssetImage(Res.search),
              size: 50, color: MyColors.secondary),
        ],
      ),

      // CachedImage(
      //     fit: BoxFit.fill,
      //     height: 150,
      //     url:
      //     'https://ak.picdn.net/shutterstock/videos/1029408410/thumb/1.jpg'),
    );
  }
}
