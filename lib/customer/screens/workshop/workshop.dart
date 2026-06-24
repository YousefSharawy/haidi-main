part of 'workshop_imports.dart';

class Workshop extends StatefulWidget {
  final int serviceId;
  final int categoryType;
  final String placeName;
  final String name;
  final String providerName;
  final String providerImage;
  final String cityName;
  final num rate;
  final String providerId;
  final String description;
  final double lng;
  final double lat;
  final String img;

  Workshop({
    this.serviceId = 0,
    required this.providerId,
    required this.placeName,
    required this.cityName,
    this.name = '',
    required this.rate,
    required this.description,
    required this.providerName,
    required this.providerImage,
    required this.categoryType,
    required this.lng,
    required this.lat,
    this.img = '',
  });

  @override
  State<Workshop> createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {
  final WorkshopData workshopData = WorkshopData();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: workshopData.index,
        builder: (context, indexState) {
          return HomeScaffold(
            children: [
              SizedBox(height: 10),
              DefaultAppBar(
                title: widget.name,
                haveCartIConButton: true,
              ),
              Flexible(
                  child: ListView(
                      padding: EdgeInsets.only(
                          left: 15, bottom: 40, right: 15, top: 20),
                      children: [
                    WorkshopImage(
                      providerImage: widget.img,
                    ),
                    WorkshopTabBar(workshopData: workshopData),
                    indexState.data == 0
                        ? InformationWidget(
                            placeName: widget.placeName,
                            cityName: widget.cityName,
                            rate: widget.rate,
                            providerId: widget.providerId,
                            description: widget.description,
                            workshopData: workshopData,
                            lat: widget.lat,
                            lng: widget.lng,
                          )
                        : indexState.data == 1
                            ? ProviderServices(
                                serviceId: widget.serviceId,
                                categoryType: widget.categoryType,
                                workshopData: workshopData,
                                providerId: widget.providerId)
                            : Offers(
                                workshopData: workshopData,
                                providerId: widget.providerId),
                  ]))
            ],
            bottom: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: workshopData.isBooked,
              builder: (context, state) {
                return Visibility(
                  visible: state.data && indexState.data == 1,
                  child: DefaultButton(
                    height: 56,
                    margin: EdgeInsets.zero,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    onTap: () => Nav.navigateTo(Cart(),
                        navigatorType: NavigatorType.push),
                    title: tr(context, 'viewCart'),
                  ),
                );
              },
            ),
          );
        });
  }
}
