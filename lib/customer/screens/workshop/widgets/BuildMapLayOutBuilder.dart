part of 'workshop_widgets_imports.dart';

class BuildMapLayoutBuilder extends StatefulWidget {
  final double lat;
  final double lng;

  const BuildMapLayoutBuilder({Key? key, required this.lat, required this.lng})
      : super(key: key);

  @override
  State<BuildMapLayoutBuilder> createState() => _BuildMapLayoutBuilderState();
}

class _BuildMapLayoutBuilderState extends State<BuildMapLayoutBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.lng == 0.0 && widget.lat == 0.0) {
      return Center(child: MyText(title: tr(context, 'noMap'), size: 12));
    } else {
      final MapController controller = MapController(
        location: lattt.LatLng(
          widget.lat,
          widget.lng,
        ),
      );
      return InkWell(
        onTap: () => Utils.navigateToMapWithDirection(
            lat: widget.lat.toString(),
            lng: widget.lng.toString(),
            context: context),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 200,
          child: MapLayout(
            controller: controller,
            builder: (context, transformer) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Listener(
                  behavior: HitTestBehavior.opaque,
                  onPointerSignal: (event) {
                    if (event is PointerScrollEvent) {
                      final delta = event.scrollDelta;
                      controller.zoom -= delta.dy / 1000;
                      setState(() {});
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Map(
                        controller: controller,
                        builder: (context, x, y, z) {
                          final url =
                              'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
                          return CachedImage(
                            url: url,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(10),
                          );
                        },
                      ),
                      Image.asset(
                        Res.location,
                        scale: 3,
                      )
                      // Icon(Icons.location_on,color: Colors.red,)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
