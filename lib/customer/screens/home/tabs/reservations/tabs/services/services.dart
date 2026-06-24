part of 'services_imports.dart';

class Services extends StatefulWidget {
  const Services();

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final ServicesData servicesData = ServicesData();

  @override
  void initState() {
    servicesData.getOrders(context, 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          servicesData.getOrders(context, servicesData.index.state.data + 1),
      child: ListView(padding: EdgeInsets.zero, children: [
        ServicesTabBar(servicesData: servicesData),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: servicesData.isLoading,
          builder: (context, boolState) {
            return !boolState.data
                ? BlocBuilder<GenericBloc<List<OrderModel>>,
                    GenericState<List<OrderModel>>>(
                    bloc: servicesData.orderModelsCubit,
                    builder: (context, state) {
                      if (state is GenericUpdateState) {
                        if (state.data.isNotEmpty) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ReservationItem(
                              orderId: state.data[index].orderId ?? 0,
                              image: state.data[index].image ?? '',
                              providerName: state.data[index].placeName ?? '',
                              showRate: state.data[index].rate! > 0,
                              rate: state.data[index].rate ?? 0,
                              location: state.data[index].location??'',
                            ),
                            separatorBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Divider(
                                color: Color(0xff5D34367F),
                                height: 3,
                                thickness: 1,
                              ),
                            ),
                            itemCount: state.data.length,
                            padding: EdgeInsets.only(
                                top: 0, bottom: 40, right: 20, left: 20),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: MyText(
                                title: 'لا يوجد طلبات',
                                size: 19,
                                color: MyColors.primary,
                                alien: TextAlign.center),
                          );
                        }
                      } else {
                        return SizedBox();
                      }
                    },
                  )
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: CircularProgressIndicator(color: MyColors.primary),
                  ));
          },
        )
      ]),
    );
  }
}
