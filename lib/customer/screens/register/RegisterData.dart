part of 'RegisterImports.dart';

class RegisterData {
  final GenericBloc<File?> imageCubit = new GenericBloc(null);
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);
  final GenericBloc<bool> confirmPasswordBloc = GenericBloc(true);
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController location = TextEditingController();
  final LocationCubit locationCubit = LocationCubit();
  final GenericBloc<List<CityModel>> citiesCubit = new GenericBloc([]);
  final GenericBloc<CityModel?> selectCityCubit = new GenericBloc(null);

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

  final GlobalKey<DropdownSearchState> cityKey = new GlobalKey();

  GenericBloc<bool> checkCubit = GenericBloc(false);

  CityModel? cityModel;

  void selectCity(CityModel? model) {
    cityModel = model != null ? model : null;
  }

  setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  userRegister(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? _token = await messaging.getToken().timeout(const Duration(seconds: 3), onTimeout: () => "").catchError((e) => "");
    var lang = context.read<LangCubit>().state.locale.languageCode;

    if (formKey.currentState!.validate()) {
      if (cityModel == null) {
        CustomToast.showSimpleToast(msg: tr(context, "pleaseSelectCity"));
      } else {
        if (!checkCubit.state.data) {
          CustomToast.showSimpleToast(msg: tr(context, "didYouAcceptTerms"));
        } else {
          RegisterModel model = RegisterModel(
              userName: name.text,
              phone: phone.text,
              email: email.text,
              cityId: cityModel!.id,
              password: password.text,
              deviceId: _token!,
              deviceType: Platform.isAndroid ? 'android' : 'ios',
              projectName: 'Heide',
              lang: lang,
              lat: lat!,
              lng: lng!,
              location: location.text);
          var data = await CustomerRepository(context).register(model);
          if (data != null) {
            CustomToast.showSimpleToast(msg: tr(context, 'pleaseEnterActivationCode'));
            Nav.navigateTo( ActiveAccount(userId: data['userId']),
                navigatorType: NavigatorType.push);
          }
        }
      }
    }
  }
}
