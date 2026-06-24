part of 'reservation_confirmation_imports.dart';

class ReservationConfirmation extends StatefulWidget {
  final String providerId;

  const ReservationConfirmation({required this.providerId});

  @override
  State<ReservationConfirmation> createState() =>
      _ReservationConfirmationState();
}

class _ReservationConfirmationState extends State<ReservationConfirmation> {
  final ReservationConfirmationData reservationConfirmationData =
      ReservationConfirmationData();

  @override
  void initState() {
    reservationConfirmationData.getServiceCartDetails(
        context, widget.providerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      children: [
        DefaultAppBar(title: tr(context, 'confirmReservation')),
        Flexible(
            child: BlocBuilder<GenericBloc<CartServiceDetailsModel?>,
                GenericState<CartServiceDetailsModel?>>(
          bloc: reservationConfirmationData.cartServiceDetailsModelsCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  WorkShopItem(
                      image: state.data?.placeImage ?? '',
                      placeName: state.data?.placeName ?? '',
                      location: state.data?.cityName ?? ''),
                  state.data!.services!.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.data!.services!.length,
                          itemBuilder: (context, index) {
                            return ServiceDetailsItem(
                              servicesItem: state.data!.services![index],
                              reservationConfirmationData:
                                  reservationConfirmationData,
                              index: index,
                            );
                          })
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Center(
                            child: MyText(
                              title: tr(context, 'noServices'),
                              size: 19,
                              color: MyColors.primary,
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                      color: Color(0xff5D34367F),
                      height: 3,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          title: tr(context, 'paymentMethod'),
                          size: 12,
                          fontWeight: FontWeight.bold,
                          color: MyColors.primary,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(Res.coin, scale: 2.5),
                                SizedBox(width: 5),
                                BlocBuilder<GenericBloc<PaymentMethodEnum>, GenericState<PaymentMethodEnum>>(
                                  bloc: PaymentMethodData().paymentMethodCubit,
                                  builder: (context, state) {
                                    return MyText(
                                      title: tr(context, state.data.name),
                                      size: 12,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primary,
                                    );
                                  },
                                ),
                              ],
                            ),
                            DefaultButton(
                              height: 30,
                              width: 100,
                              margin: EdgeInsets.zero,
                              onTap: () {
                                Nav.navigateTo(
                                  PaymentMethod(),
                                  navigatorType: NavigatorType.push,
                                );
                              },
                              fontSize: 12,
                              title: tr(context, 'change'),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(color: MyColors.primary));
            }
          },
        ))
      ],
      bottom: DefaultButton(
        height: 56,
        margin: EdgeInsets.zero,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        onTap: () =>
            reservationConfirmationData.saveOrder(context, widget.providerId),
        title: tr(context, 'book'),
      ),
    );
  }
}
