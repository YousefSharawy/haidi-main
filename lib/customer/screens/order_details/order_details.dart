part of 'order_details_imports.dart';

class OrderDetails extends StatefulWidget {
  final int orderId;

  const OrderDetails({required this.orderId});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final OrderDetailsData orderDetailsData = OrderDetailsData();

  @override
  void initState() {
    orderDetailsData.getOrderDetailsForUser(context, widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<ServiceOrderDetailsModel?>,
            GenericState<ServiceOrderDetailsModel?>>(
        bloc: orderDetailsData.serviceOrderDetailsModelsCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return HomeScaffold(
              children: [
                DefaultAppBar(title: tr(context, 'orderDetails')),
                Flexible(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    WorkShopItem(
                        image: state.data!.providerImage ?? '',
                        placeName: state.data!.placeName ?? '',
                        cityName: state.data!.cityName!),
                    ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.data!.orderServices!.length,
                        itemBuilder: (context, index) {
                          return ServiceDetailsItem(
                              orderServices: state.data!.orderServices![index]);
                        }),
                  ],
                ))
              ],
              bottom: BuildBottomButton(
                  status: state.data!.status!,
                  orderId: widget.orderId,
                  orderDetailsData: orderDetailsData,
                  isPaid: state.data!.isPaid ?? false,
                  isExpired: state.data!.isInCancelTime ?? false,
                  isRated: state.data!.isRated ?? false),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: MyColors.primary,
            ));
          }
        });
  }
}
