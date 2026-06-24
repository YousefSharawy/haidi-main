part of 'settings_imports.dart';

class SettingData {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final GlobalKey<DropdownSearchState> cityKey = new GlobalKey();
  final TextEditingController location = TextEditingController();
  final LocationCubit locationCubit = LocationCubit();
  GenericBloc<File?> imageBloc = new GenericBloc(null);

  void getProfileImage(BuildContext context) async {
    var image = await Utils.getImage();
    if (image != null) {
      imageBloc.onUpdateData(image);
    }
  }

  void setInitUserData(BuildContext context) {
    var user = context.read<UserCubit>().state.model;
    name.text = user.userName!;
    phone.text = user.phone!;
    location.text = user.location!;
    email.text = user.email!;
    cityModel = CityModel(id: user.cityId ?? 0, name: user.cityName ?? "");
  }

  CityModel? cityModel;

  void selectCity(CityModel? model) {
    cityModel = model != null ? model : null;
  }

  String? address;
  String? lat;
  String? lng;

  void updateProfile(BuildContext context) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    UpdateProfileModel model = UpdateProfileModel(
        lang: lang,
        userName: name.text,
        location: location.text,
        lat: lat ?? '',
        lng: lng ?? '',
        email: email.text,
        phone: phone.text,
        imgProfile: imageBloc.state.data,
        cityId: cityModel?.id ?? 0);

    var data = await CustomerRepository(context).updateProfile(model);
    if (data) {
      var user = context.read<UserCubit>().state.model;
      user.cityId = cityModel?.id;
      context.read<UserCubit>().onUpdateUserData(user);
      Navigator.of(context).pop();
    }
  }

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
}
