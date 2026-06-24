part of 'reservation_confirmation_imports.dart';

class ReservationConfirmationData {
  final GenericBloc<CartServiceDetailsModel?> cartServiceDetailsModelsCubit =
      GenericBloc(null);

  Future<CartServiceDetailsModel?> getServiceCartDetails(
      BuildContext context, String providerId) async {
    CartServiceDetailsModel cartServicesDetails =
        await CustomerRepository(context).getServiceCartDetails(providerId);
    cartServiceDetailsModelsCubit.onUpdateData(cartServicesDetails);
    return cartServiceDetailsModelsCubit.state.data;
  }

  void removeItemFromCart(BuildContext context, int id) async {
    var data = await CustomerRepository(context).removeServiceFromCart(id);
    if (data) {
      cartServiceDetailsModelsCubit.state.data!.services!
          .removeWhere((element) => element.id == id);
      cartServiceDetailsModelsCubit
          .onUpdateData(cartServiceDetailsModelsCubit.state.data!);
      if (cartServiceDetailsModelsCubit.state.data!.services!.length == 0) {
        Nav.navigateTo( Home(), navigatorType: NavigatorType.pushAndPopUntil);
        context.read<SettingCubit>().onUpdateSettingData(SettingModel(
            productCart: context.read<SettingCubit>().state.model.serviceCart,
            serviceCart: false,
            notifications:
                context.read<SettingCubit>().state.model.notifications));
      }
    }
  }

  void saveOrder(BuildContext context, String providerId) async {
    var user = context.read<UserCubit>().state.model;
    var lang = context.read<LangCubit>().state.locale.languageCode;
    CreateServiceOrderModel model = CreateServiceOrderModel(
        providerId: providerId,
        typePay: 1,
        lat: user.lat,
        lng: user.lng,
        location: user.location,
        copon: '',
        lang: lang);

    var data = await CustomerRepository(context).createServiceOrder(model);
    if (data) {
      Nav.navigateTo( Success(), navigatorType: NavigatorType.push);
    }
  }
}
