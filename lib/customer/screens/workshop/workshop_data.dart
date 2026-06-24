part of 'workshop_imports.dart';

class WorkshopData {
  final GenericBloc<int> index = new GenericBloc(0);
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController location = TextEditingController();

  final GenericBloc<DateTime> dateCubit = GenericBloc(DateTime.now());
  final GenericBloc<HijriDateTime> hijriDateCubit =
      GenericBloc(HijriDateTime.now());
  final GenericBloc<DateTime> focusedDateCubit = GenericBloc(DateTime.now());
  final GenericBloc<String> selectedDateCubit = GenericBloc("");
  final GenericBloc<String> selectedHijriDateCubit = GenericBloc("");
  final GenericBloc<String> selectedTimeCubit = GenericBloc("");
  final GenericBloc<bool> isBooked = GenericBloc(false);
  final GenericBloc<List<ProviderOffersModel>> providerOffersModelsCubit =
      GenericBloc([]);
  final GenericBloc<List<ProviderServicesModel>> providerServicesModelsCubit =
      GenericBloc([]);
  final GenericBloc<List<ProviderDatesModel>> providerDatesModelsCubit =
      GenericBloc([]);
  final GenericBloc<bool> inHome = GenericBloc(false);

  final LocationCubit locationCubit = LocationCubit();

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  void onSelectData(DateTime selectedDay, DateTime focusedDay) {
    selectedDateCubit
        .onUpdateData(DateFormat("yyyy-MM-dd", "en").format(selectedDay));
    dateCubit.onUpdateData(selectedDay);
    focusedDateCubit.onUpdateData(focusedDay);
    dateController.text = selectedDateCubit.state.data.toString();
  }

  void changeDate(DateTime date, BuildContext context) {
    selectedDateCubit.onUpdateData(DateFormat("yyyy-MM-dd", "en").format(date));
    dateController.text = selectedDateCubit.state.data;
    Navigator.of(context).pop();
  }

  void changeHijriDate(String date, BuildContext context) {
    selectedDateCubit.onUpdateData(date);
    dateController.text = selectedDateCubit.state.data;
    // Navigator.of(context).pop();
  }

  void changeTime(BuildContext context , DateTime time) {
    selectedTimeCubit.onUpdateData(DateFormat('hh:mm a').format(time));
    String selectedTimeStr = selectedTimeCubit.state.data.replaceRange(
        selectedTimeCubit.state.data.length - 2,
        selectedTimeCubit.state.data.length,
        selectedTimeCubit.state.data.contains('AM') ? tr(context, 'am') : tr(context, 'pm'));
    timeController.text = selectedTimeStr;
  }

  void addServiceToCart(
      BuildContext context, int mainIndex, int subIndex, int serviceId) async {
    if (formKey.currentState!.validate()) {
      AddServiceToCartModel model = AddServiceToCartModel(
          serviceId: serviceId,
          date: dateController.text,
          time: timeController.text.contains('ص')
              ? timeController.text.replaceAll('ص', 'AM')
              : timeController.text.contains('م')
                  ? timeController.text.replaceAll('م', 'PM')
                  : timeController.text,
          lat: lat,
          lng: lng,
          location: location.text,
          notInSalon: inHome.state.data);
      var data = await CustomerRepository(context).addServiceToCart(model);
      if (data) {
        providerServicesModelsCubit
            .state.data[mainIndex].services![subIndex].inMyCart = true;
        providerServicesModelsCubit
            .onUpdateData(providerServicesModelsCubit.state.data);
        dateController.clear();
        timeController.clear();
        isBooked.onUpdateData(true);
        Navigator.of(context).pop();
      }
    }
  }

  void addClubServiceToCart(BuildContext context, int mainIndex, int subIndex,
      int serviceId, String date) async {
    selectedDateCubit.onUpdateData(date);
    AddServiceToCartModel model = AddServiceToCartModel(
        serviceId: serviceId, date: selectedDateCubit.state.data);

    var data = await CustomerRepository(context).addServiceToCart(model);
    if (data) {
      providerServicesModelsCubit
          .state.data[mainIndex].services![subIndex].inMyCart = true;
      providerServicesModelsCubit
          .onUpdateData(providerServicesModelsCubit.state.data);
      isBooked.onUpdateData(true);
      Navigator.of(context).pop();
    }
  }

  Future<List<ProviderOffersModel>> getProviderOffers(
      BuildContext context, String providerId) async {
    List<ProviderOffersModel> providerOffers =
        await CustomerRepository(context).getProvidersOffers(providerId);
    providerOffersModelsCubit.onUpdateData(providerOffers);
    return providerOffersModelsCubit.state.data;
  }

  Future<List<ProviderServicesModel>> getProviderServices(
      BuildContext context, String providerId, int categoryType , int serviceId) async {
    List<ProviderServicesModel> providerServices =
        await CustomerRepository(context)
            .getProviderServices(providerId, categoryType , serviceId);
    providerServicesModelsCubit.onUpdateData(providerServices);
    return providerServicesModelsCubit.state.data;
  }

  Future<List<ProviderDatesModel>> getProviderDates(
      BuildContext context, String providerId) async {
    List<ProviderDatesModel> providerDatesServices =
        await CustomerRepository(context).getProviderDates(providerId);
    providerDatesModelsCubit.onUpdateData(providerDatesServices);
    return providerDatesModelsCubit.state.data;
  }

  String? address;
  String? lat;
  String? lng;

  onLocationClick(BuildContext context) async {
    LoadingDialog.showLoadingDialog();
    var loc = await Utils.getCurrentLocation();
    locationCubit.onLocationUpdated(LocationModel(
      lat: loc?.latitude ?? 24.774265,
      lng: loc?.longitude ?? 46.738586,
      address: "",
    ));
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (cxt) => BlocProvider.value(
          value: locationCubit,
          child: LocationAddress(),
        ),
      ),
    );
    EasyLoading.dismiss();
  }

  bool servicesIsEmpty() {
    bool isEmpty = false;
    providerServicesModelsCubit.state.data.forEach((element) {
      if (element.services!.isNotEmpty) isEmpty = true;
      return;
    });
    return isEmpty;
  }
}
