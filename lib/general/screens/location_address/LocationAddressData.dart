part of 'LocationAddressImports.dart';

class LocationAddressData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  late Completer<GoogleMapController> controller = Completer();
  late LocationModel locationModel;
  final GenericBloc<bool> mapType = GenericBloc(false);
  final GenericBloc<bool> showMainMarker = GenericBloc(true);
  final GenericBloc<LocationModel?> locationModelBloc = GenericBloc(null);
  final LocationCubit locationCubit = new LocationCubit();
  final GenericBloc<Set<Marker>> addMarkerCubit = new GenericBloc({});
  late GoogleMapController googleMapController;
  static const kGoogleApiKey = 'AIzaSyAUmn1DI_PvYJ_3Bo-2ZRn2iwT_tNlzxC8';
  final places_sdk.FlutterGooglePlacesSdk places =
      places_sdk.FlutterGooglePlacesSdk(kGoogleApiKey);

  void getLocationAddress(BuildContext context) async {
    LatLng loc = LatLng(locationModel.lat, locationModel.lng);
    String address = await Utils.getAddress(loc, context);
    locationModel.address = address;
    context.read<LocationCubit>().onLocationUpdated(locationModel);
  }

  ///used  to get init location

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
  /// method user to change and customize the shape of marker

  void saveChangedLocation(BuildContext context) async {
    if (locationModel.address.isEmpty) {
      CustomToast.showToastNotification(tr(context, "selectLocationOnMap"));
      return;
    }
    context
        .read<LocationCubit>()
        .onLocationUpdated(locationModel, change: true);
    Navigator.pop(context);
  }
  /// method used to save locationModel after fill it with location values(lat,lng,address).

  Future<void> getMyLocationByButtonPressed() async {
    Position? position = await Utils.getCurrentLocation();
    locationCubit.onLocationUpdated(LocationModel(
      lat: position?.latitude ?? 24.774265,
      lng: position?.longitude ?? 46.738586,
      address: "",
    ));
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position?.latitude.toDouble() ?? 0.0,
                position?.longitude.toDouble() ?? 0.0),
            zoom: 16,
            tilt: 45,
            bearing: 30.0)));
    addMarkerCubit.state.data.clear();
  }
  /// custom button used t get my current location.

  addMarker(BuildContext context, LatLng latLng) async {
    Uint8List markerImg = await getBytesFromAsset(Res.location, 5);
    addMarkerCubit.state.data.clear();
    addMarkerCubit.state.data.add(Marker(
      markerId: const MarkerId("0"),
      icon: BitmapDescriptor.fromBytes(markerImg),
      position: latLng,
      onTap: () {
      },
      // infoWindow: InfoWindow(title: address,)
    ));
    addMarkerCubit.onUpdateData(addMarkerCubit.state.data);
    showMainMarker.onUpdateData(false);
    showModalBottomSheet(
      context: context,
      builder: (_) => MarkerDetailsButtonSheet(address: 'address', title: "${latLng.latitude},${latLng.longitude}",),
      isDismissible: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
    );
  }

//******************** map by search ***************************

  Future<void> onSearchPressed(BuildContext context) async {
    final places_sdk.AutocompletePrediction? p =
        await showSearch<places_sdk.AutocompletePrediction?>(
      context: context,
      delegate: _PlacesSearchDelegate(
        places: places,
        countries: const ['eg', 'us', 'sa'],
        hint: tr(context, "search"),
      ),
    );
    if (p != null) displaySearchPrediction(p);
  }
  /// used when search get pressed.

  Future<void> displaySearchPrediction(
      places_sdk.AutocompletePrediction p) async {
    final places_sdk.FetchPlaceResponse detail = await places
        .fetchPlace(p.placeId, fields: [places_sdk.PlaceField.Location]);
    final placeLatLng = detail.place?.latLng;
    if (placeLatLng == null) return;
    googleMapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(placeLatLng.lat, placeLatLng.lng), 16.4746));
  }
  /// used to fetch & display the search results from the Google Places SDK.
}

/// Reimplements the old `PlacesAutocomplete.show` overlay (from the discontinued
/// flutter_google_places) on top of flutter_google_places_sdk, which is
/// programmatic-only. Type -> predictions -> tap returns the prediction.
class _PlacesSearchDelegate
    extends SearchDelegate<places_sdk.AutocompletePrediction?> {
  _PlacesSearchDelegate({
    required this.places,
    required this.countries,
    required this.hint,
  });

  final places_sdk.FlutterGooglePlacesSdk places;
  final List<String> countries;
  final String hint;

  @override
  String get searchFieldLabel => hint;

  @override
  List<Widget> buildActions(BuildContext context) => [
        if (query.isNotEmpty)
          IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) => _suggestions();

  @override
  Widget buildSuggestions(BuildContext context) => _suggestions();

  Widget _suggestions() {
    if (query.trim().isEmpty) return const SizedBox.shrink();
    return FutureBuilder<places_sdk.FindAutocompletePredictionsResponse>(
      future: places.findAutocompletePredictions(query, countries: countries),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final predictions = snapshot.data?.predictions ?? const [];
        return ListView.builder(
          itemCount: predictions.length,
          itemBuilder: (context, i) {
            final p = predictions[i];
            return ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: Text(p.primaryText),
              subtitle: Text(p.fullText),
              onTap: () => close(context, p),
            );
          },
        );
      },
    );
  }
}

// final apiKey = "AIzaSyDIBH6mfPQ13UnF9aZtmaUQtuu-mQcxxb0";
// static const apiKey = "AIzaSyDIBH6mfPQ13UnF9aZtmaUQtuu-mQcxxb0";
// static const apiKey = "AIzaSyAUmn1DI_PvYJ_3Bo-2ZRn2iwT_tNlzxC8";
