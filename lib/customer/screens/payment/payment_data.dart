part of 'payment_imports.dart';

class PaymentData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController location = TextEditingController();
  final LocationCubit locationCubit = LocationCubit();
  final GenericBloc<int> paymentSelect = GenericBloc(0);
  final GenericBloc<String> discount = GenericBloc('');

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

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Res.successCheck,
                  scale: 4.5,
                ),
                MyText(
                    title: 'تم ارسال طلبك بنجاح',
                    size: 18,
                    fontWeight: FontWeight.bold),
                MyText(
                  title:
                      'هذا النص هو مثال للنص يمكن ان يستبدل في نفس المساحة لقد تم ن',
                  size: 10,
                  color: Color(0xffA4A4A4),
                  alien: TextAlign.center,
                ),
                InkWell(
                  onTap: () => Nav.navigateTo( Home(),
                      navigatorType: NavigatorType.pushAndPopUntil),
                  child: MyText(
                    title: 'الرجوع للرئيسية',
                    size: 14,
                    decoration: TextDecoration.underline,
                    color: MyColors.primary,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void createProductOrder(
      BuildContext context, String providerId, String? copon) async {
    if (formKey.currentState!.validate()) {
      var lang = context.read<LangCubit>().state.locale.languageCode;
      CreateProductOrderModel model = CreateProductOrderModel(
        providerId: providerId,
        typePay: paymentSelect.state.data,
        lat: lat,
        lng: lng,
        location: location.text,
        copon: copon ?? '',
        lang: lang,
      );
      print(model.toJson());
      var data = await CustomerRepository(context).createProductOrder(model);
      if(data) {
        showMyDialog(context);
      }
    }
  }
}
